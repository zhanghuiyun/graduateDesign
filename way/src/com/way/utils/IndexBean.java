package com.way.utils;

import java.util.ArrayList;
import java.util.List;

/**
 * @author Administrator
 * @version ����ҳ����Ƶ� JavaBean
 */
public class IndexBean {			

	public List mostRouteList = new ArrayList();				// ��װҳ����ʾ������
	public List rankRouteList = new ArrayList();				// ��װҳ����ʾ������
	public List rankViewList = new ArrayList();				// ��װҳ����ʾ������
	public List mostViewList = new ArrayList();				// ��װҳ����ʾ������
	
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
