package com.way.service;

import java.util.List;
import java.util.Map;

import com.way.entity.View;

public interface ViewService {
	
	//新增或者修改景点
	public void saveOrUpdate(View view);
	
	//修改景点
	public void updateView(View view);
	
	//分页查找景点
	public List<View> findViews(int pageSize, int pageCurrent);
	
	//计算景点条数
	public int countFindViews();
	
	//分页根据关键字查找景点（景点名称，景点地址，景点描述）
	public List<View> findViewsByKey(int pageSize, int pageCurrent,String key);
	
	public int countViewsByKey(String key);
	
	//根据路线查找相关景点
	public List<View> findViewByRouteId(String routeId);
	
	//发布路线时，查找所有景点名称和id
	public List<Map<String,Object>> findViewNames();
	
	//评价时，根据预约id查询 景点
	public List<Map<String,Object>> findViewByReserveId(String reserveId);
	
	//根据景点id查找景点信息
	public View findViewByViewId(String viewId);
	
	//查询按分数从高到低的指定条数景点
	public List<View> rankingView(int count);
	
	//累计预约次数最高的路线
	public List<View> mostTimeView(int count);
	
	//评价时给景点打分
	public void setViewGrade(String viewIds,Double viewGrades);
}
