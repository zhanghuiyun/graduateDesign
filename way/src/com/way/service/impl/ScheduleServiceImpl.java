package com.way.service.impl;

import java.util.List;
import com.way.dao.ScheduleDao;
import com.way.entity.Schedule;
import com.way.service.ScheduleService;

public class ScheduleServiceImpl implements ScheduleService {

	private ScheduleDao scheduleDao;
	
	public ScheduleDao getScheduleDao() {
		return scheduleDao;
	}

	public void setScheduleDao(ScheduleDao scheduleDao) {
		this.scheduleDao = scheduleDao;
	}

	public List<Schedule> findByRouteId(String routeId) {
		return this.scheduleDao.findByRouteId(routeId);
	}

}
