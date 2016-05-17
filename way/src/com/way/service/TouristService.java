package com.way.service;

import java.util.List;

import com.way.entity.Reserve;
import com.way.entity.TouristView;
import com.way.entity.User;
import com.way.entity.po.Tourist;

public interface TouristService {
	public void saveTourists(User user, String[] names, String[] teles, String[] idNums);
	
	public List<TouristView> findTouristsByUser(User user);
	
	public void saveTourist(User user, String name, String teles, String idNum);
	
	public List<TouristView> findTouristsByReserveId(String reserveId);
	
	public boolean isExistTourist(User user, String touristName, String touristTele, String touristIDNum);
}
