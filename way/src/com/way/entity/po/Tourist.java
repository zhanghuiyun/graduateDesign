package com.way.entity.po;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

import com.way.entity.User;

// default package

/**
 * Tourist entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "t_way_tourist")
public class Tourist  implements java.io.Serializable {


    // Fields
	private static final long serialVersionUID = 2288279132382484064L;
	@Id
	@Column(name = "tourist_id")
	@GeneratedValue(generator="idGenerator")
	@GenericGenerator(name="idGenerator", strategy="uuid")
	private String touristId;
	
	@ManyToOne(cascade = CascadeType.PERSIST, optional = false, fetch = FetchType.EAGER)
	@JoinColumn(name = "user_id")
    private User user;
	
	@Column(name = "tourist_name")
    private String touristName;
	
	@Column(name = "tourist_tele")
    private String touristTele;
	
	@Column(name = "tourist_id_num")
    private String touristIdNum;


    // Constructors

    /** default constructor */
    public Tourist() {
    }

    
    /** full constructor */
    public Tourist(User user, String touristName, String TouristTele, String TouristIdNum) {
        this.user = user;
        this.touristName = touristName;
        this.touristTele = TouristTele;
        this.touristIdNum = TouristIdNum;
    }

   
    // Property accessors

    public String getTouristId() {
        return this.touristId;
    }
    
    public void setTouristId(String touristId) {
        this.touristId = touristId;
    }

    public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getTouristName() {
        return this.touristName;
    }
    
    public void setTouristName(String touristName) {
        this.touristName = touristName;
    }

    public String getTouristTele() {
        return this.touristTele;
    }
    
    public void setTouristTele(String TouristTele) {
        this.touristTele = TouristTele;
    }

    public String getTouristIdNum() {
        return this.touristIdNum;
    }
    
    public void setTouristIdNum(String TouristIdNum) {
        this.touristIdNum = TouristIdNum;
    }
}