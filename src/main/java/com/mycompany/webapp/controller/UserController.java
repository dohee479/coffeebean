package com.mycompany.webapp.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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

	/*
	 * @PostMapping("/login") public String login(User user) { String result =
	 * usersService.login(user); if (result.equals("success")) { return
	 * "redirect:/"; } else { return "redirect:/user/login"; } }
	 */
	@GetMapping("/join")
	public String joinForm() {
		return "user/join";
	}
	
	@PostMapping(value="/join",produces="application/json; charset=UTF-8")
	@ResponseBody
	public String join(User user) {
		String result=usersService.join(user);
		JSONObject jsonObject = new JSONObject();
		if(result.equals("alreadyId")) {
			jsonObject.put("alreadyId","alreadyId");
		}else if(result.equals("alreadyEmail")) {
			jsonObject.put("alreadyEmail", "alreadyEmail");
		}
		else {
			jsonObject.put("joinSuccess","joinSuccess");
		}
		return jsonObject.toString();
	}

	
	@GetMapping("/id_pwd_find")
	public String id_pwd_find() {
		return "user/id_pwd_find";
	}
	
	@PostMapping(value="/id_find",produces="application/json; charset=UTF-8")
	@ResponseBody
	public String id_find(User user) {
		JSONObject jsonObject = new JSONObject();
		User dbUser=usersService.findId(user);
		if(dbUser==null) {
			jsonObject.put("findIdchk","false");
		}
		else {
			jsonObject.put("find_id", dbUser.getUser_id());
		}
		return jsonObject.toString(); 
	}
	
	@PostMapping(value="/pwd_find",produces="application/json; charset=UTF-8")
	@ResponseBody
	public String pwd_find(User user) {
		JSONObject jsonObject = new JSONObject();
		User dbUser=usersService.findPassword(user);
		if(dbUser==null) {
			jsonObject.put("findPwdchk", "false");
		}
		else {
			jsonObject.put("find_email", dbUser.getUser_email());
		}
		
		return jsonObject.toString(); 
	}
	
}