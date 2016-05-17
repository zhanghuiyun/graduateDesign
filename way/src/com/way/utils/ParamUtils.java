package com.way.utils;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

/*
 *   接收配置文件的参数 
 */

public class ParamUtils {
	private Properties properties = new Properties();
	private static ParamUtils paramUtils;

	public void init(){
		InputStream in = this.getClass().getResourceAsStream("/param.properties");
		try {
			properties.load(in);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	public static ParamUtils getInstance(){
		if(paramUtils==null){
			paramUtils = new ParamUtils();
			paramUtils.init();
		}
		return paramUtils;
	}
	
	public String getValue(String key){
		return this.properties.getProperty(key);
	}
	
}
