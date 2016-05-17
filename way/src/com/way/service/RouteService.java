package com.way.service;

import java.util.List;

import com.way.entity.Route;
import com.way.entity.Schedule;
import com.way.entity.View;

public interface RouteService {
	
	//保存路线
	public void save(Route route,List<Schedule> schedules,List<String> views);
	
	//管理员查找审批过的路线1 未审批的路线0  下线2  拒绝3
	public List<Route> findRoutes(String state , int pageSize, int pageCurrent);
	public int countFindRoutes(String state);
	
	//导游查找审批过的路线1 未审批的路线0  下线2  拒绝3
	public List<Route> findRoutesById(String userId,String state , int pageSize, int pageCurrent);
	public int countFindRoutesById(String userId,String state);
	
	//管理员路线审批通过路线 state 1 导游下线路线 state 2
	public void passOrOffRoute(String state,String routeId);
	
	//管理员路线审批不通过
	public void refuse(String routeId,String refuse);
	
	//根据景点查找相关的路线
	public List<Route> findRoutesByViewId(String viewId);
	
	//根据路线id取得路线信息
	public Route findRouteByRouteId(String routeId);
	
	//根据路线id取得路线的详细信息
	public Route findRouteDetail(String routeId);
	
	//查询按分数从高到低的指定条数路线
	public List<Route> rankingRoute(int count);
	
	//累计预约次数最高的路线
	public List<Route> mostTimeRoute(int count);
}
