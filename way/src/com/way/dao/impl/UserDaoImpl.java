package com.way.dao.impl;

import java.util.List;
import java.util.Map;
import com.way.dao.BaseDaoImpl;
import com.way.dao.UserDao;
import com.way.entity.User;

public class UserDaoImpl extends BaseDaoImpl<User> implements UserDao{

	public void saveUser(User user) {
		super.getSession().save(user);
	}

	//登录验证
	public User checkUser(String userName, String password) {
		String hql = "from User u where u.userName=? and u.password =?";
		User user = (User) super.getSession().createQuery(hql)
				.setParameter(0, userName).setParameter(1, password).uniqueResult();
		return user;
	}
	
	//取得盐值
	public String findSalt(String userName){
		String hql = "select u.salt from User u where u.userName=?";
		String salt = (String)super.getSession().createQuery(hql).setParameter(0, userName).uniqueResult();
		return salt;
	}

	//检查用户名是否存在数据库
	@SuppressWarnings("unchecked")
	public boolean checkIsExsitAccount(String userName) {
		String hql = "select u.userName from User u where u.userName=?";
		List<String> list = super.getSession().createQuery(hql).setParameter(0, userName).list();
		if(list.size()>0){
			return true;
		}
		return false;
	}

	//修改用户信息（用户名，电话）
	public void updateInfo(User info) {
		info.setTelephone(info.getTelephone());
		info.setIntroduce(info.getIntroduce());
		String hql = "update User u set u.telephone=?,u.introduce=? where u.userId=?";
		int a = super.getSession().createQuery(hql).setParameter(0, info.getTelephone())
		.setParameter(1,info.getIntroduce()).setParameter(2, info.getUserId()).executeUpdate();
		System.out.println(a);
	}
	
	//修改用户密码
	public void updatePassword(String userId,String password,String salt) {
		String hql = "update User u set u.password=?,u.salt=? where u.userId=?";
		super.getSession().createQuery(hql)
		.setParameter(0, password).setParameter(1, salt).setParameter(2, userId).executeUpdate();
	}

	//修改用户状态
	public void updateState(String userId,String state) {
		String hql = "update User u set u.state=? where u.userId=?";
		super.getSession().createQuery(hql)
		.setParameter(0, state).setParameter(1, userId).executeUpdate();
	}

	//分页查找游客
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> findVisitors(int pageSize, int pageCurrent,String role) {
		StringBuffer hql = new StringBuffer("select new Map(u.userId as userId,u.userName as userName,");
		hql.append("u.img as img,u.telephone as telephone,u.mail as mail,u.introduce as introduce,u.state as state,");
		hql.append("u.afalse as afalse) from User u where u.role=? and u.state !=3 and u.state !=2 order by u.afalse desc");
		List<Map<String,Object>> list = super.getSession().createQuery(hql.toString())
				.setFirstResult((pageCurrent-1)*pageSize).setMaxResults(pageSize)
				.setParameter(0, role).list();
		return list;
	}

	//根据关键字查找游客
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> findVisitorsByKey(String key) {
		StringBuffer hql = new StringBuffer("select new Map(u.userId as userId,u.userName as userName,");
		hql.append("u.img as img,u.telephone as telephone,u.mail as mail,u.introduce as introduce,");
		hql.append("u.state as state) from User u where u.role=0 and u.userName like :key order by u.userName");
		List<Map<String,Object>> list = super.getSession().createQuery(hql.toString())
				.setParameter("key", "%"+key+"%").list();
		return list;
	}

	//根据关键字查找导游和旅行社
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> findguidersByKey(String key) {
		StringBuffer hql = new StringBuffer("select new Map(u.userId as userId,u.userName as userName,");
		hql.append("u.img as img,u.telephone as telephone,u.mail as mail,u.realName as realName,");
		hql.append("u.idNumber as idNumber,u.picture as picture,u.introduce as introduce,u.state as state)");
		hql.append(" from User u where u.role!=0 and (u.userName like :key or u.realName like :key or ");
		hql.append("u.idNumber like :key) order by u.userName");
		List<Map<String,Object>> list = super.getSession().createQuery(hql.toString())
				.setParameter("key", "%"+key+"%").list();
		return list;
	}
	
	public int countVisitors(String role) {
		String hql = "select u.userId from User u where u.role=?";
		@SuppressWarnings("unchecked")
		List<String> list = super.getSession().createQuery(hql).setParameter(0, role).list();
		return list.size();
	}

	public String findMail(String userName) {
		String hql = "select u.mail from User u where u.userName=?";
		String mail = (String)super.getSession().createQuery(hql).setParameter(0, userName).uniqueResult();
		return mail;
	}

	//修改用户修改密码的密钥
	public void updateCode(String userName,String code) {
		String hql = "update User u set u.code=? where u.userName=?";
		super.getSession().createQuery(hql)
		.setParameter(0, code).setParameter(1, userName).executeUpdate();
	}

	//更改头像
	public void updateHeadImg(String userId, String img) {
		String hql = "update User u set u.img=? where u.userId=?";
		super.getSession().createQuery(hql)
		.setParameter(0, img).setParameter(1, userId).executeUpdate();
	}

	public void resetPassword(String password,String salt,String code) {
		String hql = "update User u set u.password=?,u.salt=?,u.code=null where u.code=?";
		super.getSession().createQuery(hql)
		.setParameter(0, password).setParameter(1, salt).setParameter(2, code).executeUpdate();
	}

	@SuppressWarnings("unchecked")
	public boolean isExsitCode(String code){ 
		String hql = "select u.code from User u where u.code=?";
		List<String> list = super.getSession().createQuery(hql).setParameter(0, code).list();
		if(list.size()>0){
			return true;
		}
		return false;
	}

	public boolean getPasswordByMail(String userName, String mail) {
		String hql = "from User u where u.userName=? and u.mail=?";
		User user = (User) super.getSession().createQuery(hql)
				.setParameter(0, userName).setParameter(1, mail).uniqueResult();
		if(user!=null){
			return true;
		}
		return false;
	}
	
	//查找注册未审批的导游
	@SuppressWarnings("unchecked")
	public List<User> findApplyGuide() {
		String hql = "from User u where u.state=2";
		List<User> list = super.getSession().createQuery(hql).list();
		return list;
	}

	public User findByUserId(String userId) {
		String hql = "from User u where u.userId=?";
		User user = (User) super.getSession().createQuery(hql)
				.setParameter(0, userId).uniqueResult();
		return user;
	}


}
