package com.way.service.impl;

import java.util.List;
import java.util.Map;

import com.way.dao.ViewDao;
import com.way.entity.View;
import com.way.service.ViewService;

public class ViewServiceImpl implements ViewService {

	private ViewDao viewDao;
	
	public ViewDao getViewDao() {
		return viewDao;
	}

	public void setViewDao(ViewDao viewDao) {
		this.viewDao = viewDao;
	}

	public void saveOrUpdate(View view) {
		this.viewDao.saveOrUpdate(view);
	}

	public List<View> findViews(int pageSize, int pageCurrent) {
		return this.viewDao.findViews(pageSize, pageCurrent);
	}

	public List<View> findViewsByKey(int pageSize, int pageCurrent, String key) {
		return this.viewDao.findViewsByKey(pageSize, pageCurrent, key);
	}

	public List<View> findViewByRouteId(String routeId) {
		return this.viewDao.findViewByRouteId(routeId);
	}

	public int countFindViews() {
		return this.viewDao.countFindViews();
	}

	public List<Map<String, Object>> findViewNames() {
		return this.viewDao.findViewNames();
	}

	public List<Map<String, Object>> findViewByReserveId(String reserveID) {
		return this.viewDao.findViewByReserveId(reserveID);
	}

	public View findViewByViewId(String viewId) {
		return this.viewDao.findViewByViewId(viewId);
	}

	public List<View> rankingView(int count) {
		return this.viewDao.rankingView(count);
	}

	public List<View> mostTimeView(int count) {
		return this.viewDao.mostTimeView(count);
	}

	public void setViewGrade(String viewIds, Double viewGrades) {
		this.viewDao.setViewGrade(viewIds, viewGrades);
	}

	public void updateView(View view) {
		this.viewDao.updateView(view);
	}

	public int countViewsByKey(String key) {
		return this.viewDao.countViewsByKey(key);
	}

}
