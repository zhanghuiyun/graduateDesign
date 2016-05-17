package com.way.service.impl;

import java.util.List;
import java.util.TreeSet;

import org.hibernate.Hibernate;

import com.way.dao.RouteDao;
import com.way.dao.ScheduleDao;
import com.way.entity.Route;
import com.way.entity.Schedule;
import com.way.service.RouteService;

public class RouteServiceImpl implements RouteService {

	private RouteDao routeDao;
	
	private ScheduleDao scheduleDao;
	
	public ScheduleDao getScheduleDao() {
		return scheduleDao;
	}

	public void setScheduleDao(ScheduleDao scheduleDao) {
		this.scheduleDao = scheduleDao;
	}

	public RouteDao getRouteDao() {
		return routeDao;
	}

	public void setRouteDao(RouteDao routeDao) {
		this.routeDao = routeDao;
	}

	public void save(Route route, List<Schedule> schedules,List<String> views) {
		this.routeDao.save(route, schedules,views);
	}

	public List<Route> findRoutes(String state , int pageSize, int pageCurrent) {
		return this.routeDao.findRoutes(state, pageSize, pageCurrent);
	}

	//管理员路线审批通过路线 state 1 导游下线路线 state 2
	public void passOrOffRoute(String state,String routeId)  {
		this.routeDao.passOrOffRoute(state, routeId);
	}

	public void refuse(String routeId, String refuse) {
		this.routeDao.refuse(routeId, refuse);
	}

	public List<Route> findRoutesById(String userId, String state,
			int pageSize, int pageCurrent) {
		return this.routeDao.findRoutesById(userId, state, pageSize, pageCurrent);
	}

	public List<Route> findRoutesByViewId(String viewId) {
		return this.routeDao.findRoutesByViewId(viewId);
	}

	public int countFindRoutes(String state) {
		return this.routeDao.countFindRoutes(state);
	}

	public int countFindRoutesById(String userId, String state) {
		return this.routeDao.countFindRoutesById(userId, state);
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public Route findRouteByRouteId(String routeId) {
		Route route = this.routeDao.findRouteByRouteId(routeId);
		List<Schedule> list = this.scheduleDao.findByRouteId(routeId);
		route.setSchedules(new TreeSet(list));
//		Hibernate.initialize(route.getSchedules());
		return route;
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public Route findRouteDetail(String routeId) {
		Route route = this.routeDao.findRouteByRouteId(routeId);
		List<Schedule> list = this.scheduleDao.findByRouteId(routeId);
		route.setSchedules(new TreeSet(list));
		Hibernate.initialize(route.getUser());
		return route;
	}

	public List<Route> rankingRoute(int count) {
		return this.routeDao.rankingRoute(count);
	}

	public List<Route> mostTimeRoute(int count) {
		return this.routeDao.mostTimeRoute(count);
	}

}
