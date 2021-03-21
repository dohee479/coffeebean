package com.mycompany.webapp.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/mypage")
public class MypageController {
	private static final Logger logger = LoggerFactory.getLogger(MypageController.class);

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
	public String ChangeInfo() {
		return "mypage/change-info";
	}
  
	@GetMapping("basket")
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
}
