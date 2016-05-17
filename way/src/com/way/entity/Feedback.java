package com.way.entity;
// default package



/**
 * Feedback entity. @author MyEclipse Persistence Tools
 */

public class Feedback  implements java.io.Serializable {


    // Fields    

     /**
	 * 
	 */
	private static final long serialVersionUID = -3125561623210872844L;
	private String feedbackId;
     private User user;
     private String feedbackContent;
     private String feedbackTime;
     private String answerContent;
     private String answerTime;
     private String userName;
     private String delsoft;

    // Constructors

    /** default constructor */
    public Feedback() {
    }

	/** minimal constructor */
    public Feedback(User user, String feedbackContent, String feedbackTime, String userName ,String delsoft) {
        this.user = user;
        this.feedbackContent = feedbackContent;
        this.feedbackTime = feedbackTime;
        this.userName = userName;
        this.delsoft = delsoft;
    }
    
    /** full constructor */
    public Feedback(User user, String feedbackContent, String feedbackTime, String answerContent, String answerTime, String userName,String delsoft) {
        this.user = user;
        this.feedbackContent = feedbackContent;
        this.feedbackTime = feedbackTime;
        this.answerContent = answerContent;
        this.answerTime = answerTime;
        this.userName = userName;
        this.delsoft = delsoft;
    }

   
    // Property accessors

    public String getFeedbackId() {
        return this.feedbackId;
    }
    
    public void setFeedbackId(String feedbackId) {
        this.feedbackId = feedbackId;
    }

    public User getUser() {
        return this.user;
    }
    
    public void setUser(User user) {
        this.user = user;
    }

    public String getFeedbackContent() {
        return this.feedbackContent;
    }
    
    public void setFeedbackContent(String feedbackContent) {
        this.feedbackContent = feedbackContent;
    }

    public String getFeedbackTime() {
        return this.feedbackTime;
    }
    
    public void setFeedbackTime(String feedbackTime) {
        this.feedbackTime = feedbackTime;
    }

    public String getAnswerContent() {
        return this.answerContent;
    }
    
    public void setAnswerContent(String answerContent) {
        this.answerContent = answerContent;
    }

    public String getAnswerTime() {
        return this.answerTime;
    }
    
    public void setAnswerTime(String answerTime) {
        this.answerTime = answerTime;
    }


	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getDelsoft() {
		return delsoft;
	}

	public void setDelsoft(String delsoft) {
		this.delsoft = delsoft;
	}

	@Override
	public String toString() {
		return "Feedback [feedbackId=" + feedbackId + ", user=" + user
				+ ", feedbackContent=" + feedbackContent + ", feedbackTime="
				+ feedbackTime + ", answerContent=" + answerContent
				+ ", answerTime=" + answerTime + ", userName=" + userName
				+ ", delsoft=" + delsoft + "]";
	}
   








}