package com.way.entity;

public class TouristView {
	private String touristId;
	
	private String touristName;
	
	private String touristTele;
	
	private String touristIdNum;

	public String getTouristId() {
		return touristId;
	}

	public void setTouristId(String touristId) {
		this.touristId = touristId;
	}

	public String getTouristName() {
		return touristName;
	}

	public void setTouristName(String touristName) {
		this.touristName = touristName;
	}

	public String getTouristTele() {
		return touristTele;
	}

	public void setTouristTele(String touristTele) {
		this.touristTele = touristTele;
	}

	public String getTouristIdNum() {
		return touristIdNum;
	}

	public void setTouristIdNum(String touristIdNum) {
		this.touristIdNum = touristIdNum;
	}

	public TouristView(String touristId, String touristName,
			String touristTele, String touristIdNum) {
		//调用父类的属性与方法
		super();
		this.touristId = touristId;
		this.touristName = touristName;
		this.touristTele = touristTele;
		this.touristIdNum = touristIdNum;
	}
	
	public TouristView(){};
}
