package com.way.service.impl;

import java.util.List;

import com.way.dao.ReserveDao;
import com.way.entity.Reserve;
import com.way.service.ReserveService;

public class ReserveServiceImpl implements ReserveService {

	private ReserveDao reserveDao;
	
	public ReserveDao getReserveDao() {
		return reserveDao;
	}

	public void setReserveDao(ReserveDao reserveDao) {
		this.reserveDao = reserveDao;
	}

	//用户预约
	public void save(Reserve reserve){
		this.reserveDao.save(reserve);
	}
	
	//预约成功 1  用户取消预约3   用户评价 4  导游确认游客失信 5
	public void passReserve(String reserveId,String state){
		this.reserveDao.passReserve(reserveId,state);
	}
	
	//拒绝预约
	public void refuseReserve(String reserveId,String refuse){
		this.reserveDao.refuseReserve(reserveId, refuse);
	}
	
	//用户删除一条预约
	public void deleteReserve(String reserveId){
		this.reserveDao.deleteReserve(reserveId);
	}
	
	//用户查看所有预约记录
	public List<Reserve> findAllReserveByUserId(String userId,int pageSize, int pageCurrent){
		return this.reserveDao.findAllReserveByUserId(userId, pageSize, pageCurrent);
	}
	
	//用户查看预约记录  待受理0，预约成功1,拒绝2,取消3,已评价4,失信5
	public List<Reserve> findReserveByUserId(String state,String userId,int pageSize, int pageCurrent){
		return this.reserveDao.findReserveByUserId(state, userId, pageSize, pageCurrent);
	}

	//导游查看所有预约记录
	public List<Reserve> findAllReserveByRouteId(String userId,int pageSize, int pageCurrent){
		return this.reserveDao.findAllReserveByRouteId(userId, pageSize, pageCurrent);
	}
	
	//导游查看预约记录  待受理0，预约成功1,拒绝2,取消3,已评价4,失信5
	public List<Reserve> findReserveByRouteId(String state,String userId,int pageSize, int pageCurrent){
		return this.reserveDao.findReserveByRouteId(state,userId, pageSize, pageCurrent);
	}
	
	//管理员查看所有预约记录
	public List<Reserve> findAllReserve(int pageSize, int pageCurrent){
		return this.reserveDao.findAllReserve(pageSize, pageCurrent);
	}
	
	//管理员查看待受理预约记录
	public List<Reserve> findReserve(String state,int pageSize, int pageCurrent){
		return this.reserveDao.findReserve(state, pageSize, pageCurrent);
	}

	public int countAllReserveByUserId(String userId) {
		return this.reserveDao.countAllReserveByUserId(userId);
	}

	public int countReserveByUserId(String state, String userId) {
		return this.reserveDao.countReserveByUserId(state, userId);
	}

	public int countAllReserveByRouteId(String userId) {
		return this.reserveDao.countAllReserveByRouteId(userId);
	}

	public int countReserveByRouteId(String state, String userId) {
		return this.reserveDao.countReserveByRouteId(state, userId);
	}

	public int countAllReserve() {
		return this.reserveDao.countAllReserve();
	}

	public int countReserve(String state) {
		return this.reserveDao.countReserve(state);
	}

	public Reserve findReserveById(String reserveId) {
		return this.reserveDao.findReserveById(reserveId);
	}
}
