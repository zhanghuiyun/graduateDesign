package com.way.dao;

import java.util.List;
import com.way.entity.Reserve;

public interface ReserveDao {
	
	//用户预约
	public void save(Reserve reserve);
	
	//对预约的操作
	public void passReserve(String reserveId,String state);
	
	//拒绝预约
	public void refuseReserve(String reserveId,String refuse);
	
	//用户删除一条预约
	public void deleteReserve(String reserveId);
	
	//用户查看所有预约记录 
	public List<Reserve> findAllReserveByUserId(String userId, int pageSize, int pageCurrent);
	//用户查看预约记录  待受理0，预约成功1,拒绝2,取消3,已评价4,失信5
	public List<Reserve> findReserveByUserId(String state,String userId,int pageSize, int pageCurrent);
	//用户计算所有预约记录条数
	public int countAllReserveByUserId(String userId);
	//用户计算各种状态预约记录条数
	public int countReserveByUserId(String state,String userId);
	
	//导游查看所有预约记录
	public List<Reserve> findAllReserveByRouteId(String userId,int pageSize, int pageCurrent);
	//导游查看预约记录  待受理0，预约成功1,拒绝2,取消3,已评价4,失信5
	public List<Reserve> findReserveByRouteId(String state,String userId,int pageSize, int pageCurrent);
	//导游计算所有预约记录条数
	public int countAllReserveByRouteId(String userId);
	//导游计算各种状态预约记录条数
	public int countReserveByRouteId(String state,String userId);
	
	//管理员查看所有预约记录
	public List<Reserve> findAllReserve(int pageSize, int pageCurrent);
	//管理员查看预约记录   待受理0，预约成功1,拒绝2,取消3,已评价4,失信5
	public List<Reserve> findReserve(String state ,int pageSize, int pageCurrent);
	//管理员计算所有预约记录条数
	public int countAllReserve();
	//管理员计算各种状态预约记录条数
	public int countReserve(String state);
	
	public Reserve findReserveById(String reserveId);

}
