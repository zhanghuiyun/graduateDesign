package com.way.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.way.dao.BaseDaoImpl;
import com.way.dao.TouristDAO;
import com.way.entity.User;
import com.way.entity.po.Tourist;

public class TouristDAOImpl extends BaseDaoImpl implements TouristDAO{

	public void saveTourists(List<Tourist> tourists) {
		Session session = super.getSession();
		for(Tourist tourist : tourists){
			session.save(tourist);
		}
	}

	public List<Tourist> getTourists(User user) {
		String hql = "from Tourist tourist where tourist.user.userId = :userId";
		Session session = super.getSession();
		Query query = session.createQuery(hql);
		query.setParameter("userId", user.getUserId());
		return query.list();
	}

	public void saveTourist(Tourist tourist) {
		super.getSession().save(tourist);
	}

	public List<Tourist> getTouristsByReserveId(String reserveId) {
		String hql = "select tr.tourist from TouristReserve tr where tr.reserve.reserveId = :reserveId";
		Session session = super.getSession();
		Query query = session.createQuery(hql);
		query.setParameter("reserveId", reserveId);
		return query.list();
	}

	public boolean isExistTourist(Tourist tourist) {
		String hql = "from Tourist tourist where tourist.touristName = :name and tourist.touristTele = :tele and tourist.touristIdNum = :idNum";
		Session session = super.getSession();
		Query query = session.createQuery(hql);
		query.setParameter("name", tourist.getTouristName());
		query.setParameter("tele", tourist.getTouristTele());
		query.setParameter("idNum", tourist.getTouristIdNum());
		if(query.list().size() == 0){
			return false;
		} else {
			return true;
		}
	}

	public Tourist getTourist(String name, String tele, String idNum) {
		String hql = "from Tourist tourist where tourist.touristName = :name and tourist.touristTele = :tele and tourist.touristIdNum = :idNum";
		Session session = super.getSession();
		Query query = session.createQuery(hql);
		query.setParameter("name", name);
		query.setParameter("tele", tele);
		query.setParameter("idNum", idNum);
		return (Tourist) query.uniqueResult();
	}

}
