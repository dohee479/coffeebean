package com.mycompany.webapp.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.webapp.service.QuestionsService;

@Controller
@RequestMapping("/product")
public class ProductController {
	
	private static final Logger logger = LoggerFactory.getLogger(MypageController.class);
	
	@Autowired
	private QuestionsService questionsService;
	
	@GetMapping("/country") 
	public String Country() {
		return "/product/country";
	}
	
	@GetMapping("/flavor") 
	public String Flavor() {
		return "/product/flavor";
	}
	
	@GetMapping("/detail")
	public String Detail() {
		return "/product/detail";
	}

}
