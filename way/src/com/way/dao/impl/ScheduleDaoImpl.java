package com.way.dao.impl;

import java.util.List;
import com.way.dao.BaseDaoImpl;
import com.way.dao.ScheduleDao;
import com.way.entity.Schedule;

public class ScheduleDaoImpl extends BaseDaoImpl implements ScheduleDao {

	@SuppressWarnings("unchecked")
	public List<Schedule> findByRouteId(String routeId) {
		String hql = "from Schedule s where s.route.routeId=? order by s.scheduleTime";
		List<Schedule> list = super.getSession().createQuery(hql).setParameter(0, routeId).list();
		return list;
	}

}
