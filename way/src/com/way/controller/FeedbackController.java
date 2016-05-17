package com.way.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.way.entity.Feedback;
import com.way.entity.User;
import com.way.service.FeedbackService;
import com.way.utils.PageBean;

@RequestMapping(value = "feedbackController")
@Controller
public class FeedbackController {

	private static final Logger LOGGER = LogManager
			.getLogger(FeedbackController.class);

	@Autowired
	private FeedbackService feedbackService;

	// 用户添加反馈信息
	@RequestMapping(value = "/dealFeedback", method = RequestMethod.POST)
	public String dealFeedback(Feedback feedback,HttpSession session,
			HttpServletRequest request) {
		User user = (User) session.getAttribute("user");
		feedback.setFeedbackTime(new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(new Date()));
		feedback.setUser(user);
		feedback.setUserName(user.getUserName());
		feedback.setDelsoft("1");
		this.feedbackService.saveFeedback(feedback);
		LOGGER.info("用户添加一条反馈信息：" + feedback.getFeedbackContent());
		request.setAttribute("gowhere", "feedback");
		return "go";
	}

	// 管理员处理反馈信息
	@RequestMapping(value="updateFeedback",method=RequestMethod.POST)
	public String updateFeedback(Feedback feedback,HttpSession session, String pageCurrent,
			String state, HttpServletRequest request) {
		feedback.setAnswerTime(new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(new Date()));
		this.feedbackService.updateFeedback(feedback);
		LOGGER.info("管理员回复了一条反馈信息：" + feedback.getFeedbackId());
		setPage(session, pageCurrent, state, request);
		return "admin/admin-feedback";
	}

	// 游客查看自己的反馈信息
	@RequestMapping(value = "feedbackByUserId")
	public String feedbackByUserId(HttpSession session, 
			@RequestParam(value="pageCurrent",defaultValue="1")String pageCurrent,
			@RequestParam(value="state",defaultValue="0")String state, HttpServletRequest request) {
		setPage(session, pageCurrent, state, request);
		return "tourist/tourist-feedback";
	}

	// 管理员查看反馈信息
	@RequestMapping(value = "feedback")
	public String feedback(HttpSession session, String pageCurrent,
			String pageSize, String state, HttpServletRequest request) {
		setPage(session, pageCurrent, state, request);
		return "admin/admin-feedback";
	}

	// 用户删除反馈信息
	@RequestMapping(value = "deleteFeedback")
	public String deleteFeedback(String feedbackId, HttpSession session,
			HttpServletRequest request, String pageCurrent, String state) {
		this.feedbackService.deleteFeedback(feedbackId);
		setPage(session, pageCurrent, state, request);
		return "tourist/tourist-feedback";
	}

	// 查询或者操作记录的公共方法（返回处理之前的页面状态）
	public void setPage(HttpSession session, String pageCurrent, String state,
			HttpServletRequest request) {
		User user = (User) session.getAttribute("user");
		String userId = user.getUserId();
		int page_current, pageSize = 8;// 分别为当前页数和页面大小
		if (pageCurrent == null||pageCurrent.equals("")) {
			page_current = 1;
		} else {
			page_current = Integer.parseInt(pageCurrent);
		}
		
		List<Feedback> list = null;
		int totalRows = 0;
		if(user.getRole().equals("0")){
			list = this.feedbackService.findFeedbackByUserId(state,
					pageSize, page_current, userId);
			// 分页显示
			totalRows = this.feedbackService.findFeedbackByUserIdCount(state,
					userId);// 总行数
		}
		if(user.getRole().equals("2")){
			list = this.feedbackService.findFeedback(state,
					pageSize, page_current);

			// 分页显示
			totalRows = feedbackService.findFeedbackCount(state);
		}
		
		PageBean pageBean = new PageBean(totalRows, pageSize, page_current,
				list);
		request.setAttribute("page_list", pageBean);
		request.setAttribute("state", state);
	}
}
