package com.way.entity;

// default package

import java.util.HashSet;
import java.util.Set;

//import org.hibernate.validator.constraints.Email;
//import org.hibernate.validator.constraints.Length;

/**
 * User entity. @author MyEclipse Persistence Tools
 */
@SuppressWarnings("rawtypes")
public class User implements java.io.Serializable {

	// Fields

	/**
	 * 
	 */
	private static final long serialVersionUID = 6268503788689542987L;
	private String userId;
	// @Length(min=5,max=16,message="�û���Ȳ���ȷ")
	private String userName;
	private String img;
	// @Length(min=6,max=16,message="���볤�Ȳ���ȷ")
	private String password;
	//密码加密
	private String salt;
	// @Length(min=11,max=11,message="�绰���볤�Ȳ���ȷ")
	private String telephone;
	// @Email
	private String mail;
	private String realName;
	private String idNumber;
	private String picture;
	private String role;
	private String introduce;
	private String state;
	private String code;
	private String afalse;
	private Set Reserves = new HashSet(0);
	private Set Feedbacks = new HashSet(0);
	private Set Assesses = new HashSet(0);
	private Set Routes = new HashSet(0);

	// Constructors

	/** default constructor */
	public User() {
	}

	/** minimal constructor */
	public User(String userName, String img, String password, String salt,
			String telephone, String mail, String role, String state,String afalse) {
		this.userName = userName;
		this.img = img;
		this.password = password;
		this.salt = salt;
		this.telephone = telephone;
		this.mail = mail;
		this.role = role;
		this.state = state;
		this.afalse = afalse;
	}

	/** full constructor */

	// Property accessors

	public String getUserId() {
		return this.userId;
	}

	public User(String userId, String userName, String img, String password,
			String salt, String telephone, String mail, String realName,
			String idNumber, String picture, String role, String introduce,String afalse,
			String state, Set reserves, Set feedbacks, Set assesses, Set routes) {
		super();
		this.userId = userId;
		this.userName = userName;
		this.img = img;
		this.password = password;
		this.salt = salt;
		this.telephone = telephone;
		this.mail = mail;
		this.realName = realName;
		this.idNumber = idNumber;
		this.picture = picture;
		this.role = role;
		this.introduce = introduce;
		this.state = state;
		this.afalse = afalse;
		Reserves = reserves;
		Feedbacks = feedbacks;
		Assesses = assesses;
		Routes = routes;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return this.userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getImg() {
		return this.img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getSalt() {
		return this.salt;
	}

	public void setSalt(String salt) {
		this.salt = salt;
	}

	public String getTelephone() {
		return this.telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public String getMail() {
		return this.mail;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}

	public String getRealName() {
		return this.realName;
	}

	public void setRealName(String realName) {
		this.realName = realName;
	}

	public String getIdNumber() {
		return this.idNumber;
	}

	public void setIdNumber(String idNumber) {
		this.idNumber = idNumber;
	}

	public String getPicture() {
		return this.picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}

	public String getRole() {
		return this.role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getIntroduce() {
		return this.introduce;
	}

	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}

	public String getState() {
		return this.state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public Set getReserves() {
		return Reserves;
	}

	public void setReserves(Set reserves) {
		Reserves = reserves;
	}

	public Set getFeedbacks() {
		return Feedbacks;
	}

	public void setFeedbacks(Set feedbacks) {
		Feedbacks = feedbacks;
	}

	public Set getAssesses() {
		return Assesses;
	}

	public void setAssesses(Set assesses) {
		Assesses = assesses;
	}

	public Set getRoutes() {
		return Routes;
	}

	public void setRoutes(Set routes) {
		Routes = routes;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getAfalse() {
		return afalse;
	}

	public void setAfalse(String afalse) {
		this.afalse = afalse;
	}

	@Override
	public String toString() {
		return "User [userId=" + userId + ", userName=" + userName + ", img="
				+ img + ", password=" + password + ", salt=" + salt
				+ ", telephone=" + telephone + ", mail=" + mail + ", realName="
				+ realName + ", idNumber=" + idNumber + ", picture=" + picture
				+ ", role=" + role + ", introduce=" + introduce + ", state="
				+ state;
	}

}