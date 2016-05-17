package com.way.dao;

import java.util.List;

import com.way.entity.Schedule;

public interface ScheduleDao {
	//根据路线id查找行程
	public List<Schedule> findByRouteId(String routeId);
}
