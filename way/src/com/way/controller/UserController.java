package com.way.controller;

import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import net.sf.json.JSONObject;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import com.way.entity.User;
import com.way.entity.UserMapper;
import com.way.entity.UserView;
import com.way.exception.CodeException;
import com.way.exception.EmailException;
import com.way.service.UserService;
import com.way.utils.PageBean;
import com.way.utils.UploadImg;

@RequestMapping("userController")
@Controller
public class UserController {

	private static final Logger LOGGER = LogManager
			.getLogger(UserController.class);

	@Autowired
	private UserService userService;

	// 用户登录
	@ResponseBody
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public Object login(String userName, String password, HttpSession session,
			HttpServletRequest request, String url) {
		System.out.println("login controller ur;:" + url);
		JSONObject json = new JSONObject();
		boolean isExsit = this.userService.checkIsExsitAccount(userName);
		if (isExsit) {
			User user = this.userService.checkUser(userName, password);
			if (user != null) {
				if (user.getState().equals("1")) {
					session.setAttribute("user", user);
					LOGGER.info("登录成功！" + userName);
					if (url != null && !url.equals("")) {
						return "redirect:" + url;
					} else {
						json.put("result", "success");
						json.put("msg", "登录成功");
					}
				} else {
					LOGGER.info("等待管理员审批！" + userName);
					json.put("result", "error");
					json.put("msg", "等待管理员审批！");
//					request.setAttribute("error", "等待管理员审批！");
				}
			} else {
				LOGGER.info("密码不正确！" + userName);
				json.put("result", "error");
				json.put("msg", "密码不正确！");
//				request.setAttribute("error", "密码不正确！");
			}
		} else {
			LOGGER.info("用户名不存在！" + userName);
			json.put("result", "error");
			json.put("msg", "用户名不存在！");
//			request.setAttribute("error", "用户名不存在！");
		}
		return json;
	}

	// 修改用户信息（用户名，电话）
	@RequestMapping(value = "/modifyInfo")
	public String modifyInfo(User user, HttpSession session) {
		this.userService.updateInfo(user);
		User newUser = (User) session.getAttribute("user");
		newUser.setTelephone(user.getTelephone());
		newUser.setIntroduce(user.getIntroduce());
		System.out.println("new user" + newUser);
		session.setAttribute("user", newUser);
		LOGGER.info("游客修改信息成功！");
		return "user/information";
	}

	// 修改密码
	@ResponseBody
	@RequestMapping(value = "/modifyPassword")
	public Object modifyPassword(String password, String newPassword,
			HttpSession session) {
		User user = (User) session.getAttribute("user");
		String userId = user.getUserId();
		String userName = user.getUserName();
		User user1 = this.userService.checkUser(userName, password);
		JSONObject json = new JSONObject();
		if (user1 != null) {
			LOGGER.info("密码正确！");
			this.userService.updatePassword(userId, newPassword);
			json.put("status", "success");
			LOGGER.info("修改密码成功");
		} else {
			LOGGER.info("修改密码时，密码不正确！");
			json.put("status", "error");
		}
		return json;
	}

	// 通过邮箱找回密码
	@ResponseBody
	@RequestMapping(value = "getPasswordByMail", method = RequestMethod.POST)
	public Object getPasswordByMail(String userName, String mail,
			HttpServletRequest request) throws EmailException {
		JSONObject json = new JSONObject();
		boolean a = this.userService.getPasswordByMail(userName, mail);
		if (a) {// 用户名和邮箱匹配
			this.userService.setPasswordByMail(userName, mail);
			LOGGER.info("修改密码的密码已经发送到你的邮箱！");
			json.put("status", "success");
			return "forgetPassword";
		} else {
			LOGGER.info("用户名和邮箱不匹配");
			json.put("status", "error");
		}
		return json;
	}

	// 重新设置密码
	@RequestMapping(value = "/resetPassword")
	public String resetPassword(String password, String code,
			HttpServletRequest request) throws CodeException {
		this.userService.resetPassword(password, code);
		LOGGER.info("设置密码成功！" + code);
		return "login";
	}

