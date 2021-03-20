package com.mycompany.webapp.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/order")
public class OrderController {
	private static final Logger logger = LoggerFactory.getLogger(OrderController.class);
	
	@RequestMapping("fill_out_order")
	public String fill_out_order(){
		return "order/fill_out_order";
	}
	
	@RequestMapping("order_complete")
	public String order_complete() {
		return "order/order_complete";
	}

}
