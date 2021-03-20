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

	@RequestMapping("orderlist")
	public String orderlist() {		
		return "mypage/orderlist";
	}
	
	@RequestMapping("refund")
	public String refund() {		
		return "mypage/refund";
	}
	
	@GetMapping("/zzim")
	public String ZzimList() {
		return "mypage/zzim";
	}
	
	@RequestMapping("my-qna")
	public String my_qna() {		
		return "mypage/my-qna";
	}
	
	@RequestMapping("change-info")
	public String change_info() {
		return "mypage/change-info";
	}
	
	@RequestMapping("my-review")
	public String my_review() {		
		return "mypage/my_review";

	@GetMapping("/orderlist")
	public String OrderList() {
		return "mypage/orderlist";
	}

	@GetMapping("/refund")
	public String RefundList() {
		return "mypage/refund";
	}
}
