package com.way.utils;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import javax.servlet.http.HttpServletRequest;
import org.springframework.web.multipart.MultipartFile;


public class UploadImg {
	
	public static String uploadImg(MultipartFile imgefile,HttpServletRequest request) {
		
		String url = request.getSession().getServletContext().getRealPath("/")
				+ "headImg\\";
		String imgeName = imgefile.getOriginalFilename();//ͼƬȫ����
		String a = imgeName.substring(imgeName.indexOf("."),imgeName.length());//ȡ��׺���� .jpg��
		String filename = getFileName(a);
		File dir = new File(url);
		if (!dir.exists()) {
			dir.mkdirs();
		}
		
		// ����һ��Ŀ���ļ���Ҫ�ϴ������������ļ�
		File targeFile = new File(url + filename);
		if (!targeFile.exists()) {
			try {
				targeFile.createNewFile();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		// ���ϴ����ļ����Ƶ�Ŀ���ļ�
		try {
			imgefile.transferTo(targeFile);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return filename;
	}
	
	private static int num=0;
	
	public static synchronized String getFileName(String a){
		return String.valueOf(new Date().getTime())+num++ +a;//��������
	}

}
