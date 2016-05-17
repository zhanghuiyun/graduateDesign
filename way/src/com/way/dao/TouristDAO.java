package com.way.dao;

import java.util.List;

import com.way.entity.User;
import com.way.entity.po.Tourist;

public interface TouristDAO {
	public void saveTourists(List<Tourist> tourists);
	
	public List<Tourist> getTourists(User user);
	
	public void saveTourist(Tourist tourist);
	
	public List<Tourist> getTouristsByReserveId(String reserveId);
	
	public boolean isExistTourist(Tourist tourist);
	
	public Tourist getTourist(String name, String tele, String idNum);
}
