package com.way.service.impl;

import java.util.List;

import com.way.dao.FeedbackDao;
import com.way.entity.Feedback;
import com.way.service.FeedbackService;

public class FeedbackServiceImpl implements FeedbackService {

	private FeedbackDao feedbackDao;
	
	public FeedbackDao getFeedbackDao() {
		return feedbackDao;
	}

	public void setFeedbackDao(FeedbackDao feedbackDao) {
		this.feedbackDao = feedbackDao;
	}

	public void saveFeedback(Feedback feedback) {
		this.feedbackDao.saveFeedback(feedback);
	}

	public void deleteFeedback(String feedbackId) {
		this.feedbackDao.deleteFeedback(feedbackId);
	}

	public List<Feedback> findFeedback(String state , int pageSize, int pageCurrent) {
		return this.feedbackDao.findFeedback(state, pageSize, pageCurrent);
	}

	public List<Feedback> findFeedbackByUserId(String state , int pageSize, int pageCurrent,
			String userId) {
		return this.feedbackDao.findFeedbackByUserId(state, pageSize, pageCurrent, userId);
	}

	public int findFeedbackCount(String state) {
		return this.feedbackDao.findFeedbackCount(state);
	}

	public int findFeedbackByUserIdCount(String state, String userId) {
		return this.feedbackDao.findFeedbackByUserIdCount(state, userId);
	}

	public void updateFeedback(Feedback feedback) {
		this.feedbackDao.updateFeedback(feedback);
	}


}
