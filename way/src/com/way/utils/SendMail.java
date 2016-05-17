package com.way.utils;

import java.util.Properties;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SendMail {
	private static final String SUBJECT = "����"; // ����

	public SendMail() {

	}

	/**
	 * �����ʼ�����
	 * 
	 * @param fromAddress
	 *            ������ַ
	 * @param username
	 *            �����û���
	 * @param password
	 *            ��������
	 * @param toAddress
	 *            ���ʼ���ַ
	 * @param mge
	 *            �ʼ�����
	 */
	public static void sendMessage(String fromAddress, String username,
			String password, String toAddress, String mge) {
		Properties props = new Properties();
		String mailType = cutFromAddress(fromAddress);// xmnode.com
		String mailserver = null;
		// ���Գɹ�
		if (mailType.equals("163.com") || mailType.equals("sohu.com")
				|| mailType.equals("126.com") || mailType.equals("xmnode.com")) {
			mailserver = "smtp." + mailType;
			System.out.println("mailserver=====" + mailserver);// smtp.xmnode.com
			props.setProperty("mail.smtp.host", mailserver);
			props.setProperty("mail.smtp.auth", "true");
		}

		if (mailType.indexOf("sina") != -1) // ��֤�Ѿ��ɹ�
		{
			mailserver = "smtp.sina.com.cn";// "202.106.187.180";
			System.out.println("mailserver=====" + mailserver);
			props.setProperty("mail.smtp.host", mailserver);
			props.setProperty("mail.smtp.auth", "true");

		}

		if (mailType.indexOf("gmail") != -1) { // ��֤�Ѿ��ɹ�
			mailserver = "smtp.gmail.com";
			System.out.println("mailtype===============" + mailType);
			String SSL_FACTORY = "javax.net.ssl.SSLSocketFactory";
			props.setProperty("mail.smtp.host", mailserver);
			props.setProperty("mail.smtp.socketFactory.class", SSL_FACTORY);
			props.setProperty("mail.smtp.socketFactory.fallback", "false");
			props.setProperty("mail.smtp.port", "465");
			props.setProperty("mail.smtp.socketFactory.port", "465");
			props.setProperty("mail.smtp.auth", "true");
			props.setProperty("mail.smtp.ssl", "true");
		}
		// props.put("mail.smtp.user",username); //��ӷ���Email�û���
		// props.put("mail.smtp.password",password);//��ӷ���Email����
		jmyz auth = new jmyz();
		auth.performCheck(fromAddress, password);
		Session session = Session.getInstance(props, auth);
		session.setDebug(true);
		try {
			System.out.println("���Ϳ�ʼ��");
			Message msg = new MimeMessage(session);
			msg.setFrom(new InternetAddress(fromAddress)); // ���÷���Email
			msg.setRecipient(Message.RecipientType.TO, new InternetAddress(
					toAddress)); // �����ռ��˵�ַ
			msg.setSubject(SUBJECT); // �����ʼ�����
			msg.setSubject("������·�������������޸��ʼ�");
			// �����ʼ�����:
			msg.setContent(mge, "text/html;charset=UTF-8");
			// 3.�����ʼ�:

			Transport transport = session.getTransport("smtp");
			transport.connect(mailserver, username, password);// 2
			transport.sendMessage(msg, msg.getAllRecipients());
			System.out.println("���ͳɹ���");
		} catch (Exception e) {
			System.out.println(e);
		}
	}

	// ��ȡ�����ʼ�������
	public static String cutFromAddress(String fromAddress) {
		String mailType = fromAddress.substring(fromAddress.indexOf("@") + 1,
				fromAddress.length());
		System.out.println("======mailType======" + mailType);
		return mailType;
	}

	public static void sendEmail(String mail,String msg){
		String fromAddress = "wuw@xmnode.com";
		String username = "wuw";
		String password = "zxcvbnm456";
		sendMessage(fromAddress, username, password, mail, msg);
	}
	
	public static void main(String[] args) {
//		SendMail sendMail = new SendMail();
//		String fromAddress = "wuw@xmnode.com";
//		String username = "wuw";
//		String password = "zxcvbnm123";
//		String toAddress = "zhanghy@xmnode.com";
//		String mge = "ff80808152edbab80152edbabcc90001";
//		sendMail.sendMessage(fromAddress, username, password, toAddress, mge);
	}
}
