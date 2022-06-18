package com.groupchat.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class HomeController {

	@RequestMapping("/index")
	public String home() {
		return "index";
	}

	@RequestMapping("/")
	public String index() {
		return "index";
	}

	@RequestMapping("/chat")
	public String chat(HttpServletRequest request , HttpServletResponse response) {
		HttpSession session = request.getSession();
		String user = (String) session.getAttribute("user");
		if (user == null )
			return "index";
		return "chat";
	}
	
	@RequestMapping("/setuser")
	public String setuser(HttpServletRequest request , HttpServletResponse response) {
		String user = request.getParameter("user");
		HttpSession session = request.getSession();
		session.setAttribute("user",user);
		return "setuser";
	}

}
