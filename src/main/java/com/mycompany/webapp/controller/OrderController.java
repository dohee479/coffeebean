package com.mycompany.webapp.controller;

import java.security.Principal;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.webapp.dto.Order;
import com.mycompany.webapp.dto.Orderinfo;
import com.mycompany.webapp.dto.Product;
import com.mycompany.webapp.dto.User;
import com.mycompany.webapp.service.OrdersService;
import com.mycompany.webapp.service.ProductsService;
import com.mycompany.webapp.service.UsersService;

@Controller
@RequestMapping("/order")
public class OrderController {
	
	@Autowired
	ProductsService productsService;
	
	@Autowired
	UsersService usersService;
	
	@Autowired
	OrdersService ordersService;
	
	private static final Logger logger = LoggerFactory.getLogger(OrderController.class);
	
	@GetMapping("/fill_out_order")
	public String fill_out_order(){
		return "order/fill_out_order";
	}

	
	@GetMapping("/order_complete")
	public String order_complete() {
		return "order/order_complete";
	}
	
	@PostMapping("/fill_out_order")
	public String fill_out_order_process(int product_id,String volume,String grind,Principal principal){
		String user_id=principal.getName();
		
		
		User user= usersService.findById(user_id);				
		int order_id=ordersService.createOrder(user);
		
		logger.info(order_id+"");
		
		
		
		
		
		Product product=productsService.selectByProductId(product_id);
		
		/* Orderinfo orderinfo=new Orderinfo(); */
		
		Integer.parseInt(volume);
		Integer.parseInt(grind);
		logger.info(Integer.parseInt(volume)+"");
		
		
		return "order/fill_out_order";
	}

	
}
