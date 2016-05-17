package com.way.service.impl;

import java.util.ArrayList;
import java.util.List;

import com.way.dao.TouristDAO;
import com.way.entity.TouristMapper;
import com.way.entity.TouristView;
import com.way.entity.User;
import com.way.entity.po.Tourist;
import com.way.service.TouristService;

public class TouristServiceImpl implements TouristService{
	
	TouristDAO touristDAO;
	
	
	TouristMapper touristMapper;

	public void saveTourists(User user, String[] names, String[] teles, String[] idNums) {
		List<Tourist> list = new ArrayList<Tourist>();
		for(int i = 0; i < names.length; i++){
			list.add(new Tourist(user, names[i], teles[i], idNums[i]));
		}
		touristDAO.saveTourists(list);
	}

	public TouristDAO getTouristDAO() {
		return touristDAO;
	}

	public void setTouristDAO(TouristDAO touristDAO) {
		this.touristDAO = touristDAO;
	}

	public List<TouristView> findTouristsByUser(User user) {
		List<Tourist> list = touristDAO.getTourists(user);
		List<TouristView> retList = new ArrayList<TouristView>();
		touristMapper = new TouristMapper();
		for(Tourist t : list){
			retList.add(touristMapper.mapping(t));
		}
		return retList;
	}

	public void saveTourist(User user, String name, String teles, String idNum) {
		touristDAO.saveTourist(new Tourist(user, name, teles, idNum));
	}

	public List<TouristView> findTouristsByReserveId(String reserveId) {
		List<Tourist> list = touristDAO.getTouristsByReserveId(reserveId);
		List<TouristView> retList = new ArrayList<TouristView>();
		touristMapper = new TouristMapper();
		for(Tourist t : list){
			retList.add(touristMapper.mapping(t));
		}
		return retList;
	}

	public boolean isExistTourist(User user, String touristName,
			String touristTele, String touristIDNum) {
		Tourist tourist = new Tourist(user, touristName, touristTele, touristIDNum);
		if(touristDAO.isExistTourist(tourist)){
			return true;
		}else{
			return false;
		}
	}
}
