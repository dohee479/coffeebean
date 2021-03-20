package com.mycompany.webapp.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user")
public class UserController {
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);

	@RequestMapping("sign_in_up")
	public String sign_in_up() {
		return "user/sign_in_up";
	}
	@RequestMapping("id_pwd_find")
	public String id_pwd_find() {
		return "user/id_pwd_find";
	}
}
