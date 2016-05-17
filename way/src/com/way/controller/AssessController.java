package com.way.controller;

import java.util.List;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import com.way.entity.Assess;
import com.way.service.AssessService;

@RequestMapping("assessController")
@Controller
public class AssessController {
	

	private static final Logger LOGGER = LogManager.getLogger(AssessController.class);
		
	@Autowired
	private AssessService assessService;
	
	/**
	 * 显示评价
	 * @param route_id
	 * @param pageCurrent
	 * @return "0" 所有评价
	 */
	@ResponseBody
	@RequestMapping(value="b",method=RequestMethod.POST)
	public List<Assess> findAssess(String route_id, int pageCurrent){
		List<Assess> list = this.assessService.findAssess(route_id, 5, pageCurrent,"0");
		return list;
	}
		
}
