package com.way.dao.impl;

import java.util.List;
import com.way.dao.BaseDaoImpl;
import com.way.dao.ReserveDao;
import com.way.entity.Reserve;

public class ReserveDaoImpl extends BaseDaoImpl implements ReserveDao {

	//用户预约
	public void save(Reserve reserve) {
		super.getSession().save(reserve);
	}
	
	//对预约的操作
	public void passReserve(String reserveId,String state) {
		String hql = "update Reserve r set r.state=? where r.reserveId=?";
		super.getSession().createQuery(hql).setParameter(0, state).setParameter(1, reserveId).executeUpdate();
	}
	
	//拒绝预约
	public void refuseReserve(String reserveId, String refuse) {
		String hql ="update Reserve r set r.state=2,r.refuse=? where r.reserveId=?";
		super.getSession().createQuery(hql).setParameter(0, refuse)
			.setParameter(1, reserveId).executeUpdate();
	}

	//用户查看所有预约记录 
	@SuppressWarnings("unchecked")
	public List<Reserve> findAllReserveByUserId(String userId, int pageSize,
			int pageCurrent) {
		String hql = "from Reserve r where r.user.userId=? and r.delsoft=1 order by r.reserveTime desc";
		List<Reserve> list = super.getSession().createQuery(hql).setFirstResult((pageCurrent-1)*pageSize)
				.setMaxResults(pageSize).setParameter(0, userId).list();
		return list;
	}
	
	//用户查看预约记录  待受理0，预约成功1,拒绝2,取消3,已评价4,失信5
	@SuppressWarnings("unchecked")
	public List<Reserve> findReserveByUserId(String state,String userId, int pageSize,
			int pageCurrent) {
		String hql = "from Reserve r where r.user.userId=? and r.delsoft=1 and r.state=? order by r.reserveTime desc";
		List<Reserve> list = super.getSession().createQuery(hql).setFirstResult((pageCurrent-1)*pageSize)
				.setMaxResults(pageSize).setParameter(0, userId).setParameter(1, state).list();
		return list;
	}

	//导游查看所有预约记录
	@SuppressWarnings("unchecked")
	public List<Reserve> findAllReserveByRouteId(String userId, int pageSize,
			int pageCurrent) {
		StringBuffer hql = new StringBuffer("select r from Reserve r,Route rt,User u ");
		hql.append("where r.route.routeId=rt.routeId and rt.user.userId=u.userId ");
		hql.append("and u.userId=? order by r.reserveTime desc");
		List<Reserve> list = super.getSession().createQuery(hql.toString())
				.setFirstResult((pageCurrent-1)*pageSize).setMaxResults(pageSize).setParameter(0, userId).list();
		return list;
	}

	//导游查看预约记录  待受理0，预约成功1,拒绝2,取消3,已评价4,失信5
	@SuppressWarnings("unchecked")
	public List<Reserve> findReserveByRouteId(String state,String userId, int pageSize,
			int pageCurrent) {
		StringBuffer hql = new StringBuffer("select r from Reserve r,Route rt,User u ");
		hql.append("where r.route.routeId=rt.routeId and rt.user.userId=u.userId ");
		hql.append("and u.userId=? and r.state=? order by r.reserveTime desc");
		List<Reserve> list = super.getSession().createQuery(hql.toString()).setFirstResult((pageCurrent-1)*pageSize)
				.setMaxResults(pageSize).setParameter(0, userId).setParameter(1, state).list();
		return list;
	}

	//管理员查看所有预约记录
	@SuppressWarnings("unchecked")
	public List<Reserve> findAllReserve(int pageSize, int pageCurrent) {
		String hql = "from Reserve r order by r.reserveTime desc";
		List<Reserve> list = super.getSession().createQuery(hql)
				.setFirstResult((pageCurrent-1)*pageSize).setMaxResults(pageSize).list();
		return list;
	}
	
	//管理员查看预约记录  待受理0，预约成功1,拒绝2,取消3,已评价4,失信5
	@SuppressWarnings("unchecked")
	public List<Reserve> findReserve(String state,int pageSize, int pageCurrent) {
		String hql = "from Reserve r where r.state=? order by r.reserveTime desc";
		List<Reserve> list = super.getSession().createQuery(hql).setFirstResult((pageCurrent-1)*pageSize)
				.setMaxResults(pageSize).setParameter(0, state).list();
		return list;
	}
	
	//用户计算所有预约记录条数
	@SuppressWarnings("unchecked")
	public int countAllReserveByUserId(String userId) {
		String hql = "select r.reserveId from Reserve r where r.user.userId=? and r.delsoft=1";
		List<String> list = super.getSession().createQuery(hql).setParameter(0, userId).list();
		return list.size();
	}

	//用户计算各种状态预约记录条数
	@SuppressWarnings("unchecked")
	public int countReserveByUserId(String state, String userId) {
		String hql = "select r.reserveId from Reserve r where r.user.userId=? and r.delsoft=1 and r.state=?";
		List<String> list = super.getSession().createQuery(hql).setParameter(0, userId).setParameter(1, state).list();
		return list.size();
	}

	//导游计算所有预约记录条数
	@SuppressWarnings("unchecked")
	public int countAllReserveByRouteId(String userId) {
		StringBuffer hql = new StringBuffer("select r.reserveId from Reserve r,Route rt,User u ");
		hql.append("where r.route.routeId=rt.routeId and rt.user.userId=u.userId and u.userId=?");
		List<String> list = super.getSession().createQuery(hql.toString()).setParameter(0, userId).list();
		return list.size();
	}

	//导游计算各种状态预约记录条数
	@SuppressWarnings("unchecked")
	public int countReserveByRouteId(String state, String userId) {
		StringBuffer hql = new StringBuffer("select r.reserveId from Reserve r,Route rt,User u ");
		hql.append("where r.route.routeId=rt.routeId and rt.user.userId=u.userId ");
		hql.append("and u.userId=? and r.state=?");
		List<String> list = super.getSession().createQuery(hql.toString())
				.setParameter(0, userId).setParameter(1, state).list();
		return list.size();
	}

	//管理员计算所有预约记录条数
	@SuppressWarnings("unchecked")
	public int countAllReserve() {
		String hql = "select r.reserveId from Reserve r";
		List<String> list = super.getSession().createQuery(hql).list();
		return list.size();
	}

	//管理员计算各种状态预约记录条数
	@SuppressWarnings("unchecked")
	public int countReserve(String state) {
		String hql = "select r.reserveId from Reserve r where r.state=?";
		List<String> list = super.getSession().createQuery(hql).setParameter(0, state).list();
		return list.size();
	}

	public Reserve findReserveById(String reserveId) {
		String hql = "from Reserve r where r.reserveId=?";
		Reserve reserve = (Reserve) super.getSession().createQuery(hql).setParameter(0, reserveId).uniqueResult();
		return reserve;
	}

	public void deleteReserve(String reserveId) {
		String hql = "update Reserve r set r.delsoft=0 where r.reserveId=?";
		super.getSession().createQuery(hql).setParameter(0, reserveId).executeUpdate();
	}

}
