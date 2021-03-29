package com.mycompany.webapp.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/order")
public class OrderController {
	
	private static final Logger logger = LoggerFactory.getLogger(OrderController.class);
	
	@GetMapping("/fill_out_order")
	public String fill_out_order(){
		return "order/fill_out_order";
	}

	
	@GetMapping("/order_complete")
	public String order_complete() {
		return "order/order_complete";
	}
}
