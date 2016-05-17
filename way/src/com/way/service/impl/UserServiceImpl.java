package com.way.service.impl;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.way.dao.UserDao;
import com.way.entity.User;
import com.way.exception.CodeException;
import com.way.exception.EmailException;
import com.way.service.BaseServiceImpl;
import com.way.service.UserService;
import com.way.utils.PasswordEncoder;
import com.way.utils.SendMail;
import com.way.utils.UUIDUtils;

public class UserServiceImpl extends BaseServiceImpl<User> implements UserService {

	private UserDao userDao;

	public UserDao getUserDao() {
		return userDao;
	}

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	public void saveUser(User user) {
		this.userDao.saveUser(user);
	}

	public User checkUser(String userName, String password) {
		String salt = this.userDao.findSalt(userName);// 从数据库取到盐值
		String newPassword = PasswordEncoder.getNewPassword(salt, password);// 通过hash算法，算出新密码
		System.out.println("新密码：" + newPassword);
		return this.userDao.checkUser(userName, newPassword);
	}

	public boolean checkIsExsitAccount(String userName) {
		return this.userDao.checkIsExsitAccount(userName);
	}

	public void updatePassword(String userId, String password) {
		String salt = String.valueOf(new Date().getTime());// 设置盐值
		String newPassword = PasswordEncoder.getNewPassword(salt, password);// 通过hash算法，算出新密码
		this.userDao.updatePassword(userId, newPassword, salt);
	}

	public void updateInfo(User info) {
		this.userDao.updateInfo(info);
	}

	public void updateState(String userId, String state) {
		this.userDao.updateState(userId, state);
		if(state.equals("3")){
			
		}
	}

	public List<Map<String, Object>> findVisitorsByKey(String key) {
		return this.userDao.findVisitorsByKey(key);
	}

	public List<Map<String, Object>> findguidersByKey(String key) {
		return this.userDao.findguidersByKey(key);
	}

	// 根据用户名取得邮箱
	public String findMail(String userName) {
		return this.userDao.findMail(userName);
	}

	public void setPasswordByMail(String userName, String mail) throws EmailException {
		String code = UUIDUtils.getUUID();
		String msg = "<h1>在路上旅游网密码修改邮件!点下面链接完成密码修改操作!</h1><h3><a target='_blank' href='http://wuwei-pc:7080/way/content/setPassword.jsp?code="
				+ code + "'>" + code + "</a></h3>";
		try{
			SendMail.sendEmail(mail, msg);
		}catch(Exception exception){
			throw new EmailException("邮件发送异常");
		}
		this.userDao.updateCode(userName, code);
	}

	public void updateHeadImg(String userId, String img) {
		this.userDao.updateHeadImg(userId, img);
	}

	public void resetPassword(String password, String code)
			throws CodeException {
		boolean a = this.userDao.isExsitCode(code);
		if (a) {
			String salt = String.valueOf(new Date().getTime());// 设置盐值
			this.userDao.resetPassword(password, salt, code);
		} else {
			throw new CodeException("修改密码的密钥已失效！");
		}
	}

	public boolean getPasswordByMail(String userName, String mail) {
		return this.userDao.getPasswordByMail(userName, mail);
	}

	public List<Map<String, Object>> findVisitors(int pageSize,
			int pageCurrent, String role) {
		return this.userDao.findVisitors(pageSize, pageCurrent, role);
	}

	public int countVisitors(String role) {
		return this.userDao.countVisitors(role);
	}

	public List<User> findApplyGuide() {
		return this.userDao.findApplyGuide();
	}

	public void applyGuide(String userId, String userName, String state,String content) {
		this.userDao.updateState(userId, state);
		if(state.equals("3")){
			String mail  = this.userDao.findMail(userName);
			SendMail.sendEmail(mail, content);
		}
	}

	public User findByUserId(String userId) {
		return this.userDao.findByUserId(userId);
	}

}
