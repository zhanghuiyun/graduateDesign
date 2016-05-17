package com.way.service;

import com.way.dao.BaseDaoImpl;

public class BaseServiceImpl<T> implements BaseService{
	
	private BaseDaoImpl<T> baseDao;

	public BaseDaoImpl<T> getBaseDao() {
		return baseDao;
	}

	public void setBaseDao(BaseDaoImpl<T> baseDao) {
		this.baseDao = baseDao;
	}
	
	public void test(String a){
		System.out.println("BaseDao..."+a+" 0.0 "+baseDao);
		this.baseDao.test(a);
	}
}
