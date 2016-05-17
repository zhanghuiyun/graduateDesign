package com.way.entity;

import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Component;

import com.way.entity.po.Tourist;

@Component
public class TouristMapper implements ViewMapper<TouristView, Tourist> {

	public TouristView mapping(Tourist y) {
		TouristView view=new TouristView();
		BeanUtils.copyProperties(y, view, new String[]{"user"});
		return view;
	}

}
