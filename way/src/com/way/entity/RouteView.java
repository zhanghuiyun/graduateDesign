package com.way.entity;
// default package

import com.way.entity.Route;
import com.way.entity.View;


/**
 * RouteView entity. @author MyEclipse Persistence Tools
 */

public class RouteView  implements java.io.Serializable {


    /**
	 * 
	 */
	private static final long serialVersionUID = -4739010619067364912L;
	// Fields    

     private String id;
     private View view;
     private Route route;


    // Constructors

    /** default constructor */
    public RouteView() {
    }

    
    /** full constructor */

   
    // Property accessors

    public String getId() {
        return this.id;
    }
    
    public RouteView(String id, View view, Route route) {
    	//调用父类的方法与属性
		super();
		this.id = id;
		this.view = view;
		this.route = route;
	}

	public void setId(String id) {
        this.id = id;
    }

	public View getView() {
		return view;
	}

	public void setView(View view) {
		this.view = view;
	}

	public Route getRoute() {
		return route;
	}

	public void setRoute(Route route) {
		this.route = route;
	}


	@Override
	public String toString() {
		return "RouteView [id=" + id + ", view=" + view + ", route=" + route
				+ "]";
	}


   








}