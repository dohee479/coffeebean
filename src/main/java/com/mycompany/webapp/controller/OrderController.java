package com.mycompany.webapp.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.webapp.dto.BasketItem;
import com.mycompany.webapp.dto.Order;
import com.mycompany.webapp.dto.OrderProduct;
import com.mycompany.webapp.dto.Orderinfo;
import com.mycompany.webapp.dto.Product;
import com.mycompany.webapp.dto.User;
import com.mycompany.webapp.service.BasketsService;
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
	BasketsService basketsService;
	
	@Autowired
	OrderProductsService orderProductsService;
	
	private static final Logger logger = LoggerFactory.getLogger(OrderController.class);
		
	@PostMapping("/order_complete")
	public String order_complete(int order_id,
								String order_receiver,
								int order_zipcode,
								String order_address,
								String order_detail_address,
								String order_tel,
								String order_msg,
								String order_account_name,
								String order_account,
								int order_total_price,
								String method_payment,
								Model model,
								HttpServletRequest request) {
		
		Order order=new Order();
		order.setOrder_id(order_id);
		order.setOrder_receiver(order_receiver);
		order.setOrder_zipcode(order_zipcode);
		order.setOrder_address(order_address);
		order.setOrder_detail_address(order_detail_address);
		order.setOrder_tel(order_tel);
		order.setOrder_msg(order_msg);
		order.setOrder_account_name(order_account_name);
		order.setOrder_account(order_account);

		if(method_payment.equals("카카오페이 결제")) {
			order.setOrder_total_price(order_total_price);
			ordersService.updatekakaoOrder(order);
			model.addAttribute("order",order);
			return "order/payment";
		}
		
		ordersService.updateOrder(order);
		
		HttpSession session = request.getSession();
		
		if(session.getAttribute("basketArr")!=null) {
			String[] basketArr = (String[]) session.getAttribute("basketArr");
			
			for(String itemNo : basketArr) {
				basketsService.deleteBasketItem(Integer.parseInt(itemNo));
			}
			
			session.removeAttribute("basketArr");
		}
		
		if(session.getAttribute("productId")!=null) {
			List<Integer> productIdArr = (ArrayList) session.getAttribute("productId");
			
			for(int productId : productIdArr) {
				logger.info(productId+"");
				productsService.updateSaleCount(productId);
			}
			
			session.removeAttribute("productId");
		}
		
		Order completeorder=ordersService.getOrder(order_id);
		model.addAttribute("completeorder",completeorder);
		
		return "order/order_complete";
	}
	
	@PostMapping("/kakao_complete")
	public String korder_complete(int order_id,HttpServletRequest request,Model model) {
		
		
		Order order=ordersService.getOrder(order_id);

		if(order.getOrder_msg()==null) {
			order.setOrder_msg(" ");
		}
		ordersService.updateOrder(order);
		HttpSession session = request.getSession();
		
		if(session.getAttribute("basketArr")!=null) {
			String[] arr = (String[]) session.getAttribute("basketArr");
			
			for(String itemNo : arr) {
				basketsService.deleteBasketItem(Integer.parseInt(itemNo));
			}
			
			session.removeAttribute("basketArr");
		}
		
		if(session.getAttribute("productId")!=null) {
			List<Integer> arr2 = (ArrayList) session.getAttribute("productId");
			
			for(int productId : arr2) {
				productsService.updateSaleCount(productId);
			}
			
			session.removeAttribute("productId");
		}
		
		Order completeorder=ordersService.getOrder(order_id);
		model.addAttribute("completeorder",completeorder);
		model.addAttribute("kakao","kakao");
		return "order/order_complete";
	}
	
	@PostMapping("/fill_out_order")
	public String fill_out_order_process(HttpServletRequest request, 
										 int product_id,
										 String volume,
										 String grind,
										 int count,
										 Principal principal,
										 Model model){
		String user_id=principal.getName();
		
		Product product=productsService.selectByProductId(product_id);
		User user= usersService.findById(user_id);		
		
		int product_price=product.getProduct_price();
		int total_price=0;
		
		if(volume.equals("200")) {
			total_price=product_price*count;
			product_price=product_price*count;
		}else if(volume.equals("500")) {
			total_price=product_price*2*count;
			product_price=product_price*2*count;			
		}else {
			total_price=product_price*4*count;
			product_price=product_price*4*count;			
		}		

		ordersService.createOrder(user,total_price); 						
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
		
		Orderinfo orderinfo=new Orderinfo(order_id,
										order.getUsers_user_id(),
										user.getUser_name(),
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
										product_price,
										product.getProduct_attachoname(),
										product.getProduct_attachsname(),
										product.getProduct_attachtype(),
										user.getUser_zipcode()
										);
		
		
		List<Orderinfo> orderinfoList = new ArrayList<Orderinfo>();
		orderinfoList.add(orderinfo);
		model.addAttribute("orderinfoList",orderinfoList);
		
		List<Integer> productId = new ArrayList<>();
		productId.add(product.getProduct_id()); // 세션에 item_id를 저장하기 위함, order complete에서 같은 세션key로 접근하기 위함
		
		HttpSession session = request.getSession();
		session.setAttribute("productId", productId);
		
		return "order/fill_out_order";
		
		
	}
	
	
	@PostMapping("/basket_order")
	public String basketOrder(HttpServletRequest request, Principal principal,Model model) {
		String user_id=principal.getName();
		User user= usersService.findById(user_id);		
		
		
		String[] arr = request.getParameterValues("orderchk");
		List<BasketItem> BasketItemList = new ArrayList<>(); 
		
		int total_price=0;
		
		for(String itemNo : arr) {
			BasketItem basketitem =basketsService.getBasketItem(Integer.parseInt(itemNo));
			BasketItemList.add(basketitem);
		}
		for(int i=0;i<BasketItemList.size();i++) {
			int sumprice=BasketItemList.get(i).getOrder_product_price();
			total_price+=sumprice;
		}
		
		ordersService.createOrder(user, total_price);
		
		int order_id= ordersService.getSeqOrderId();
		Order order= ordersService.getOrder(order_id);
		
		List<OrderProduct> orderProductList = new ArrayList<>();
		List<Integer> productId = new ArrayList<>(); // 세션에 item_id를 저장하기 위함
		
		for(BasketItem item : BasketItemList) {
	
				OrderProduct orderProduct = new OrderProduct();
				
				orderProduct.setOrder_product_volume(item.getBasket_volume());
				orderProduct.setOrder_product_grind(item.getBasket_grind());
				orderProduct.setOrder_product_count(item.getBasket_product_count());
				orderProduct.setProducts_product_id(item.getProduct_id());
				orderProduct.setOrders_order_id(order_id);
				orderProduct.setOrder_product_price(item.getOrder_product_price());
				
				orderProductsService.createOrderProduct(orderProduct);
				orderProductList.add(orderProduct);
				
				productId.add(item.getProduct_id()); // 세션에 item_id를 저장하기 위함
		}
		
		List<Orderinfo> orderinfoList = new ArrayList<Orderinfo>();
		for(OrderProduct orderproduct:orderProductList) {
			Product product=productsService.getProduct(orderproduct.getProducts_product_id());
			Orderinfo orderinfo=new Orderinfo(order_id,
											order.getUsers_user_id(),
											user.getUser_name(),
											order.getOrder_tel(),
											order.getOrder_address(),
											order.getOrder_detail_address(),
											0,
											user.getUser_name(),
											orderproduct.getOrder_product_volume(),
											orderproduct.getOrder_product_grind(),
											orderproduct.getOrder_product_count(),
											total_price,
											orderproduct.getProducts_product_id(),
											product.getProduct_title(),
											orderproduct.getOrder_product_price(),
											product.getProduct_attachoname(),
											product.getProduct_attachsname(),
											product.getProduct_attachtype(),
											user.getUser_zipcode()
											);
			orderinfoList.add(orderinfo);
		}
		

		 HttpSession session = request.getSession();
		 session.setAttribute("basketArr", arr);
		 session.setAttribute("productId", productId);
	
		 model.addAttribute("orderinfoList",orderinfoList);
		 return "order/fill_out_order";
	}

	
}