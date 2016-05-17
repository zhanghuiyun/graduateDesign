package com.way.entity;

public class UserView {

	private String userId;
	// @Length(min=5,max=16,message="用户名长度不正确")
	private String userName;
	private String img;
	// @Length(min=6,max=16,message="密码长度不正确")
	private String password;
	private String salt;
	// @Length(min=11,max=11,message="电话号码长度不正确")
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
	
	
	public UserView() {
		super();
	}


	public UserView(String userId, String userName, String img,
			String password, String salt, String telephone, String mail,
			String realName, String idNumber, String picture, String role,
			String introduce, String state, String code, String afalse) {
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
		this.code = code;
		this.afalse = afalse;
	}


	public String getUserId() {
		return userId;
	}


	public void setUserId(String userId) {
		this.userId = userId;
	}


	public String getUserName() {
		return userName;
	}


	public void setUserName(String userName) {
		this.userName = userName;
	}


	public String getImg() {
		return img;
	}


	public void setImg(String img) {
		this.img = img;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public String getSalt() {
		return salt;
	}


	public void setSalt(String salt) {
		this.salt = salt;
	}


	public String getTelephone() {
		return telephone;
	}


	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}


	public String getMail() {
		return mail;
	}


	public void setMail(String mail) {
		this.mail = mail;
	}


	public String getRealName() {
		return realName;
	}


	public void setRealName(String realName) {
		this.realName = realName;
	}


	public String getIdNumber() {
		return idNumber;
	}


	public void setIdNumber(String idNumber) {
		this.idNumber = idNumber;
	}


	public String getPicture() {
		return picture;
	}


	public void setPicture(String picture) {
		this.picture = picture;
	}


	public String getRole() {
		return role;
	}


	public void setRole(String role) {
		this.role = role;
	}


	public String getIntroduce() {
		return introduce;
	}


	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}


	public String getState() {
		return state;
	}


	public void setState(String state) {
		this.state = state;
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
	
	
}
