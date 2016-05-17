package test;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.way.entity.User;
import com.way.service.UserService;

public class test {
	public static void main(String[] args) {
		
//		Logger log=LogManager.getLogger(test.class);
		ApplicationContext ac = new ClassPathXmlApplicationContext(
				new String[]{"applicationContext.xml"});
		UserService userService = (UserService) ac.getBean("userService");
		User user = new User();
		user.setUserId("40283f86540d98db01540fa9c24b005c");
		user.setTelephone("@@");
		user.setIntroduce("@@");
		userService.updateInfo(user);
		
//		 try{
//			 User user=null;
//			Validate.notNull(user);
//			 
//		 }catch(Exception e){
//			 log.info(e.getMessage(), e);
//			  
//		 }
	}
}