	// 更改头像（图片上传）
	@RequestMapping("modifyHeadImg")
	public String modifyHeadImg(@RequestParam("img") MultipartFile imgefile,
			HttpServletRequest request, HttpSession session) {
		if(imgefile.getSize()>0){
			String filename = UploadImg.uploadImg(imgefile, request);// 上传图片，并返回图片新名称
			User user = (User) session.getAttribute("user");
			this.userService.updateHeadImg(user.getUserId(), filename);
			user.setImg(filename);
			session.setAttribute("user", user);
		}
		return "user/information";
	}

	// 验证用户名是否存在
	@ResponseBody
	@RequestMapping(value = "checkUsername", method = RequestMethod.POST)
	public Object checkUsername(String userName) {
		JSONObject json = new JSONObject();
		boolean isExsit = this.userService.checkIsExsitAccount(userName);
		if(isExsit){
			json.put("valid", false);
		}else{
			json.put("valid", true);
		}
		return json;
	}
	
	// 管理员修改用户状态(0 禁用 1启用)
	@RequestMapping(value = "/modifyUserState",method=RequestMethod.POST)
	public String modifyUserState(String userId,HttpServletRequest request,
			@RequestParam(value = "state") String state,
			@RequestParam(value = "role") String role,
			@RequestParam(value = "pageCurrent", defaultValue = "1") int pageCurrent,
			@RequestParam(value="pageSize",defaultValue="8")int pageSize) {
		this.userService.updateState(userId, state);
		LOGGER.info("管理员修改用户状态(0 禁用 1启用) state:" + state);
		allUser(request,role,pageCurrent,pageSize);
		return "admin/allAccount";
	}

	//管理员用户管理
	@RequestMapping(value = "findAllUser")
	public String findAllUser(HttpServletRequest request,
			@RequestParam(value = "role") String role,
			@RequestParam(value = "pageCurrent", defaultValue = "1") int pageCurrent,
			@RequestParam(value="pageSize",defaultValue="8")int pageSize) {
		allUser(request,role,pageCurrent,pageSize);
		return "admin/allAccount";
	}
	
	public void allUser(HttpServletRequest request,String role,int pageCurrent,int pageSize){
		List<Map<String,Object>> list = this.userService.findVisitors(pageSize, pageCurrent, role);
		int totalRows = this.userService.countVisitors(role);
		
		PageBean pageBean = new PageBean(totalRows,pageSize,pageCurrent,list);
		request.setAttribute("page_list", pageBean);
		request.setAttribute("role", role);
	}
	
	//管理员查找注册未审批的导游
	@RequestMapping(value="findApplyGuide")
	public String findApplyGuide(HttpServletRequest request){
		guide(request);
		return "admin/allAccount";
	}
	
	//管理员操作注册未审批的导游
	@RequestMapping(value="applyGuide",method=RequestMethod.POST)
	public String applyGuide(String userId,String state,HttpServletRequest request,
			String userName,String content){
		this.userService.applyGuide(userId, userName, state,content);
		guide(request);
		return "admin/allAccount";
	}
	
	//管理员操作注册未审批的导游公共方法
	public void guide(HttpServletRequest request){
		List<User> list = this.userService.findApplyGuide();
		PageBean pageBean = new PageBean(5,5,1,list);//其实不用分页，只是为了公用jsp页面
		request.setAttribute("page_list", pageBean);
		request.setAttribute("state", "2");//2 表示注册未审批的导游
	}
	
	@RequestMapping(value="logout")
	public String logout(HttpSession session){
		session.invalidate();
		return "go";
	}
	
	@Autowired
	private UserMapper userMapper;
	
	@ResponseBody
	@RequestMapping(value="findByUserId")
	public UserView findByUserId(String userId){
		User user = this.userService.findByUserId(userId);
		UserView userView = this.userMapper.mapping(user);
		return userView;
	}
}
