package com.way.utils;

import java.util.UUID;

/**
 * ��������ַ����Ĺ�����
 * @author ����.����
 *
 */

public class UUIDUtils {
	/**
	 * ���������ַ���
	 * @return
	 */
	public static String getUUID(){
		return UUID.randomUUID().toString().replace("-", "");
	}
	
	public static void main(String[] args) {
		System.out.println(UUIDUtils.getUUID());
	}
}