package com.way.entity;

import java.io.Serializable;

public class ReserveView implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -8583839508955208705L;
	private String reserveId;
	private String starTime;
	private Integer adultNum;
	private Integer childNum;
	private double price;
	private String linkman;
	private String telephone;
	private String mail;
	private double total;
	private String reserveTime;
	private String state;
	private String delsoft;
	private String routeName;
	private String refuse;
	private String guideName;
	private String reserveNumber;
	
	
	public ReserveView() {
		super();
	}
	public ReserveView(String reserveId, String starTime, Integer adultNum,
			Integer childNum, double price, String linkman, String telephone,
			String mail, double total, String reserveTime, String state,
			String delsoft, String routeName, String refuse, String guideName,
			String reserveNumber) {
		//调用父类的属性与方法
		super();
		this.reserveId = reserveId;
		this.starTime = starTime;
		this.adultNum = adultNum;
		this.childNum = childNum;
		this.price = price;
		this.linkman = linkman;
		this.telephone = telephone;
		this.mail = mail;
		this.total = total;
		this.reserveTime = reserveTime;
		this.state = state;
		this.delsoft = delsoft;
		this.routeName = routeName;
		this.refuse = refuse;
		this.guideName = guideName;
		this.reserveNumber = reserveNumber;
	}
	public String getReserveId() {
		return reserveId;
	}
	public void setReserveId(String reserveId) {
		this.reserveId = reserveId;
	}
	public String getStarTime() {
		return starTime;
	}
	public void setStarTime(String starTime) {
		this.starTime = starTime;
	}
	public Integer getAdultNum() {
		return adultNum;
	}
	public void setAdultNum(Integer adultNum) {
		this.adultNum = adultNum;
	}
	public Integer getChildNum() {
		return childNum;
	}
	public void setChildNum(Integer childNum) {
		this.childNum = childNum;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public String getLinkman() {
		return linkman;
	}
	public void setLinkman(String linkman) {
		this.linkman = linkman;
	}
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	public String getMail() {
		return mail;
	}
	public void setMail(String mail) {
		this.mail = mail;
	}
	public double getTotal() {
		return total;
	}
	public void setTotal(double total) {
		this.total = total;
	}
	public String getReserveTime() {
		return reserveTime;
	}
	public void setReserveTime(String reserveTime) {
		this.reserveTime = reserveTime;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getDelsoft() {
		return delsoft;
	}
	public void setDelsoft(String delsoft) {
		this.delsoft = delsoft;
	}
	public String getRouteName() {
		return routeName;
	}
	public void setRouteName(String routeName) {
		this.routeName = routeName;
	}
	public String getRefuse() {
		return refuse;
	}
	public void setRefuse(String refuse) {
		this.refuse = refuse;
	}
	public String getGuideName() {
		return guideName;
	}
	public void setGuideName(String guideName) {
		this.guideName = guideName;
	}
	public String getReserveNumber() {
		return reserveNumber;
	}
	public void setReserveNumber(String reserveNumber) {
		this.reserveNumber = reserveNumber;
	}
}
