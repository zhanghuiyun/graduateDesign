package com.way.entity;

// default package

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * Route entity. @author MyEclipse Persistence Tools
 */

public class Route implements java.io.Serializable {

	// Fields

	/**
	 * 
	 */
	private static final long serialVersionUID = -4085806065573028362L;
	private String routeId;
	private String routeName;
	private float price;
	private String reason;
	private Integer day;
	private Integer num;
	private double grade;
	private String state;
	private User user;
	private String userName;
	private String time;
	private String refuse;
	private String views;
	private Set schedules = new HashSet(0);
	private Set reserves = new HashSet(0);
	private Set routeViews = new HashSet(0);

	// Constructors

	/** default constructor */
	public Route() {
	}

	public Route(String routeId, String routeName, float price, String reason,
			Integer day, Integer num, double grade, String state, User user,
			String userName, String time, String refuse,String views) {
		super();
		this.routeId = routeId;
		this.routeName = routeName;
		this.price = price;
		this.reason = reason;
		this.day = day;
		this.num = num;
		this.grade = grade;
		this.state = state;
		this.user = user;
		this.userName = userName;
		this.time = time;
		this.refuse = refuse;
		this.views = views;
	}

	public Route(String routeId, String routeName, float price, String reason,
			Integer day, Integer num, double grade, String state, User user,
			String userName, String time, String refuse,String views,
			Set schedules, Set reserves,Set routeViews) {
		super();
		this.routeId = routeId;
		this.routeName = routeName;
		this.price = price;
		this.reason = reason;
		this.day = day;
		this.num = num;
		this.grade = grade;
		this.state = state;
		this.user = user;
		this.userName = userName;
		this.time = time;
		this.refuse = refuse;
		this.schedules = schedules;
		this.reserves = reserves;
		this.routeViews = routeViews;
		this.views = views;
	}

	// Property accessors

	public String getRefuse() {
		return refuse;
	}

	public void setRefuse(String refuse) {
		this.refuse = refuse;
	}

	public String getRouteId() {
		return this.routeId;
	}

	public void setRouteId(String routeId) {
		this.routeId = routeId;
	}

	public String getRouteName() {
		return this.routeName;
	}

	public void setRouteName(String routeName) {
		this.routeName = routeName;
	}

	public float getPrice() {
		return this.price;
	}

	public void setPrice(float price) {
		this.price = price;
	}

	public String getReason() {
		return this.reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public Integer getDay() {
		return this.day;
	}

	public void setDay(Integer day) {
		this.day = day;
	}

	public Integer getNum() {
		return this.num;
	}

	public void setNum(Integer num) {
		this.num = num;
	}

	public double getGrade() {
		return this.grade;
	}

	public void setGrade(double grade) {
		this.grade = grade;
	}

	public String getState() {
		return this.state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public Set getSchedules() {
		return schedules;
	}

	public void setSchedules(Set schedules) {
		this.schedules = schedules;
	}

	public Set getReserves() {
		return this.reserves;
	}

	public void setReserves(Set reserves) {
		this.reserves = reserves;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public Set getRouteViews() {
		return routeViews;
	}

	public void setRouteViews(Set routeViews) {
		this.routeViews = routeViews;
	}

	public String getViews() {
		return views;
	}

	public void setViews(String views) {
		this.views = views;
	}

	@Override
	public String toString() {
		return "Route [routeId=" + routeId + ", routeName=" + routeName
				+ ", price=" + price + ", reason=" + reason + ", day=" + day
				+ ", num=" + num + ", grade=" + grade + ", state=" + state
				+ ", user=" + user + ", userName=" + userName + ", time="
				+ time + ", refuse=" + refuse
				+ ", schedules=" + schedules + ", reserves=" + reserves + "]";
	}

}