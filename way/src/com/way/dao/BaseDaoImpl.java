package com.way.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

public class BaseDaoImpl<T> implements BaseDao{
	
	private SessionFactory sessionFactory;
	
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	public Session getSession(){
		return this.sessionFactory.getCurrentSession();
	}
	
	public void test(String a){
		System.out.println("baseService+++++"+a);
	}

}
