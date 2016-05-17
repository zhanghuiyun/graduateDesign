package com.way.service;

import java.util.List;
import java.util.Map;

import com.way.entity.User;
import com.way.exception.CodeException;
import com.way.exception.EmailException;

public interface UserService {
	public void saveUser(User user);//注册
	//登录验证
	public User checkUser(String userName,String password);
	//检查账号是否存在数据库
	public boolean checkIsExsitAccount(String userName);
	//修改用户密码
	public void updatePassword(String userId,String password); 
	//修改用户信息（用户名，电话）
	public void updateInfo(User info);
	//修改用户状态(0 禁用 1启用)
	public void updateState(String userId,String state);
	
	//分页查找游客或导游
	public List<Map<String,Object>> findVisitors(int pageSize, int pageCurrent,String state);
	//查找游客或导游的数量（分页）
	public int countVisitors(String role);
	
	//查找注册未审批的导游
	public List<User> findApplyGuide();
	
	//根据关键字查找游客
	public List<Map<String,Object>> findVisitorsByKey(String key);
	//根据关键字查找导游和旅行社
	public List<Map<String,Object>> findguidersByKey(String key);
	
	//根据用户名取得邮箱
	public String findMail(String userName);
	//根据用户名来设置修改密码的密钥
	public void setPasswordByMail(String userName, String mail) throws EmailException;
	//修改用户头像
	public void updateHeadImg(String userId,String img);
	//重新设置密码
	public void resetPassword(String password,String code) throws CodeException;
	//通过邮箱找回密码
	public boolean getPasswordByMail(String userName,String mail);
	//管理员审批不通过
	public void applyGuide(String userId,String userName,String state,String content);
	
	//根据id查找用户信息
	public User findByUserId(String userId);
	
	public void test(String a);
}
