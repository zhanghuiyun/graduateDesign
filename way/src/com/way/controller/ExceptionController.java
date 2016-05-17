package com.way.controller;

import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;
import com.way.exception.CodeException;

//@ControllerAdvice
public class ExceptionController {

	@ExceptionHandler(value={CodeException.class})
	public ModelAndView testException(Exception ex){
		System.out.println("testException方法----->"+ex);
		ModelAndView modelAndView = new ModelAndView("setPassword");
		modelAndView.addObject("error", ex.getMessage());
		return modelAndView;
	}
}
