package com.mycompany.webapp.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.webapp.dto.User;

@Controller
@RequestMapping("/user")
public class UserController {
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);

	@GetMapping("/login")
	public String login() {
		return "user/login";
	}
	@GetMapping("/id_pwd_find")
	public String id_pwd_find() {
		return "user/id_pwd_find";
	}
	@GetMapping("/join")
	public String join() {
		return "user/join";
	}
//	@PostMapping("/#")
//	public void updatePassword(User user) {
//		
//	}
//	
//	@PostMapping("/#")
//	public void delteteUser(User user) {
//		
//	}
}