package com.way.dao.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import com.way.dao.BaseDaoImpl;
import com.way.dao.RouteDao;
import com.way.entity.Route;
import com.way.entity.RouteView;
import com.way.entity.Schedule;
import com.way.entity.View;

public class RouteDaoImpl extends BaseDaoImpl implements RouteDao {

	//发布路线（保存路线）
	@SuppressWarnings("unchecked")
	public void save(Route route,List<Schedule> schedules,List<String> views) {
		for(int i = 0 ; i < schedules.size() ; i++){
			schedules.get(i).setRoute(route);
			route.getSchedules().add(schedules.get(i));
		}
		for (int i = 0; i < views.size(); i++) {
			RouteView routeView = new RouteView();
			View view = new View();
			view.setViewId(views.get(i));
			routeView.setRoute(route);
			routeView.setView(view); 
			route.getRouteViews().add(routeView);
		}
		route.setDay(schedules.size());
		route.setNum(0);
		route.setTime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
		route.setState("0");
		super.getSession().save(route);
	}

	//查找审批过的路线1 未审批的路线0  下线2  拒绝3
	@SuppressWarnings("unchecked")
	public List<Route> findRoutes(String state , int pageSize, int pageCurrent){
		String hql = "from Route r where r.state=? order by r.time";
		List<Route> list = super.getSession().createQuery(hql.toString()).setFirstResult((pageCurrent-1)*pageSize)
				.setMaxResults(pageSize).setParameter(0, state).list();
		return list;
	}

	@SuppressWarnings("unchecked")
	public int countFindRoutes(String state) {
		String hql = "select r.routeId from Route r where r.state=? order by r.time";
		List<String> list = super.getSession().createQuery(hql.toString()).setParameter(0, state).list();
		return list.size();
	}

	//导游查找审批过的路线1 未审批的路线0  下线2  拒绝3
	@SuppressWarnings("unchecked")
	public List<Route> findRoutesById(String userId, String state,
			int pageSize, int pageCurrent) {
		String hql = "from Route r where r.user.userId=? and r.state=? order by r.time";
		List<Route> list = super.getSession().createQuery(hql.toString()).setFirstResult((pageCurrent-1)*pageSize)
				.setMaxResults(pageSize).setParameter(0, userId).setParameter(1, state).list();
		return list;
	}

	@SuppressWarnings("unchecked")
	public int countFindRoutesById(String userId, String state) {
		String hql = "select r.routeId from Route r where r.user.userId=? and r.state=? order by r.time";
		List<String> list = super.getSession().createQuery(hql.toString())
				.setParameter(0, userId).setParameter(1, state).list();
		return list.size();
	}

	//管理员路线审批通过路线 state 1 导游下线路线 state 2
	public void passOrOffRoute(String state,String routeId) {
		String hql = "update Route r set r.state=? where r.routeId=?";
		super.getSession().createQuery(hql).setParameter(0, state)
			.setParameter(1, routeId).executeUpdate();
	}

	//管理员路线审批不通过
	public void refuse(String routeId,String refuse) {
		String hql = "update Route r set r.state=3,r.refuse=? where r.routeId=?";
		super.getSession().createQuery(hql).setParameter(0, refuse)
			.setParameter(1, routeId).executeUpdate();
	}

	//根据景点查找相关的路线
	@SuppressWarnings("unchecked")
	public List<Route> findRoutesByViewId(String viewId) {
		StringBuffer hql = new StringBuffer("select r from Route r,RouteView rv where ");
		hql.append("r.routeId=rv.route.routeId and rv.view.viewId=?");
		List<Route> list = super.getSession().createQuery(hql.toString())
				.setParameter(0, viewId).list();
		return list;
	}

	public Route findRouteByRouteId(String routeId) {
		String hql = "from Route r where r.routeId=?";
		Route route = (Route) super.getSession().createQuery(hql.toString())
				.setParameter(0, routeId).uniqueResult();
		return route;
	}

	@SuppressWarnings("unchecked")
	public List<Route> rankingRoute(int count) {
		String hql = "from Route r order by r.grade desc";
		List<Route> list = super.getSession().createQuery(hql.toString())
		.setFirstResult(0).setMaxResults(count).list();
		return list;
	}

	@SuppressWarnings("unchecked")
	public List<Route> mostTimeRoute(int count) {
		String hql = "from Route r order by r.num desc";
		List<Route> list = super.getSession().createQuery(hql.toString())
		.setFirstResult(0).setMaxResults(count).list();
		return list;
	}

	public void setRouteGrade(String routeId, double grade) {
		StringBuffer hql = new StringBuffer("update Route r set r.grade=(r.grade+?)/2.0 ");
		hql.append("where r.routeId=(select rs.route.routeId from Reserve rs where rs.reserveId=?)");
		super.getSession().createQuery(hql.toString()).setParameter(0, grade)
		.setParameter(1, routeId).executeUpdate();
	}


}
