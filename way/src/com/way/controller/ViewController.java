package com.way.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import com.way.entity.Route;
import com.way.entity.View;
import com.way.entity.ViewMapper;
import com.way.entity.ViewView;
import com.way.service.RouteService;
import com.way.service.ViewService;
import com.way.utils.PageBean;
import com.way.utils.UploadImg;

@RequestMapping("viewController")
@Controller
public class ViewController {

	private static final Logger LOGGER = LogManager.getLogger(ViewController.class);
	
	@Autowired
	private ViewService viewService;
	
	@Autowired
	private RouteService routeService;
	
	//分页查找景点
	@RequestMapping(value="findViews")
	public String findViews(HttpServletRequest request,
			@RequestParam(value="pageCurrent",defaultValue="1")int currentPage,
			@RequestParam(value="rowsPage",defaultValue="8")int rowsPage){
		views(rowsPage,currentPage,request);
		return "admin/allView";
	}
	
	//分页根据关键字查找景点（景点名称，景点地址，景点描述）
	@RequestMapping(value="findAllViews")
	public String findAllViews(@RequestParam(value="pageCurrent",defaultValue="1")int currentPage,
			HttpServletRequest request){
		List<View> list;
		int totalRows ;
		int pageSize = 16;
		list = this.viewService.findViews(pageSize, currentPage);
		totalRows = this.viewService.countFindViews();
		
		PageBean pageBean = new PageBean(totalRows,pageSize,currentPage,list);
		request.setAttribute("page_list", pageBean);
		return "views";
	}
	
	//分页根据关键字查找景点（景点名称，景点地址，景点描述）
	@RequestMapping(value="findViewsByKey",method=RequestMethod.POST)
	public String findViewsByKey(@RequestParam(value="pageCurrent",defaultValue="1")int currentPage,
			String key,HttpServletRequest request){
		List<View> list;
		int totalRows ;
		int pageSize = 16;
		if(key!=null && !key.equals("")){
			list = this.viewService.findViewsByKey(pageSize, currentPage, key);
			totalRows = this.viewService.countViewsByKey(key);
		}else{
			list = this.viewService.findViews(pageSize, currentPage);
			totalRows = this.viewService.countFindViews();
		}

		
		PageBean pageBean = new PageBean(totalRows,pageSize,currentPage,list);
		request.setAttribute("page_list", pageBean);
		return "views";
	}
	
	//管理员发布或
	@RequestMapping(value="morefileuplaod" ,method=RequestMethod.POST)
	public String morefileuplaod(HttpServletRequest request,View view,
			@RequestParam("file") MultipartFile[] imgefile) {
		System.out.println("多文件上传方法");
		List<String> list = new ArrayList<String>();
		for(MultipartFile m:imgefile){
			list.add(UploadImg.uploadImg(m, request));// 上传图片，并返回图片新名称
		}
		view.setViewPicture(list.toString());
		view.setViewNum(0);
		view.setViewGrade(8);
		LOGGER.info("新增了一条景点信息"+view);
		this.viewService.saveOrUpdate(view);
		
		request.setAttribute("gowhere", "view");	//中间页
		return "go";
	}
	
	//修改景点
	@RequestMapping(value="updateView",method=RequestMethod.POST)
	public String updateView(HttpServletRequest request,View view){
		this.viewService.updateView(view);
		LOGGER.info("更新了一条景点信息"+view);
		views(5,1,request);
		return "admin/allView";
	}
	
	//管理员查看景点分页
	public void views(int rowsPage,int currentPage,HttpServletRequest request){
		List<View> list = this.viewService.findViews(rowsPage, currentPage);
		int totalRows = this.viewService.countFindViews();
		
		PageBean pageBean = new PageBean(totalRows,rowsPage,currentPage,list);
		request.setAttribute("page_list", pageBean);
	}
	
	//发布路线时，取得所有景点名称
	@ResponseBody
	@RequestMapping(value="findViewNames")
	public List<Map<String, Object>> findViewNames(){
		List<Map<String, Object>> list = this.viewService.findViewNames();
		return list;
	}

	//评价时，根据预约id查询 景点
	@ResponseBody
	@RequestMapping(value="findViewByReserveId")
	public List<Map<String, Object>> findViewByReserveId(String reserveId){
		List<Map<String, Object>> list = this.viewService.findViewByReserveId(reserveId);
		return list;
	}
	
	//景点详情页面
	@RequestMapping(value="findViewDetail")
	public String findViewDetail(String viewId,HttpServletRequest request){
		View view = this.viewService.findViewByViewId(viewId);
		List<Route> list = this.routeService.findRoutesByViewId(viewId);
		request.setAttribute("view", view);
		request.setAttribute("list",list);
		return "view-details";
	}
	
	@Resource(name="viewViewMapper")
	private ViewMapper<ViewView, View> viewMapper;
	
	@ResponseBody
	@RequestMapping(value="findViewByViewId")
	public Object findViewByViewId(String viewId){
		View view = this.viewService.findViewByViewId(viewId);
		ViewView viewView = this.viewMapper.mapping(view);
		return viewView;
	}
	
}
