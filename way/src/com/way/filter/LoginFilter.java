package com.way.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.way.entity.User;

public class LoginFilter implements Filter{

	public void destroy() {
		System.out.println("LoginFilter destroy 方法");
	}

	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		String url = req.getServletPath();
		HttpSession session = req.getSession();
		User user = (User) session.getAttribute("user");
		if(user!=null){
			chain.doFilter(request, response);
		}else{
			res.sendRedirect(req.getContextPath()+"/content/login.jsp?url="+url);
		}
	}

	public void init(FilterConfig filterConfig) throws ServletException {
		System.out.println("LoginFilter init 方法");
	}

}
