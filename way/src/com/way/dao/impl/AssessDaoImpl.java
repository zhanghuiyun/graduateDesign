package com.way.dao.impl;

import java.util.List;

import com.way.dao.AssessDao;
import com.way.dao.BaseDaoImpl;
import com.way.entity.Assess;

@SuppressWarnings("rawtypes")
public class AssessDaoImpl extends BaseDaoImpl implements AssessDao {

	public void saveAssess(Assess assess) {
		super.getSession().save(assess);
	}

	//key 全部评价0   好评 1 中评 2  差评 3
	@SuppressWarnings("unchecked")
	public List<Assess> findAssess(String routeId, int pageSize, int pageCurrent,String key) {
		StringBuffer hql = new StringBuffer();
		hql.append("select a ");
		hql.append("from Assess a,Reserve rs,Route r ");
		hql.append("where a.reserve.reserveId=rs.reserveId ");
		hql.append("and rs.route.routeId=r.routeId ");
		if(key.equals("1")){
			hql.append("and (a.route_1+a.service)/2.0 between 8 and 10 ");
		}else if(key.equals("2")){
			hql.append("and (a.route_1+a.service)/2.0 between 6 and 8 ");
		}else if(key.equals("3")){
			hql.append("and (a.route_1+a.service)/2.0 between 0 and 6 ");
		}else{
			hql.append("");
		}
		hql.append("and r.routeId=? ");
		hql.append("order by a.assessTime desc");
		List<Assess> list = super.getSession().createQuery(hql.toString()).setFirstResult((pageCurrent-1)*pageSize)
		.setMaxResults(pageSize).setParameter(0, routeId).list();
		return list;
	}

	@SuppressWarnings("unchecked")
	public int countAssess(String routeId,String key) {
		StringBuffer hql = new StringBuffer();
		hql.append("select a.assessId ");
		hql.append("from Assess a,Reserve rs,Route r ");
		hql.append("where a.reserve.reserveId=rs.reserveId ");
		hql.append("and rs.route.routeId=r.routeId ");
		if(key.equals("1")){
			hql.append("and (a.route_1+a.service)/2.0 between 8 and 10 ");
		}else if(key.equals("2")){
			hql.append("and (a.route_1+a.service)/2.0 between 6 and 8 ");
		}else if(key.equals("3")){
			hql.append("and (a.route_1+a.service)/2.0 between 0 and 6 ");
		}else{
			hql.append("");
		}
		hql.append("and r.routeId=? ");
		List<String> list = super.getSession().createQuery(hql.toString()).setParameter(0, routeId).list();
		return list.size();
	}

}
