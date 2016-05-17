package com.way.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import com.way.dao.AssessDao;
import com.way.dao.ReserveDao;
import com.way.dao.RouteDao;
import com.way.dao.ViewDao;
import com.way.entity.Assess;
import com.way.entity.Reserve;
import com.way.entity.User;
import com.way.entity.View;
import com.way.service.AssessService;

public class AssessServiceImpl implements AssessService {

	private AssessDao assessDao;
	
	private ReserveDao reserveDao;
	
	private RouteDao routeDao;
	
	private ViewDao viewDao;
	
	public AssessDao getAssessDao() {
		return assessDao;
	}

	public void setAssessDao(AssessDao assessDao) {
		this.assessDao = assessDao;
	}
	
	public ReserveDao getReserveDao() {
		return reserveDao;
	}

	public void setReserveDao(ReserveDao reserveDao) {
		this.reserveDao = reserveDao;
	}
	
	public RouteDao getRouteDao() {
		return routeDao;
	}

	public void setRouteDao(RouteDao routeDao) {
		this.routeDao = routeDao;
	}

	public ViewDao getViewDao() {
		return viewDao;
	}

	public void setViewDao(ViewDao viewDao) {
		this.viewDao = viewDao;
	}

	public void saveAssess(Assess assess,String reserveId,
			User user,List<View> views) {
		Reserve reserve = new Reserve();
		reserve.setReserveId(reserveId);
		
		assess.setUser(user);
		assess.setReserve(reserve);
		String assessTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
		assess.setAssessTime(assessTime);
		this.assessDao.saveAssess(assess);
		this.reserveDao.passReserve(reserve.getReserveId(),"4");//把预约状态改为已评价
		for (int i = 0; i < views.size(); i++) {
			View view = views.get(i);
			this.viewDao.setViewGrade(view.getViewId(), view.getViewGrade()); //给静景点打分
		}
		this.routeDao.setRouteGrade(reserve.getReserveId(), //给路线打分
				(assess.getService()+assess.getRoute_1())/2.0); //服务与路线的平均分
	}

	public List<Assess> findAssess(String routeId, int pageSize,
			int pageCurrent,String key) {
		return this.assessDao.findAssess(routeId, pageSize, pageCurrent,key);
	}

	public int countAssess(String routeId,String key) {
		return this.assessDao.countAssess(routeId,key);
	}

}
