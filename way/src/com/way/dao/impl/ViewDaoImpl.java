package com.way.dao.impl;

import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.hibernate.Session;

import com.way.dao.BaseDaoImpl;
import com.way.dao.ViewDao;
import com.way.entity.View;

public class ViewDaoImpl extends BaseDaoImpl implements ViewDao {

	//新增或者修改景点
	public void saveOrUpdate(View view) {
		super.getSession().saveOrUpdate(view);
	}

	//分页查找景点
	@SuppressWarnings("unchecked")
	public List<View> findViews(int pageSize, int pageCurrent) {
		String hql = "from View v order by v.viewName";
		List<View> list = super.getSession().createQuery(hql.toString())
		.setFirstResult((pageCurrent-1)*pageSize).setMaxResults(pageSize).list();
		return list;
	}

	@SuppressWarnings("unchecked")
	public int countFindViews() {
		String hql = "select v.viewId from View v";
		List<String> list = super.getSession().createQuery(hql.toString()).list();
		return list.size();
	}
	
	//分页根据关键字查找景点（景点名称，景点地址，景点描述）
	@SuppressWarnings("unchecked")
	public List<View> findViewsByKey(int pageSize,
			int pageCurrent, String key) {
		StringBuffer hql = new StringBuffer("from View v where v.viewName like :key or ");
		hql.append("v.viewAddress like :key or v.viewRemark like :key order by v.viewName");
		List<View> list = super.getSession().createQuery(hql.toString())
		.setFirstResult((pageCurrent-1)*pageSize).setMaxResults(pageSize)
		.setParameter("key", "%"+key+"%").list();
		return list;
	}
	
	@SuppressWarnings("unchecked")
	public int countViewsByKey(String key) {
		StringBuffer hql = new StringBuffer("select v.viewId from View v where v.viewName like :key or ");
		hql.append("v.viewAddress like :key or v.viewRemark like :key");
		List<String> list = super.getSession().createQuery(hql.toString())
				.setParameter("key", "%"+key+"%").list();
		return list.size();
	}

	//根据路线查找相关景点
	@SuppressWarnings("unchecked")
	public List<View> findViewByRouteId(String routeId) {
		StringBuffer hql = new StringBuffer("select v from View v,RouteView rv where v.viewId=");
		hql.append("rv.view.viewId and rv.route.routeId=? order by v.viewName");
		List<View> list = super.getSession().createQuery(hql.toString()).setParameter(0, routeId).list();
		return list;
	}

	//发布路线时，取得所有景点名称
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> findViewNames() {
		String hql = "select new Map(v.viewId as viewId,v.viewName as viewName) from View v order by v.viewName";
		List<Map<String, Object>> list = super.getSession().createQuery(hql.toString()).list();
		return list;
	}

	//评价时，根据预约id查询 景点
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> findViewByReserveId(String reserveID) {
		StringBuffer hql = new StringBuffer("select new Map(v.viewId as viewId,v.viewName as viewName) ");
			hql.append("from View v,Reserve rs,Route r,RouteView rv where rs.route.routeId=r.routeId ");	
			hql.append("and r.routeId=rv.route.routeId and rv.view.viewId=v.viewId");
			hql.append(" and rs.reserveId=? order by v.viewName");
		List<Map<String, Object>> list = super.getSession().createQuery(hql.toString())
				.setParameter(0, reserveID).list();
		return list;
	}

	//根据景点id查找景点信息
	public View findViewByViewId(String viewId) {
		String hql = "from View v where v.viewId=?";
		View view = (View) super.getSession().createQuery(hql.toString())
				.setParameter(0, viewId).uniqueResult();
		return view;
	}

	//查询按分数从高到低的指定条数景点
	@SuppressWarnings("unchecked")
	public List<View> rankingView(int count) {
		String hql = "from View v order by v.viewGrade desc";
		List<View> list = super.getSession().createQuery(hql)
		.setFirstResult(0).setMaxResults(count).list();
		return list;
	}

	@SuppressWarnings("unchecked")
	public List<View> mostTimeView(int count) {
		String hql = "from View v order by v.viewNum desc";
		List<View> list = super.getSession().createQuery(hql)
		.setFirstResult(0).setMaxResults(count).list();
		return list;
	}

	public void setViewGrade(String viewId, Double viewGrade) {
		String hql = "update View v set v.viewGrade=(v.viewGrade+:viewGrade)/2.0 where v.viewId=:viewId";
		Query query = super.getSession().createQuery(hql);
		query.setParameter("viewGrade", viewGrade);
		query.setParameter("viewId", viewId);
		query.executeUpdate();
	}

	public void updateView(View view) {
		Session session =  super.getSession();
		View newView = (View) session.load(View.class, view.getViewId());
		newView.setViewName(view.getViewName());
		newView.setViewAddress(view.getViewAddress());
		newView.setViewRemark(view.getViewRemark());
		newView.setViewRecommend(view.getViewRecommend());
		session.update(newView);
	}

}
