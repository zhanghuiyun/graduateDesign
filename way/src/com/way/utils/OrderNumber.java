package com.way.utils;

import java.text.SimpleDateFormat;
import java.util.Date;

public class OrderNumber {

	private static long orderNum = 0l;  
    private static String date ;
    

    public static synchronized String getOrderNumber() {  
        String str = new SimpleDateFormat("yyMMddHHmm").format(new Date());  
        if(date==null||!date.equals(str)){  
            date = str;  
            orderNum  = 0l;  
        }  
        orderNum ++;  
        long orderNo = Long.parseLong((date)) * 10000;  
        orderNo += orderNum;;  
        return orderNo+"";  
    }  
    
}
