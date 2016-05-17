package com.way.entity;

import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Component;

@Component
public class UserMapper implements ViewMapper<UserView, User> {

	public UserView mapping(User user) {
		UserView view=new UserView();
		//复制Bean属性，将user的某些属性赋值给view
		BeanUtils.copyProperties(user, view);
		return view;
	}

}
