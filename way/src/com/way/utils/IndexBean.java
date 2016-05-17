package com.way.utils;

import java.util.ArrayList;
import java.util.List;

/**
 * @author Administrator
 * @version 负责页面控制的 JavaBean
 */
public class IndexBean {			

	public List mostRouteList = new ArrayList();				// 封装页面显示的数据
	public List rankRouteList = new ArrayList();				// 封装页面显示的数据
	public List rankViewList = new ArrayList();				// 封装页面显示的数据
	public List mostViewList = new ArrayList();				// 封装页面显示的数据
	
	public IndexBean(){
		
	}
	
	
	
	public IndexBean(List mostRouteList, List rankRouteList, List rankViewList,
			List mostViewList) {
		super();
		this.mostRouteList = mostRouteList;
		this.rankRouteList = rankRouteList;
		this.rankViewList = rankViewList;
		this.mostViewList = mostViewList;
	}



	public List getMostRouteList() {
		return mostRouteList;
	}
	public void setMostRouteList(List mostRouteList) {
		this.mostRouteList = mostRouteList;
	}
	public List getRankRouteList() {
		return rankRouteList;
	}
	public void setRankRouteList(List rankRouteList) {
		this.rankRouteList = rankRouteList;
	}
	public List getRankViewList() {
		return rankViewList;
	}
	public void setRankViewList(List rankViewList) {
		this.rankViewList = rankViewList;
	}
	public List getMostViewList() {
		return mostViewList;
	}
	public void setMostViewList(List mostViewList) {
		this.mostViewList = mostViewList;
	}
	

}
