package com.hand.interceptor;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.resource.ResourceHttpRequestHandler;

public class LoginInterceptor  implements HandlerInterceptor{

	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		 if(handler instanceof ResourceHttpRequestHandler){
	            return true;
	     }
		String context = request.getServletPath();
		HttpSession session =request.getSession();
		Object obj  = session.getAttribute("user");
		if(context.equals("/customer/validate")||context.equals("/login.do")){
				return true;
		}else if(obj !=null){
			return true;
		}else{
			RequestDispatcher rd = request.getRequestDispatcher("/login.do");
			rd.forward(request, response);
		}
		return  false;
	}

	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
	
	}

	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
	}

}
