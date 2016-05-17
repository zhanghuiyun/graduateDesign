package com.way.utils;

import java.util.ArrayList;
import java.util.List;

/**
 * @author Administrator
 * @version 负责页面控制的 JavaBean
 */
public class PageBean {			
	public int currentPage;				// 当前页数
	public int totalPage;				// 总页数
	public int totalRows;				// 总行数
	public int rowsPage;			    // 每页显示多少行
	@SuppressWarnings("rawtypes")
	public List data = new ArrayList();				// 封装页面显示的数据
	public PageBean(){}
	public void countTotalPage(){		// 计算总页数
		if(totalRows%rowsPage==0){
			this.totalPage = totalRows/rowsPage;
		}
		else{
			this.totalPage = totalRows/rowsPage + 1;
		}
	}
	
	@SuppressWarnings("rawtypes")
	public PageBean(int totalRows,int rowsPage, int currentPage,List date){
		this.totalRows = totalRows;
		this.rowsPage = rowsPage;
		this.currentPage = currentPage;
		this.data = date;
		this.countTotalPage();
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getTotalRows() {
		return totalRows;
	}
	public void setTotalRows(int totalRows) {
		this.totalRows = totalRows;
	}
	public int getRowsPage() {
		return rowsPage;
	}
	public void setRowsPage(int rowsPage) {
		this.rowsPage = rowsPage;
	}
	@SuppressWarnings("rawtypes")
	public List getData() {
		return data;
	}
	@SuppressWarnings("rawtypes")
	public void setData(List data) {
		this.data = data;
	}
	
}
