package com.way.dao.impl;

import java.util.List;
import com.way.dao.BaseDaoImpl;
import com.way.dao.FeedbackDao;
import com.way.entity.Feedback;

public class FeedbackDaoImpl extends BaseDaoImpl implements FeedbackDao {

	public void saveFeedback(Feedback feedback) {
		super.getSession().save(feedback);
	}

	public void updateFeedback(Feedback feedback){
		String hql = "update Feedback f set f.answerContent=?,f.answerTime=? where f.feedbackId=?";
		super.getSession().createQuery(hql).setParameter(0, feedback.getAnswerContent())
		.setParameter(1, feedback.getAnswerTime()).setParameter(2, feedback.getFeedbackId())
		.executeUpdate();
	}
	
	public void deleteFeedback(String feedbackId) {
		String sql = "update t_way_feedback set delsoft=0 where feedback_id=?";
		super.getSession().createSQLQuery(sql).setParameter(0, feedbackId).executeUpdate();
	}

	//查找回复了的问题state 1 未回复的问题 state 0
	@SuppressWarnings("unchecked")
	public List<Feedback> findFeedback(String state,int pageSize, int pageCurrent) {
		String hql;
		if(state.equals("1")){
			hql="from Feedback f where f.answerContent is not null order by f.feedbackTime";
		}else{
			hql="from Feedback f where f.answerContent is null order by f.feedbackTime";
		}
		List<Feedback> list = super.getSession().createQuery(hql)
		.setFirstResult((pageCurrent-1)*pageSize).setMaxResults(pageSize).list();
		return list;
	}

	//用户查找回复了的问题 state 1 未回复的问题 state 0
	@SuppressWarnings("unchecked")
	public List<Feedback> findFeedbackByUserId(String state,int pageSize, int pageCurrent,
			String userId) {
		StringBuffer hql= new StringBuffer();
		if(state.equals("1")){
			hql.append("from Feedback f where f.delsoft=1 and f.answerContent is not null ");
			hql.append("and f.user.userId=:userId order by f.feedbackTime");
		}else{
			hql.append("from Feedback f where f.delsoft=1 and f.answerContent is null ");
			hql.append("and f.user.userId=:userId order by f.feedbackTime");
		}
		List<Feedback> list = super.getSession().createQuery(hql.toString())
		.setFirstResult((pageCurrent-1)*pageSize).setMaxResults(pageSize)
		.setParameter("userId", userId).list();
		return list;
	}

	@SuppressWarnings("unchecked")
	public int findFeedbackCount(String state) {
		String hql;
		if(state.equals("1")){
			hql="select f.feedbackId from Feedback f where f.answerContent is not null";
		}else{
			hql="select f.feedbackId from Feedback f where f.answerContent is null";
		}
		List<String> list = super.getSession().createQuery(hql).list();
		return list.size();
	}

	@SuppressWarnings("unchecked")
	public int findFeedbackByUserIdCount(String state, String userId) {
		StringBuffer hql= new StringBuffer();
		if(state.equals("1")){
			hql.append("select f.feedbackId from Feedback f where f.delsoft=1 and f.answerContent is not null ");
			hql.append("and f.user.userId=?");
		}else{
			hql.append("select f.feedbackId from Feedback f where f.delsoft=1 and f.answerContent is null ");
			hql.append("and f.user.userId=?");
		}
		List<String> list = super.getSession().createQuery(hql.toString())
				.setParameter(0, userId).list();
		return list.size();
	}
	
	
}
