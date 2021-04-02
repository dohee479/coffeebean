package com.mycompany.webapp.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.webapp.dto.Order;
import com.mycompany.webapp.dto.OrderProduct;
import com.mycompany.webapp.dto.Orderinfo;
import com.mycompany.webapp.dto.Product;
import com.mycompany.webapp.dto.User;
import com.mycompany.webapp.service.OrderProductsService;
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
	
	@Autowired
	OrderProductsService orderProductsService;
	
	private static final Logger logger = LoggerFactory.getLogger(OrderController.class);
	
	@GetMapping("/fill_out_order")
	public String fill_out_order(){
		
		return "order/fill_out_order";
	}

	
	@PostMapping("/order_complete")
	public String order_complete(int order_id) {
		ordersService.updateOrder(order_id);
		
		return "order/order_complete";
	}
	
	@PostMapping("/fill_out_order")
	public String fill_out_order_process(int product_id,String volume,String grind,int count,Principal principal,Model model){
		String user_id=principal.getName();
		
		Product product=productsService.selectByProductId(product_id);
		User user= usersService.findById(user_id);		
		
		int product_price=product.getProduct_price();
		int total_price;
		if(volume.equals("200")) {
			total_price=product_price*count;
		}else if(volume.equals("500")) {
			total_price=product_price*2*count;
		}else {
			total_price=product_price*4*count;
		}
		
		
		
		
		
		
		ordersService.createOrder(user,total_price); //order						
		int order_id= ordersService.getSeqOrderId();
		Order order= ordersService.getOrder(order_id);
		
		OrderProduct orderProduct=new OrderProduct();
		orderProduct.setOrder_product_volume(Integer.parseInt(volume));
		orderProduct.setOrder_product_grind(Integer.parseInt(grind));
		orderProduct.setOrder_product_count(count);
		orderProduct.setProducts_product_id(product_id);
		orderProduct.setOrders_order_id(order_id);
		orderProduct.setOrder_product_price(product_price);
		
		orderProductsService.createOrderProduct(orderProduct);
		//토탈 넣어줘야지ㅣ
		Orderinfo orderinfo=new Orderinfo(order_id,
										order.getUsers_user_id(),
										user_id,
										order.getOrder_tel(),
										order.getOrder_address(),
										order.getOrder_detail_address(),
										0,
										user.getUser_name(),
										Integer.parseInt(volume),
										Integer.parseInt(grind),
										count,
										total_price,
										product.getProduct_id(),
										product.getProduct_title(),
										product.getProduct_price(),
										product.getProduct_attachoname(),
										product.getProduct_attachsname(),
										product.getProduct_attachtype(),
										user.getUser_zipcode()
										);
		
		
		List<Orderinfo> orderinfoList = new ArrayList<Orderinfo>();
		orderinfoList.add(orderinfo);
		model.addAttribute("orderinfoList",orderinfoList);
		return "order/fill_out_order";
	}

	
}
