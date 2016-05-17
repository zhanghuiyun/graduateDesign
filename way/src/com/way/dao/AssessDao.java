package com.way.dao;

import java.util.List;

import com.way.entity.Assess;

public interface AssessDao {
	//提交评价
	public void saveAssess(Assess assess);
	//显示评价
	public List<Assess> findAssess(String route_id,int pageSize, int pageCurrent ,String key);
	//计算评价条数，用于分页
	public int countAssess(String routeId,String key);
}
