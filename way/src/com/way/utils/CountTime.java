package com.way.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class CountTime {

	public static int subtract(String nextTime) throws ParseException{
//    	SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
    	SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
    	Date d1 = df.parse(nextTime);
    	Date d2 = new Date();
    	int day=(int) ((d1.getTime()-d2.getTime())/(24*60*60*1000)); 
    	return day;
	}
	
	public static void main(String[] args) throws ParseException {
		int a = subtract("2016-02-25");
		System.out.println(a);
	}
}
