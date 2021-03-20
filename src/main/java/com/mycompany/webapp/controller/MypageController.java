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

	@GetMapping("/zzim")
	public String ZzimList() {
		return "mypage/zzim";
	}
	
	@GetMapping("/orderlist")
	public String OrderList() {
		return "mypage/orderlist";
	}

	@GetMapping("/refund")
	public String RefundList() {
		return "mypage/refund";
	}
}
