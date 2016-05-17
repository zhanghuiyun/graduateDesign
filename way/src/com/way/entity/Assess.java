package com.way.entity;
// default package



/**
 * Assess entity. @author MyEclipse Persistence Tools
 */

public class Assess  implements java.io.Serializable {


    // Fields    

     /**
	 * 
	 */
	private static final long serialVersionUID = 6259539407632773199L;
	private String assessId;
     private User user;
     private Reserve reserve;
     private String content;
     private Integer service;
     private Integer route_1;
     private String assessTime;

    // Constructors

    /** default constructor */
    public Assess() {
    }

    
    /** full constructor */
    public Assess(User user, Reserve reserve, String content, Integer service, Integer route_1,String assessTime) {
        this.user = user;
        this.reserve = reserve;
        this.content = content;
        this.service = service;
        this.route_1 = route_1;
        this.assessTime = assessTime;
    }

   
    // Property accessors

    public String getAssessId() {
        return this.assessId;
    }
    
    public void setAssessId(String assessId) {
        this.assessId = assessId;
    }

    public User getUser() {
        return this.user;
    }
    
    public void setUser(User user) {
        this.user = user;
    }

    public Reserve getReserve() {
        return this.reserve;
    }
    
    public void setReserve(Reserve reserve) {
        this.reserve = reserve;
    }

    public String getContent() {
        return this.content;
    }
    
    public void setContent(String content) {
        this.content = content;
    }

    public Integer getService() {
        return this.service;
    }
    
    public void setService(Integer service) {
        this.service = service;
    }

    public Integer getRoute_1() {
        return this.route_1;
    }
    
    public void setRoute_1(Integer route_1) {
        this.route_1 = route_1;
    }

	public String getAssessTime() {
		return assessTime;
	}

	public void setAssessTime(String assessTime) {
		this.assessTime = assessTime;
	}
   








}