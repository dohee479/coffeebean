package com.mycompany.webapp.controller;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/** 동호 test test22
 * Handles requests for the application home page.
 */

/* 종현 test 123
 * 
 */
@Controller()
public class MainController {
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.asdf
	 */
	@RequestMapping("/")
	public String home() {
		return "home";
	}
	@RequestMapping("/story")
	public String Stroy() {
		return "story/story";
	}
}
