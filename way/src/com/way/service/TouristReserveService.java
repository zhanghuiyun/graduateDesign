package com.way.service;

import java.util.List;

import com.way.entity.Reserve;
import com.way.entity.po.Tourist;

public interface TouristReserveService {
	public void save(Reserve reserve, List<Tourist> tourist);
	
	public void deleteByReserveId(String reserveId);
}
