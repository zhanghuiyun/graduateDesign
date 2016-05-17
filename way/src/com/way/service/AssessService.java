package com.way.service;

import java.util.List;

import com.way.entity.Assess;
import com.way.entity.User;
import com.way.entity.View;

public interface AssessService {
	
	//提交评价
	public void saveAssess(Assess assess,String reserveId,User user,List<View> views);
	
	//显示评价key 全部评价0   好评 1 中评 2  差评 3
	public List<Assess> findAssess(String routeId,int pageSize, int pageCurrent,String key);
	
	//计算评价条数，用于分页
	public int countAssess(String routeId,String key);
}
