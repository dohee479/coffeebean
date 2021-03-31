package com.mycompany.webapp.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.webapp.dto.User;
import com.mycompany.webapp.service.UsersService;

@Controller
@RequestMapping("/mypage")
public class MypageController {
	
	private static final Logger logger = LoggerFactory.getLogger(MypageController.class);
	
	@Autowired
	private UsersService usersService;
	
	@GetMapping("/orderlist")
	public String OrderList() {
		return "mypage/orderlist";
	}
	
	@GetMapping("/refund")
	public String RefundList() {
		return "mypage/refund";
	}

	@GetMapping("/zzim")
	public String ZzimList() {
		return "mypage/zzim";
	}
	
	@GetMapping("/change-info")
	public String ChangeInfo(Authentication authentication, Model model) {
		UserDetails userDetails =(UserDetails)authentication.getPrincipal();
		String user_id=userDetails.getUsername();
		User dbUser= usersService.findById(user_id);
		model.addAttribute("user_id",dbUser.getUser_id());
		model.addAttribute("user_name",dbUser.getUser_name());
		model.addAttribute("user_tel",dbUser.getUser_tel());
		model.addAttribute("user_address",dbUser.getUser_address());
		model.addAttribute("user_detail_address",dbUser.getUser_detail_address());
		model.addAttribute("user_zipcode",dbUser.getUser_zipcode());
		return "mypage/change-info";
	}
  
	@PostMapping("/change-info")
	public void changeInfo_result(User user,HttpServletResponse response) throws IOException {
		usersService.updateInfo(user);
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();	 
		out.println("<script>alert('회원정보가 변경되었습니다.'); location.replace('change-info'); </script>");
		 
		out.flush();
		//return  "redirect:/mypage/change-info";
	}
	
	@PostMapping("/change-pwd")
	public void changeInfo_pwd(Authentication authentication,String user_password,String new_password1,HttpServletResponse response) throws IOException {
		UserDetails userDetails =(UserDetails)authentication.getPrincipal();
		String user_id=userDetails.getUsername();
		User user=new User();
		user.setUser_password(user_password);
		user.setUser_id(user_id);
		String result=usersService.updatePassword(user,new_password1);
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		if(result.equals("success")) {
			out.println("<script>alert('비밀번호가 변경되었습니다.'); location.replace('change-info'); </script>");
		}else {				 
			out.println("<script>alert('현재 비밀번호가 틀렸습니다.'); location.replace('change-info'); </script>");
		}
		
	}
	
	@GetMapping("/basket")
	public String basket() {
		return "mypage/basket";
	}
	
	@GetMapping("/my-review")
	public String MyReview() {
		return "mypage/my-review";
	}
	
	@GetMapping("/my-qna")
	public String MyQna() {
		return "mypage/my-qna";
	}
	
	@GetMapping("/delete-account")
	public String DeleteAccount() {
		return "mypage/delete-account";
	}
	
	@PostMapping("/delete-account")
	public String DeleteAccount_process(Authentication authentication,HttpSession session) {
		UserDetails userDetails =(UserDetails)authentication.getPrincipal();
		String user_id=userDetails.getUsername();
		logger.info(user_id);
		session.invalidate();
		//usersService.delete(user_id);
		return "mypage/delete-account";
		/*
		 * usersService.delete(user_id); logger.info("딜리트에 들어옴");
		 */
		
	}
}
