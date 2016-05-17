package com.way.entity;

public class ViewView {

	private String viewId;
	private String viewName;
	private String viewAddress;
	private String viewRemark;
	private String viewRecommend;
	private String viewPicture;
	private Integer viewNum;
	private double viewGrade;
	
	public ViewView(String viewId, String viewName, String viewAddress,
			String viewRemark, String viewRecommend, String viewPicture,
			Integer viewNum, double viewGrade) {
		super();
		this.viewId = viewId;
		this.viewName = viewName;
		this.viewAddress = viewAddress;
		this.viewRemark = viewRemark;
		this.viewRecommend = viewRecommend;
		this.viewPicture = viewPicture;
		this.viewNum = viewNum;
		this.viewGrade = viewGrade;
	}

	public ViewView() {
		super();
	}

	public String getViewId() {
		return viewId;
	}

	public void setViewId(String viewId) {
		this.viewId = viewId;
	}

	public String getViewName() {
		return viewName;
	}

	public void setViewName(String viewName) {
		this.viewName = viewName;
	}

	public String getViewAddress() {
		return viewAddress;
	}

	public void setViewAddress(String viewAddress) {
		this.viewAddress = viewAddress;
	}

	public String getViewRemark() {
		return viewRemark;
	}

	public void setViewRemark(String viewRemark) {
		this.viewRemark = viewRemark;
	}

	public String getViewRecommend() {
		return viewRecommend;
	}

	public void setViewRecommend(String viewRecommend) {
		this.viewRecommend = viewRecommend;
	}

	public String getViewPicture() {
		return viewPicture;
	}

	public void setViewPicture(String viewPicture) {
		this.viewPicture = viewPicture;
	}

	public Integer getViewNum() {
		return viewNum;
	}

	public void setViewNum(Integer viewNum) {
		this.viewNum = viewNum;
	}

	public double getViewGrade() {
		return viewGrade;
	}

	public void setViewGrade(double viewGrade) {
		this.viewGrade = viewGrade;
	}
}
