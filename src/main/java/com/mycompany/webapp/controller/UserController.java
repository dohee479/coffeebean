package com.mycompany.webapp.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.Writer;
import java.security.Principal;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
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
	private JavaMailSender mailSender;
	
	@Autowired
	private UsersService usersService;

	@GetMapping("/login")
	public String loginForm(Principal principal) {
		if((principal+"").equals("null")) {
			return "user/login";
			
		}else {
			return "redirect:/";
		}
		
	}

	@GetMapping("/join")
	public String joinForm(Principal principal) {
		if((principal+"").equals("null")) {
			return "user/join";
			
		}else {
			return "redirect:/";
		}
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
	
	@PostMapping(value="/idconfirm")
	@ResponseBody
	public String idconfirm(String user_id) {
		logger.info(user_id);
		User dbuser=usersService.findById(user_id);
		if(dbuser==null) {
			return "success";
		}else {
			return "fail";
		}
		
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
	
	
	@PostMapping("/idSendingMail")
	@ResponseBody
	public String idSendingMail(User user){
		
		String setfrom="dnsgh0000@gmail.com";
		String tomail=user.getUser_email();
		String user_name=user.getUser_name();
		String title="<콩콩콩> 아이디 정보입니다.";
		String content="<html> <body><h1>안녕하세요 콩콩콩입니다.</h1><h4>요청하신 계정 정보는 아래와 같습니다.</h4><hr></body></html>"
				+ "회원 아이디: "+user.getUser_id()+"<br>"
				+ "이름: "+user_name;
		try {
	        MimeMessage message = mailSender.createMimeMessage();
	        MimeMessageHelper messageHelper 
	                          = new MimeMessageHelper(message, true, "UTF-8");
	   
	        messageHelper.setFrom(setfrom,"콩콩콩");  
	        messageHelper.setTo(tomail);     
	        messageHelper.setSubject(title); 
	        messageHelper.setText(content,true);  
	       
	        mailSender.send(message);
	        
	      } catch(Exception e){
	        System.out.println(e);
	      }
		
		  return "success";
	}
	
	@PostMapping("/pwdSendingMail")
	@ResponseBody
	public String pwdSendingMail(User user){
		char[] charSet = new char[] { '0', '1', '2', '3', '4', '5', '6', '7',
				'8', '9', 'A', 'B', 'C', 'D', 'E', 'F', 'G',
				'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P',
				'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z' };
		int idx=0;
		String tempPwd="";
		for(int i=0; i<8;i++) {
		idx=(int)(charSet.length*Math.random());
		tempPwd=tempPwd+charSet[idx];
		}
		
		usersService.mailupdatePassword(user, tempPwd);
		
		
		String setfrom="dnsgh0000@gmail.com";
		String tomail=user.getUser_email();
		String user_name=user.getUser_name();
		String title="<콩콩콩> 임시비밀번호 입니다.";
		String content="<html> <body><h1>안녕하세요 콩콩콩입니다.</h1><h4>요청하신 계정 정보는 아래와 같습니다.</h4><hr></body></html>"
				+ "회원 아이디: "+user.getUser_id()+"<br>"
				+ "이름: "+user_name+"<br>"
				+ "임시 비밀번호: "+tempPwd;
		
		
		
		try {
	        MimeMessage message = mailSender.createMimeMessage();
	        MimeMessageHelper messageHelper 
	                          = new MimeMessageHelper(message, true, "UTF-8");
	   
	        messageHelper.setFrom(setfrom,"콩콩콩");  
	        messageHelper.setTo(tomail);     
	        messageHelper.setSubject(title); 
	        messageHelper.setText(content,true);  
	       
			mailSender.send(message);
	        
	      } catch(Exception e){
	        System.out.println(e);
	      }
		
		  return "success";
	}
}