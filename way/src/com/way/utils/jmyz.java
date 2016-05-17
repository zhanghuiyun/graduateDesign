package com.way.utils;


import javax.mail.Authenticator;   
import javax.mail.*;   
public class jmyz  extends   Authenticator {
	 String username = null;   
	 String password = null;   
	 public PasswordAuthentication performCheck(String user,String pass){   
	          username = user;   
	          password = pass;   
	          return getPasswordAuthentication();   
	 }   
	protected PasswordAuthentication getPasswordAuthentication(){
	          return new PasswordAuthentication(username,password);
	}   

}
