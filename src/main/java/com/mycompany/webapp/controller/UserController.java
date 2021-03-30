package com.mycompany.webapp.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.webapp.dto.User;
import com.mycompany.webapp.service.UsersService;

@Controller
@RequestMapping("/user")
public class UserController {
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	@Autowired
	private UsersService usersService;

	@GetMapping("/login")
	public String loginForm() {
		return "user/login";
	}
	@PostMapping("/login")
	public String login(User user) {
		String result = usersService.login(user);
		if (result.equals("success")) {
			return "redirect:/";
		} else {
			return "redirect:/user/login";			
		}
	}
	@GetMapping("/id_pwd_find")
	public String id_pwd_find() {
		return "user/id_pwd_find";
	}
	@GetMapping("/join")
	public String joinForm() {
		return "user/join";
	}
	
	@PostMapping("/join")
	public String join(User user) {
		logger.info(user.getUser_email());
		usersService.join(user);
		return "redirect:/user/login";
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