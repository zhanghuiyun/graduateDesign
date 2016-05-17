package com.way.entity;

import java.util.HashSet;
import java.util.Set;

// default package

/**
 * View entity. @author MyEclipse Persistence Tools
 */

public class View implements java.io.Serializable {

	// Fields

	/**
	 * 
	 */
	private static final long serialVersionUID = 4587427315951973415L;
	private String viewId;
	private String viewName;
	private String viewAddress;
	private String viewRemark;
	private String viewRecommend;
	private String viewPicture;
	private Integer viewNum;
	private double viewGrade;
	private Set routeViews = new HashSet(0);

	// Constructors

	/** default constructor */
	public View() {
	}

	/** minimal constructor */
	public View(String viewName, String viewAddress, String viewRemark,
			String viewPicture, Integer viewNum) {
		this.viewName = viewName;
		this.viewAddress = viewAddress;
		this.viewRemark = viewRemark;
		this.viewPicture = viewPicture;
		this.viewNum = viewNum;
	}

	/** full constructor */
	public View(String viewName, String viewAddress, String viewRemark,
			String viewRecommend, String viewPicture, Integer viewNum,
			double viewGrade,Set routeViews) {
		this.viewName = viewName;
		this.viewAddress = viewAddress;
		this.viewRemark = viewRemark;
		this.viewRecommend = viewRecommend;
		this.viewPicture = viewPicture;
		this.viewNum = viewNum;
		this.viewGrade = viewGrade;
		this.routeViews = routeViews;
	}

	// Property accessors

	public String getViewId() {
		return this.viewId;
	}

	public void setViewId(String viewId) {
		this.viewId = viewId;
	}

	public String getViewName() {
		return this.viewName;
	}

	public void setViewName(String viewName) {
		this.viewName = viewName;
	}

	public String getViewAddress() {
		return this.viewAddress;
	}

	public void setViewAddress(String viewAddress) {
		this.viewAddress = viewAddress;
	}

	public String getViewRemark() {
		return this.viewRemark;
	}

	public void setViewRemark(String viewRemark) {
		this.viewRemark = viewRemark;
	}

	public String getViewRecommend() {
		return this.viewRecommend;
	}

	public void setViewRecommend(String viewRecommend) {
		this.viewRecommend = viewRecommend;
	}

	public String getViewPicture() {
		return this.viewPicture;
	}

	public void setViewPicture(String viewPicture) {
		this.viewPicture = viewPicture;
	}

	public Integer getViewNum() {
		return this.viewNum;
	}

	public void setViewNum(Integer viewNum) {
		this.viewNum = viewNum;
	}

	public double getViewGrade() {
		return this.viewGrade;
	}

	public void setViewGrade(double viewGrade) {
		this.viewGrade = viewGrade;
	}
	
	public Set getRouteViews() {
		return routeViews;
	}

	public void setRouteViews(Set routeViews) {
		this.routeViews = routeViews;
	}

	@Override
	public String toString() {
		return "View [viewId=" + viewId + ", viewName=" + viewName
				+ ", viewAddress=" + viewAddress + ", viewRemark=" + viewRemark
				+ ", viewRecommend=" + viewRecommend + ", viewPicture="
				+ viewPicture + ", viewNum=" + viewNum + ", viewGrade="
				+ viewGrade + "]";
	}

}