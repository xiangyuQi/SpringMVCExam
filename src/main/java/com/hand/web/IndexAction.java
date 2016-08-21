package com.hand.web;

import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("")
@Controller
public class IndexAction {
	@RequestMapping("/index.do")
	public String indexDo(){
		return "index";
	}
	@RequestMapping("/login.do")
	public String loginDo(){
		return "login";
	}
	@RequestMapping("/logout.do")
	public String logout(HttpServletRequest request){
		request.getSession().invalidate();
		return "login";
	}
}
