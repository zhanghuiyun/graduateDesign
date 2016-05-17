package com.way.dao;

import java.util.List;
import com.way.entity.Feedback;

public interface FeedbackDao {
	
	//提交反馈信息（提问）
	public void saveFeedback(Feedback feedback);
	
	//回复
	public void updateFeedback(Feedback feedback);
	
	//用户删除问题
	public void deleteFeedback(String feedbackId);
	
	//查找回复了的问题state 1 未回复的问题 state 0
	public List<Feedback> findFeedback(String state,int pageSize, int pageCurrent);
	//用户查找问题的数量
	public int findFeedbackCount(String state);
	
	//用户查找回复了的问题 state 1 未回复的问题 state 0
	public List<Feedback> findFeedbackByUserId(String state ,int pageSize, int pageCurrent,String userId);
	//用户查找问题的数量
	public int findFeedbackByUserIdCount(String state,String userId);
}
