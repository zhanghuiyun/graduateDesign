package com.way.service;

import java.util.List;

import com.way.entity.Schedule;

public interface ScheduleService {
	//根据路线id查找行程
	public List<Schedule> findByRouteId(String routeId);
}
