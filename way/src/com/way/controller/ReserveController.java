package com.way.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;
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
import com.way.entity.Reserve;
import com.way.entity.ReserveView;
import com.way.entity.Route;
import com.way.entity.TouristView;
import com.way.entity.User;
import com.way.entity.View;
import com.way.entity.ViewMapper;
import com.way.entity.po.Tourist;
import com.way.service.AssessService;
import com.way.service.ReserveService;
import com.way.service.TouristReserveService;
import com.way.service.TouristService;
import com.way.utils.CountTime;
import com.way.utils.OrderNumber;
import com.way.utils.PageBean;

@RequestMapping("reserveController")
@Controller
public class ReserveController {

	private static final Logger LOGGER = LogManager.getLogger(ReserveController.class);
	
	@Autowired
	private ReserveService reserveService;
	
	@Autowired
	private AssessService assessService;
	
	@Autowired
	private TouristService touristService;
	
	@Autowired
	private TouristReserveService touristReserveService;
	
	@ResponseBody
	@RequestMapping("saveTourist")
	public Object saveTourist(@RequestBody Tourist tourist, HttpSession session){
		touristService.saveTourist((User)session.getAttribute("user"), tourist.getTouristName(), tourist.getTouristTele(), tourist.getTouristIdNum());
		JSONObject json = new JSONObject();
		json.put("result", "success");
		json.put("msg", "保存成功");
		return json;
	}
	
	@ResponseBody
	@RequestMapping("getTourist")
	public List<TouristView> getTourist(HttpSession session){
		List<TouristView> list = touristService.findTouristsByUser((User)session.getAttribute("user"));
		return list;
	}
	
	//游客进行预约
	@RequestMapping(value="order",method=RequestMethod.POST)
	public String order(Reserve reserve,Route route,
			@RequestParam("touristName") String[] names, 
			@RequestParam("touristTele") String[] teles,
			@RequestParam("touristIdNum") String[] idNums,
			HttpSession session,
			HttpServletRequest request){
		
		User user = (User) session.getAttribute("user");
		String reserveTime = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
		double total = reserve.getPrice()*(reserve.getAdultNum()+reserve.getChildNum()/2.0);
		reserve.setRoute(route);
		reserve.setUser(user);
		reserve.setReserveTime(reserveTime);
		reserve.setTotal(total);
		reserve.setState("0");
		reserve.setDelsoft("1");
		reserve.setReserveNumber(OrderNumber.getOrderNumber());//设置订单编号
		reserve.setGuideName(route.getUserName());
		reserve.setRouteName(route.getRouteName());
		this.reserveService.save(reserve);
		List<Tourist> list = new ArrayList<Tourist>();
		for(int i = 0; i < names.length; i++){
			if(touristService.isExistTourist(user, names[i], teles[i], idNums[i])){
				list.add(new Tourist(user, names[i], teles[i], idNums[i]));
				continue;
			} else {
				list.add(new Tourist(user, names[i], teles[i], idNums[i]));
				touristService.saveTourist(user, names[i], teles[i], idNums[i]);
			}
		}
		touristReserveService.save(reserve, list);
		
		LOGGER.info("游客 "+user.getUserName()+" 对路线 "+route.getRouteName()+" 预约成功！");
		
		//findReserve(session, 1, 5, "0", request,"0");
		request.setAttribute("gowhere", "reserve");	//中间页
		return "go";
	}
	
	//游客取消预约 state 3   导游预约 state 1  导游确定失信 state 5  导游拒绝预约
	@RequestMapping(value="operateOrder",method={RequestMethod.POST,RequestMethod.GET})
	public String operateOrder(String reserveId,HttpSession session,String state,
			@RequestParam(value="reserveRole",defaultValue="0")String reserveRole,
			@RequestParam(value="pageCurrent",defaultValue="1")int pageCurrent,
			@RequestParam(value="pageSize",defaultValue="5")int pageSize,
			HttpServletRequest request,String starTime,String refuse)
					throws ParseException{
		if(state.equals("3")){  //用户取消预约
			System.out.println("==========="+reserveId+"============"+starTime);
			int day = CountTime.subtract(starTime);//计算出游时间与现在使劲的时间差
			if(day<=1){ 
				request.setAttribute("error", "距离您的出游时间不足24小时，不能取消预约！");
				return findReserve(session, pageCurrent, pageSize, "1", request,reserveRole);//用户取消订单状态为 3
			}else{
				this.reserveService.passReserve(reserveId,state);
				LOGGER.info("游客取消了预约："+reserveId);
			}
		}else if(state.equals("1")){  //导游确定与游客进行预约
			this.reserveService.passReserve(reserveId,state);
			LOGGER.info("导游确定一条预约："+reserveId);
		}else if(state.equals("5")){  //导游确定游客失约
			int day = CountTime.subtract(starTime);
			if(day>-1){
				request.setAttribute("error", "没有超过出游时间24小时，不能确认游客失约！");
			}else if(day<-10){
				request.setAttribute("error", "已经超过出游10天，不能确认游客失约！");
			}else{
				this.reserveService.passReserve(reserveId,state);
				LOGGER.info("导游确定游客失约："+reserveId);
				return findReserve(session, pageCurrent, pageSize, state, request,reserveRole);//返回之前的页面
			}
		}else{
			if(refuse!=null){
				this.reserveService.refuseReserve(reserveId, refuse);
				LOGGER.info("导游拒绝预约："+reserveId+" 拒绝理由："+refuse);
				return findReserve(session, pageCurrent, pageSize, "2", request,"1");//返回之前的页面
			}else{
				request.setAttribute("error", "操作不正确!");
			}
		}
		return findReserve(session, pageCurrent, pageSize, "0", request,reserveRole);//返回之前的页面
	}
	
