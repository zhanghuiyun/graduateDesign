package com.way.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.way.entity.Assess;
import com.way.entity.PublicRoute;
import com.way.entity.Route;
import com.way.entity.Schedule;
import com.way.entity.User;
import com.way.entity.View;
import com.way.entity.po.Tourist;
import com.way.service.AssessService;
import com.way.service.RouteService;
import com.way.service.TouristService;
import com.way.service.ViewService;
import com.way.utils.IndexBean;
import com.way.utils.PageBean;
import com.way.utils.ParamUtils;

@RequestMapping(value="routeController")
@Controller
public class RouteController {

	private static final Logger LOGGER = LogManager.getLogger(RouteController.class);

	@Autowired
	private RouteService routeService;
	
	@Autowired
	private ViewService viewService;
	
	@Autowired
	private AssessService assessService;
	
	@Autowired
	private TouristService touristService;
	
	// 导游发布路线
	@ResponseBody
	@RequestMapping(value = "publishRoute", method = RequestMethod.POST)
	public Object publishRoute(@RequestBody PublicRoute publicRoute,HttpSession session) {
		User user = (User) session.getAttribute("user");
		Route route = publicRoute.getRoute();
		route.setUser(user);
		route.setUserName(user.getUserName());
		List<Schedule> schedules = publicRoute.getSchedules();
		List<String> viewId = publicRoute.getViewId();
		this.routeService.save(route, schedules, viewId);
		LOGGER.info("导游发布路线 ID:" + publicRoute);
		JSONObject json = new JSONObject();
		json.put("result", "success");
		json.put("msg", "发布成功");
		return json;
	}
	
	//根据路线id取得路线信息
	@RequestMapping(value="findRouteByRouteId")
	public String findRouteByRouteId(String routeId,HttpServletRequest request){
		Route route = this.routeService.findRouteByRouteId(routeId);
		request.setAttribute("route", route);
		return "admin/checkRoute";
	}
	
	@RequestMapping(value="findRouteToReserve")
	public String findRouteToReserve(Map<String, Object> map, String routeId,HttpServletRequest request){
		Route route = this.routeService.findRouteByRouteId(routeId);
		//List<Tourist> tourists = touristService.findTouristsByUser((User)request.getSession().getAttribute("user"));
		/*request.setAttribute("route", route);*/
		map.put("route", route);
		//map.put("tourists", tourists);
		return "user/orderConfirm";
	}
	
	/**
	 * 根据路线id取得路线的详细信息
	 * @param routeId
	 * @param request
	 * @param pageCurrent
	 * @param pageSize
	 * @param key 全部评价0   好评 1 中评 2  差评 3
	 * @return
	 */
	@RequestMapping(value="findRouteDetal")
	public String findRouteDetail(String routeId,HttpServletRequest request,
			@RequestParam(value="pageCurrent",defaultValue="1")int pageCurrent,
			@RequestParam(value="pageSize",defaultValue="5")int pageSize,
			@RequestParam(value="key",defaultValue="0")String key){
		
		Route route = this.routeService.findRouteDetail(routeId);//查找线路详情（线路，行程，商家信息）
		request.setAttribute("route", route);
		
		List<View> views = this.viewService.findViewByRouteId(routeId);//查找景点信息
		request.setAttribute("views", views);
		
		//分页显示评价信息
		List<Assess> list = this.assessService.findAssess(routeId, pageSize, pageCurrent,key);
		
		int totalRows = this.assessService.countAssess(routeId,key);
		PageBean pageBean = new PageBean(totalRows, pageSize, pageCurrent, list);
		request.setAttribute("page_list", pageBean);
		request.setAttribute("key", key);
		return "routeDetail";
	}

