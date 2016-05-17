package com.way.utils;

import java.security.MessageDigest;

public class PasswordEncoder {

	private final static String[] hexDigits = { "0", "1", "2", "3", "4", "5",
			"6", "7", "8", "9", "a", "b", "c", "d", "e", "f" };

	private Object salt;
	private String algorithm;

	public PasswordEncoder(Object salt, String algorithm) {
		this.salt = salt;
		this.algorithm = algorithm;
	}

	public String encode(String rawPass) {
		String result = null;
		try {
			MessageDigest md = MessageDigest.getInstance(algorithm);
			// ���ܺ���ַ���
			result = byteArrayToHexString(md.digest(mergePasswordAndSalt(
					rawPass).getBytes("utf-8")));
		} catch (Exception ex) {
		}
		return result;
	}

	private String mergePasswordAndSalt(String password) {
		if (password == null) {
			password = "";
		}

		if ((salt == null) || "".equals(salt)) {
			return password;
		} else {
			return password + "{" + salt.toString() + "}";
		}
	}

	/**
	 * ת���ֽ�����Ϊ16�����ִ�
	 * 
	 * @param b
	 *            �ֽ�����
	 * @return 16�����ִ�
	 */
	private static String byteArrayToHexString(byte[] b) {
		StringBuffer resultSb = new StringBuffer();
		for (int i = 0; i < b.length; i++) {
			resultSb.append(byteToHexString(b[i]));
		}
		return resultSb.toString();
	}

	private static String byteToHexString(byte b) {
		int n = b;
		if (n < 0)
			n = 256 + n;
		int d1 = n / 16;
		int d2 = n % 16;
		return hexDigits[d1] + hexDigits[d2];
	}
	
	public static String getNewPassword(String salt,String password){
		PasswordEncoder encoderMd5 = new PasswordEncoder(salt, "MD5");
		String newPassword = encoderMd5.encode(password);
		return newPassword;
	}

	public static void main(String[] args) {
//		String salt = "81d85cd0-477f-4149-a51c-5b24d6c6c1cb";
//		PasswordEncoder encoderMd5 = new PasswordEncoder(salt, "MD5");
//		String encode = encoderMd5.encode("password");
//		System.out.println(encode);

		String a = PasswordEncoder.getNewPassword("zxc", "qw");
		System.out.println(a);
	}

}