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
		String imgeName = imgefile.getOriginalFilename();//图片全名称
		String a = imgeName.substring(imgeName.indexOf("."),imgeName.length());//取后缀（如 .jpg）
		String filename = getFileName(a);
		File dir = new File(url);
		if (!dir.exists()) {
			dir.mkdirs();
		}
		
		// 创建一个目标文件，要上传到服务器的文件
		File targeFile = new File(url + filename);
		if (!targeFile.exists()) {
			try {
				targeFile.createNewFile();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		// 把上传的文件复制到目标文件
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
		return String.valueOf(new Date().getTime())+num++ +a;//重新命名
	}

}
