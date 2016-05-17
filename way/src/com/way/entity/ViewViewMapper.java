package com.way.entity;

import java.util.HashSet;
import java.util.Set;

import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Component;

//转JSON，在View表中 Set routeViews = new HashSet(0);是没办法转化成JSON的

@Component
public class ViewViewMapper implements ViewMapper<ViewView, View> {

	public ViewView mapping(View view) {
		ViewView viewView = new ViewView();
		BeanUtils.copyProperties(view, viewView);   //将view赋值给viewView，ViewView表，对应View表中的hash
		return viewView;
	}

}
