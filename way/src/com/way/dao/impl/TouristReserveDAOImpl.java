package com.way.dao.impl;

import org.hibernate.Query;
import org.hibernate.Session;

import com.way.dao.BaseDaoImpl;
import com.way.dao.TouristReserveDAO;
import com.way.entity.po.TouristReserve;

public class TouristReserveDAOImpl extends BaseDaoImpl implements TouristReserveDAO{

	public void sava(TouristReserve tr) {
		Session session = super.getSession();
		session.save(tr);
	}

	public void deleteByReserveId(String reserveId) {
		Session session = super.getSession();
		String hql = "delete from TouristReserve tr where tr.reserve.reserveId = :reserveId";
		Query query = session.createQuery(hql);
		query.setParameter("reserveId", reserveId);
		query.executeUpdate();
	}
	
}
