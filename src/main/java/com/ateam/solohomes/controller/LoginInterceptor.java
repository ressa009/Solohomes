package com.ateam.solohomes.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		System.out.println("preHandle");
		
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("userID");
		
		if(id == null) {
			// 로그인이 안되있다는 뜻.
			
			String urlCopy =
					request.getRequestURL().toString() + "?" + request.getQueryString();
			request.getSession().setAttribute("urlCopy", urlCopy);
			System.out.println(urlCopy);
			response.sendRedirect(request.getContextPath() + "/member/loginCheck.do");
			return false;
		}
		
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		System.out.println("postHandle");
		super.postHandle(request, response, handler, modelAndView);
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		System.out.println("afterCompletion");
		super.afterCompletion(request, response, handler, ex);
	}

}
