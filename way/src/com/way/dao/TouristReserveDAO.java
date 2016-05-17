package com.way.dao;

import com.way.entity.po.TouristReserve;

public interface TouristReserveDAO {
	public void sava(TouristReserve tr);
	
	public void deleteByReserveId(String reserveId);
}