	// 管理员审核路线(通过) 管理员路线审批通过路线 state 1 审核不通过 3
	@RequestMapping(value = "/applyRoute")
	public String applyRoute(String routeId, String refuse,
			HttpServletRequest request, HttpSession session, String state,
			@RequestParam(value = "pageCurrent", defaultValue = "1") int pageCurrent,
			@RequestParam(value = "rowsPage", defaultValue = "8") int pageSize) {
		if(state.equals("3")){
			this.routeService.refuse(routeId, refuse);
			LOGGER.info("管理员审批拒绝一条路线，路线ID:" + routeId + " 拒绝理由：" + refuse);
		}else{
			this.routeService.passOrOffRoute(state, routeId);
			LOGGER.info("管理员审批通过一条路线"+state+" 路线ID:" + routeId);
		}
		routes(request, session, "0", pageCurrent, pageSize);//审批过后，返回之前待审批状态页面
		request.setAttribute("state", state);
		System.out.println("============="+state);
		if(state.equals("1")){
			return "redirect:/routeController/findRoutes?state=1";
		}else if(state.equals("2")){
			return "redirect:/routeController/findRoutes?state=2";
		}else{
			return "user/allRoute";
		}
		
		//return "user/allRoute";http://localhost:8080/way/routeController/findRoutes?state=1
	}
	
	//导游下线路线 state 2 
	@RequestMapping(value="offRoute")
	public String offRoute(String routeId, String state,
			HttpServletRequest request, HttpSession session,
			@RequestParam(value = "pageCurrent", defaultValue = "1") int pageCurrent,
			@RequestParam(value = "rowsPage", defaultValue = "8") int pageSize){
		this.routeService.passOrOffRoute(state, routeId);
		routes(request, session, "1", pageCurrent, pageSize);//下线后，返回之前已审批状态页面
		return "user/allRoute";
	}

	//查看所有路线
	@RequestMapping(value = "/findRoutes")
	public String findRoutes(HttpServletRequest request,HttpSession session,
			@RequestParam(value = "state", defaultValue = "0") String state,
			@RequestParam(value = "pageCurrent", defaultValue = "1") int pageCurrent,
			@RequestParam(value = "pageSize", defaultValue = "8") int pageSize) {
		routes(request, session, state, pageCurrent, pageSize);
		return "user/allRoute";
	}

	public void routes(HttpServletRequest request, HttpSession session,
			String state, int pageCurrent, int pageSize) {
		User user = (User) session.getAttribute("user");
		List<Route> list = null;
		int totalRows = 0;
		if (user.getRole().equals("2")) {  //管理员查看所有路线
			list = this.routeService.findRoutes(state, pageSize, pageCurrent);
			totalRows = this.routeService.countFindRoutes(state);
		} else {                             //导游查看自己发布的路线
			list = this.routeService.findRoutesById(user.getUserId(), state,
					pageSize, pageCurrent);
			totalRows = this.routeService.countFindRoutesById(user.getUserId(),
					state);
		}
		PageBean pageBean = new PageBean(totalRows, pageSize, pageCurrent, list);
		request.setAttribute("page_list", pageBean);
		request.setAttribute("state", state);// 对路线操作后返回之前的状态
	}
	
	@RequestMapping(value="index")
	public String mostTimeRoute(HttpServletRequest request){
		int mostRouteCount = Integer.valueOf(ParamUtils.getInstance().getValue("param.route.mostTime"));
		List<Route> mostRouteList = this.routeService.mostTimeRoute(mostRouteCount);
		
		int rankRouteCount = Integer.valueOf(ParamUtils.getInstance().getValue("param.route.ranking"));
		List<Route> rankRouteList = this.routeService.rankingRoute(rankRouteCount);
		
		int rankViewCount = Integer.valueOf(ParamUtils.getInstance().getValue("param.view.ranking"));
		List<View> rankViewList = this.viewService.rankingView(rankViewCount);
		
		int mostViewCount = Integer.valueOf(ParamUtils.getInstance().getValue("param.view.mostTime"));
		List<View> mostViewList = this.viewService.mostTimeView(mostViewCount);
		
		IndexBean indexBean = new IndexBean();
		indexBean.setMostRouteList(mostRouteList);
		indexBean.setRankRouteList(rankRouteList);
		indexBean.setMostViewList(mostViewList);
		indexBean.setRankViewList(rankViewList);
		request.setAttribute("indexBean", indexBean);
		return "index";
	}
}
