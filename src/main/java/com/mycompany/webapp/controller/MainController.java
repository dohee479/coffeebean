package com.mycompany.webapp.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.mycompany.webapp.dto.Review;

@Controller()
public class MainController {
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@GetMapping("/")
	public String home() {
		return "home";
	}
	@GetMapping("/story")
	public String Stroy() {
		return "story/story";
	}
}
