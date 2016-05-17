package com.way.entity;
// default package

import java.util.HashSet;
import java.util.Set;
import java.util.TreeSet;


/**
 * Schedule entity. @author MyEclipse Persistence Tools
 */

public class Schedule  implements java.io.Serializable,Comparable<Schedule> {


    // Fields    



	private String scheduleId;
     private Route route;
     private String scheduleTime;
     private String scheduleContent;


    // Constructors

    /** default constructor */
    public Schedule() {
    }
   
    public Schedule(String scheduleId, Route route, String scheduleTime,
			String scheduleContent) {
    	//调用父类的属性与方法
		super();
		this.scheduleId = scheduleId;
		this.route = route;
		this.scheduleTime = scheduleTime;
		this.scheduleContent = scheduleContent;
	}


	// Property accessors

    public String getScheduleId() {
        return this.scheduleId;
    }
    
    public void setScheduleId(String scheduleId) {
        this.scheduleId = scheduleId;
    }

    public Route getRoute() {
        return this.route;
    }
    
    public void setRoute(Route route) {
        this.route = route;
    }

	public String getScheduleTime() {
		return scheduleTime;
	}

	public void setScheduleTime(String scheduleTime) {
		this.scheduleTime = scheduleTime;
	}

	public String getScheduleContent() {
		return scheduleContent;
	}

	public void setScheduleContent(String scheduleContent) {
		this.scheduleContent = scheduleContent;
	}

    public int compareTo(Schedule o) {
    	if(this.scheduleTime.compareTo(o.getScheduleTime())==0){
	    	return this.scheduleContent.compareTo(o.getScheduleContent());
    	}
		return this.scheduleTime.compareTo(o.getScheduleTime());
	}


	@Override
	public String toString() {
		return "Schedule [scheduleTime=" + scheduleTime + ", scheduleContent="
				+ scheduleContent + "]"+"\n";
	}
}