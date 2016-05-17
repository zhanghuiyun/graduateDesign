package com.way.entity;

import java.util.HashSet;
import java.util.Set;

// default package

/**
 * Reserve entity. @author MyEclipse Persistence Tools
 */

public class Reserve implements java.io.Serializable {

	// Fields

	/**
	 * 
	 */
	private static final long serialVersionUID = 2239319040924928350L;
	private String reserveId;
	private User user;
	private Route route;
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
	private Set assess = new HashSet(0);
	// Constructors

	/** default constructor */
	public Reserve() {
	}

	/** full constructor */
	public Reserve(User user, Route route, String starTime, Integer adultNum,
			Integer childNum,double price, String linkman, String telephone, String mail,
			double total, String reserveTime, String state, String delsoft,
			String routeName,String refuse,String guideName,String reserveNumber) {
		this.user = user;
		this.route = route;
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

	
	// Property accessors

	public Reserve(String reserveId, User user, Route route, String starTime,
			Integer adultNum, Integer childNum, double price, String linkman,
			String telephone, String mail, double total, String reserveTime,
			String state, String delsoft, String routeName, String refuse,
			String guideName, String reserveNumber, Set assess) {
		super();
		this.reserveId = reserveId;
		this.user = user;
		this.route = route;
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
		assess = assess;
	}

	public String getReserveId() {
		return this.reserveId;
	}

	public void setReserveId(String reserveId) {
		this.reserveId = reserveId;
	}

	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Route getRoute() {
		return this.route;
	}

	public void setRoute(Route route) {
		this.route = route;
	}

	public String getStarTime() {
		return this.starTime;
	}

	public void setStarTime(String starTime) {
		this.starTime = starTime;
	}

	public Integer getAdultNum() {
		return this.adultNum;
	}

	public void setAdultNum(Integer adultNum) {
		this.adultNum = adultNum;
	}

	public Integer getChildNum() {
		return this.childNum;
	}

	public void setChildNum(Integer childNum) {
		this.childNum = childNum;
	}

	public String getLinkman() {
		return this.linkman;
	}

	public void setLinkman(String linkman) {
		this.linkman = linkman;
	}

	public String getTelephone() {
		return this.telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public String getMail() {
		return this.mail;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}

	public double getTotal() {
		return this.total;
	}

	public void setTotal(double total) {
		this.total = total;
	}

	public String getReserveTime() {
		return this.reserveTime;
	}

	public void setReserveTime(String reserveTime) {
		this.reserveTime = reserveTime;
	}

	public String getState() {
		return this.state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getDelsoft() {
		return this.delsoft;
	}

	public void setDelsoft(String delsoft) {
		this.delsoft = delsoft;
	}

	public String getRouteName() {
		return this.routeName;
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

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
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

	public Set getAssess() {
		return assess;
	}

	public void setAssess(Set assess) {
		assess = assess;
	}

	@Override
	public String toString() {
		return "Reserve [reserveId=" + reserveId + ", starTime=" + starTime
				+ ", adultNum=" + adultNum + ", childNum=" + childNum
				+ ", price=" + price + ", linkman=" + linkman + ", telephone="
				+ telephone + ", mail=" + mail + ", total=" + total
				+ ", reserveTime=" + reserveTime + ", state=" + state
				+ ", delsoft=" + delsoft + ", routeName=" + routeName
				+ ", refuse=" + refuse + ", guideName=" + guideName
				+ ", reserveNumber=" + reserveNumber + "]";
	}



}