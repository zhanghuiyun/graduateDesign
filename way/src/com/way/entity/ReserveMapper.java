package com.way.entity;

import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Component;


@Component
public class ReserveMapper implements ViewMapper<ReserveView, Reserve> {

	public ReserveView mapping(Reserve reserve) {
		
		ReserveView view=new ReserveView();
		//将reserve中的属性值赋给view
		BeanUtils.copyProperties(reserve, view);
		return view;
	}

}
