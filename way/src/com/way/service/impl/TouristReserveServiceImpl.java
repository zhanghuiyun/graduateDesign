package com.way.service.impl;

import java.util.List;

import com.way.dao.TouristDAO;
import com.way.dao.TouristReserveDAO;
import com.way.entity.Reserve;
import com.way.entity.po.Tourist;
import com.way.entity.po.TouristReserve;
import com.way.service.TouristReserveService;

public class TouristReserveServiceImpl implements TouristReserveService{

	TouristReserveDAO touristReserveDAO;
	
	TouristDAO touristDAO;
	
	public void save(Reserve reserve, List<Tourist> tourists) {
		for(Tourist t : tourists){
			Tourist tourist = touristDAO.getTourist(t.getTouristName(), t.getTouristTele(), t.getTouristIdNum());
			touristReserveDAO.sava(new TouristReserve(tourist, reserve));
		}
	}

	public TouristReserveDAO getTouristReserveDAO() {
		return touristReserveDAO;
	}

	public void setTouristReserveDAO(TouristReserveDAO touristReserveDAO) {
		this.touristReserveDAO = touristReserveDAO;
	}

	public TouristDAO getTouristDAO() {
		return touristDAO;
	}

	public void setTouristDAO(TouristDAO touristDAO) {
		this.touristDAO = touristDAO;
	}

	public void deleteByReserveId(String reserveId) {
		touristReserveDAO.deleteByReserveId(reserveId);
	}

	
}
