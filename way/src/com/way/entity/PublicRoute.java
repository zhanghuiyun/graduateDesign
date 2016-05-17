package com.way.entity;

import java.util.List;

public class PublicRoute {
	
	private Route route;
	
	private List<Schedule> schedules;
	
	private List<String> viewId;

	public PublicRoute(Route route, List<Schedule> schedules,
			List<String> viewId) {
		super();
		this.route = route;
		this.schedules = schedules;
		this.viewId = viewId;
	}

	public PublicRoute() {
		super();
	}

	public Route getRoute() {
		return route;
	}

	public void setRoute(Route route) {
		this.route = route;
	}

	public List<Schedule> getSchedules() {
		return schedules;
	}

	public void setSchedules(List<Schedule> schedules) {
		this.schedules = schedules;
	}

	public List<String> getViewId() {
		return viewId;
	}

	public void setViewId(List<String> viewId) {
		this.viewId = viewId;
	}
	

}