	//游客删除一条预约
	@RequestMapping(value="deleteOrder")
	public String deleteOrder(String reserveId,HttpSession session,String state,
			@RequestParam(value="reserveRole",defaultValue="0")String reserveRole,
			@RequestParam(value="pageCurrent",defaultValue="1")int pageCurrent,
			@RequestParam(value="pageSize",defaultValue="8")int pageSize,
			HttpServletRequest request){
		this.reserveService.deleteReserve(reserveId);
		touristReserveService.deleteByReserveId(reserveId);
		LOGGER.info("游客删除了一条预约："+reserveId);
		return findReserve(session, pageCurrent, pageSize, state, request,reserveRole);
	}
	
	//用户(包括导游)查看预约记录  //导游查看预约  如果reserveRole为 0 表示查看自己的预约 为 1 表示导游查看游客与他的预约
	@RequestMapping(value="findReserve")
	public String find(HttpSession session,String state,
			@RequestParam(value="reserveRole",defaultValue="0")String reserveRole,
			@RequestParam(value="pageCurrent",defaultValue="1")int pageCurrent,
			@RequestParam(value="pageSize",defaultValue="8")int pageSize,
			HttpServletRequest request){
		return findReserve(session, pageCurrent, pageSize, state, request,reserveRole);
	}
	
	public String findReserve(HttpSession session,int pageCurrent,int pageSize,
			String state,HttpServletRequest request,String reserveRole){
		
		User user  = (User) session.getAttribute("user");
		String userId = user.getUserId();
		List<Reserve> list = null;
		int totalRows = 0; //分页的总行数
		
		if(reserveRole.equals("0")){//所有用户查看预约
			if(state.equals("6")){//如果state为空，表示查找所有的预约
				list = this.reserveService.findAllReserveByUserId(userId, pageSize, pageCurrent);
				totalRows = this.reserveService.countAllReserveByUserId(userId);
			}else{			
				list = this.reserveService.findReserveByUserId(state, userId, pageSize, pageCurrent);
				totalRows = this.reserveService.countReserveByUserId(state, userId);
			}
		}
		if(reserveRole.equals("1")){//导游查看预约
			if(state.equals("6")){//如果state为空，表示查找所有的预约
				list = this.reserveService.findAllReserveByRouteId(userId, pageSize, pageCurrent);
				totalRows = this.reserveService.countAllReserveByRouteId(userId);
			}else{
				list = this.reserveService.findReserveByRouteId(state, userId, pageSize, pageCurrent);
				totalRows = this.reserveService.countReserveByRouteId(state, userId);
			}
		}
		
		PageBean pageBean = new PageBean(totalRows,pageSize,pageCurrent,list);
		request.setAttribute("page_list", pageBean);
		request.setAttribute("state", state);
		request.setAttribute("reserveRole", reserveRole);//区别导游的我的预约和预约管理
		return "user/reserve";
	}
	
	@Autowired
	private ViewMapper<ReserveView,Reserve> reserveMapper;
	
	@ResponseBody
	@RequestMapping(value="findReserveById")
	public ReserveView findReserveById(String reserveId){
		Reserve reserve = this.reserveService.findReserveById(reserveId);
		ReserveView reserveView = this.reserveMapper.mapping(reserve);
		return reserveView;
	}
	
	@ResponseBody
	@RequestMapping(value="findTouristByReserveId")
	public List<TouristView> findTouristByReserveId(String reserveId){
		return touristService.findTouristsByReserveId(reserveId);
	}
	
	//用户提交一次评价
	@SuppressWarnings({ "unchecked", "deprecation" })
	@ResponseBody
	@RequestMapping(value="evaluate",method=RequestMethod.POST)
	public Object evaluate(@RequestBody Map<String,Object> param,
			@RequestParam(value="reserveRole",defaultValue="0")String reserveRole,
			HttpSession session,HttpServletRequest request){
		User user = (User) session.getAttribute("user");
		String reserveId = (String) param.get("reserveId");
		Assess assess = (Assess)JSONObject.toBean(JSONObject.fromObject(param.get("assess")),Assess.class);
		List<View> views = JSONArray.toList(JSONArray.fromObject(param.get("view")), View.class);
		this.assessService.saveAssess(assess,reserveId,user,views);
		LOGGER.info("评价提交成功！"+param);
//		return findReserve(session, 1, 5, "1", request,reserveRole);
		JSONObject json = new JSONObject();
		json.put("result", "success");
		json.put("msg", "评价成功");
		return json;
	}
	
}
