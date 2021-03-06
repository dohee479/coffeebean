package com.mycompany.webapp.controller;


import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mycompany.webapp.dto.BasketItem;
import com.mycompany.webapp.dto.Order;
import com.mycompany.webapp.dto.OrderProduct;
import com.mycompany.webapp.dto.Product;
import com.mycompany.webapp.dto.Question;
import com.mycompany.webapp.dto.Review;
import com.mycompany.webapp.dto.User;
import com.mycompany.webapp.dto.Zzim;
import com.mycompany.webapp.service.BasketsService;
import com.mycompany.webapp.service.OrderProductsService;
import com.mycompany.webapp.service.OrdersService;
import com.mycompany.webapp.service.ProductsService;
import com.mycompany.webapp.service.QuestionsService;
import com.mycompany.webapp.service.ReviewsService;
import com.mycompany.webapp.service.UsersService;
import com.mycompany.webapp.service.ZzimsService;

@Controller
@RequestMapping("/mypage")
public class MypageController {
	
	@Autowired
	private OrdersService ordersService;
	
	@Autowired
	private QuestionsService questionsService;

	@Autowired
	private BasketsService basketsService;
	

	@Autowired
	private ZzimsService zzimsService;

	@Autowired
	private ProductsService productsSerivce;
	
	@Autowired
	private OrderProductsService orderproductsService;

	@Autowired
	private UsersService usersService;
	
	@Autowired
	private ReviewsService reviewsService;
	
	private static final Logger logger = LoggerFactory.getLogger(MypageController.class);
	

	@GetMapping("/orderlist")
	public String OrderList(Principal principal,Model model) {
		
		List<Order> completeOrderList=ordersService.getCompleteOrderlist(principal.getName());
		List<List<OrderProduct>> totalOrderProductList=new ArrayList<>();
		
		for(Order order: completeOrderList) {
			int order_id=order.getOrder_id();
			List<OrderProduct> orderProductList=orderproductsService.getListByOrderId(order_id);			
			totalOrderProductList.add(orderProductList);
		}

		model.addAttribute("totalOrderProductList",totalOrderProductList);
		 
		return "mypage/orderlist";
	}
	
	@GetMapping("/refund")
	public String RefundList(Principal principal,Model model) {
		List<Order> completeOrderList=ordersService.getRefundOrderlist(principal.getName());

		List<List<OrderProduct>> totalOrderProductList=new ArrayList<>();
		
		for(Order order: completeOrderList) {
			int order_id=order.getOrder_id();
			List<OrderProduct> orderProductList=orderproductsService.getListByOrderId(order_id);			
			totalOrderProductList.add(orderProductList);
		}

		model.addAttribute("totalOrderProductList",totalOrderProductList);
		
		return "mypage/refund";
	}

	@GetMapping("/zzim")
	public String ZzimList(Principal principal,Model model) {
		String user_id=principal.getName();
		List<Product> zzimList=zzimsService.getzzimList(user_id);
		model.addAttribute("zzimList",zzimList);
		return "mypage/zzim";
	}
	

	@PostMapping(value="/zzim_insert",produces="application/json; charset=UTF-8")
	@ResponseBody
	public String Zzim_insert(int product_id,Principal principal) {
		JSONObject jsonObject = new JSONObject();
		
		String user_id=principal.getName();
		
		Zzim zzim=new Zzim();
		zzim.setProducts_product_id(product_id);
		zzim.setUsers_user_id(user_id);
		String result=zzimsService.saveZzim(zzim);
		if(result.equals("success")) {
			jsonObject.put("result", "success");
		}
		
		return jsonObject.toString();
	}
	
	@PostMapping("/nowdelete")
	@ResponseBody
	public String nowdelete(int product_id, Principal principal) {
		String user_id=principal.getName();
		
		Zzim zzim=new Zzim();
		zzim.setProducts_product_id(product_id);
		zzim.setUsers_user_id(user_id);
		
		zzimsService.deleteZzim(zzim);
		
		return "success";
	}
	
	@PostMapping("/deletezzim")
	public String DeleteZzim(int product_id,Principal principal) {
		String user_id=principal.getName();
		
		Zzim zzim=new Zzim();
		zzim.setProducts_product_id(product_id);
		zzim.setUsers_user_id(user_id);
		
		zzimsService.deleteZzim(zzim);
		return "redirect:/mypage/zzim";
	}
	
	
	@GetMapping("/change-info")
	public String ChangeInfo(Authentication authentication, Model model) {
		UserDetails userDetails =(UserDetails)authentication.getPrincipal();
		String user_id=userDetails.getUsername();
		User dbUser= usersService.findById(user_id);
		model.addAttribute("user_id",dbUser.getUser_id());
		model.addAttribute("user_name",dbUser.getUser_name());
		model.addAttribute("user_tel",dbUser.getUser_tel());
		model.addAttribute("user_address",dbUser.getUser_address());
		model.addAttribute("user_detail_address",dbUser.getUser_detail_address());
		model.addAttribute("user_zipcode",dbUser.getUser_zipcode());
		return "mypage/change-info";
	}
  

	@PostMapping("/change-info")
	public void changeInfo_result(User user,HttpServletResponse response) throws IOException {
		usersService.updateInfo(user);
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();	 
		out.println("<script>alert('??????????????? ?????????????????????.'); location.replace('change-info'); </script>");
		 
		out.flush();
		//return  "redirect:/mypage/change-info";
	}
	
	@PostMapping("/change-pwd")
	public void changeInfo_pwd(Authentication authentication,String user_password,String new_password1,HttpServletResponse response) throws IOException {
		UserDetails userDetails =(UserDetails)authentication.getPrincipal();
		String user_id=userDetails.getUsername();
		User user=new User();
		user.setUser_password(user_password);
		user.setUser_id(user_id);
		String result=usersService.updatePassword(user,new_password1);
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		if(result.equals("success")) {
			out.println("<script>alert('??????????????? ?????????????????????.'); location.replace('change-info'); </script>");
		}else {				 
			out.println("<script>alert('?????? ??????????????? ???????????????.'); location.replace('change-info'); </script>");
		}
	}
	

	@GetMapping("/basket") // ????????? ???????????? ????????? ????????????
	public String basket(
			Principal principal, 
			Model model, 
			HttpServletResponse response) {
				
				List<BasketItem> list = basketsService.getBasketItemListByUserId(principal.getName());
				model.addAttribute("list", list);

		return "mypage/basket";
	}
	
	@PostMapping("/addBasket")
	public String addBasket(BasketItem basketItem, HttpServletRequest request, Principal principal) {
		
		basketItem.setProduct_id(Integer.parseInt(request.getParameter("product_id")));
		basketItem.setBasket_volume(Integer.parseInt(request.getParameter("volume")));
		basketItem.setBasket_grind(Integer.parseInt(request.getParameter("grind")));
		basketItem.setBasket_product_count(Integer.parseInt(request.getParameter("count")));
		basketItem.setUsers_user_id(principal.getName());
		
		if( request.getParameter("price") != null ) {
			int productPrice = Integer.parseInt(request.getParameter("price"));
			int count = basketItem.getBasket_product_count();
			
			if(request.getParameter("volume").equals("200"))
				basketItem.setOrder_product_price(productPrice * count);

			else if(request.getParameter("volume").equals("500"))
				basketItem.setOrder_product_price(productPrice *2 * count);
			
			else if(request.getParameter("volume").equals("1000"))
				basketItem.setOrder_product_price(productPrice *4 * count);
			
		} else {
			int productId=Integer.parseInt(request.getParameter("product_id"));
			Product product =productsSerivce.getProduct(productId);
			int productPrice = product.getProduct_price();
			int count = Integer.parseInt(request.getParameter("count"));
			
			if(request.getParameter("volume").equals("200"))
				basketItem.setOrder_product_price( productPrice * count );
			
			else if(request.getParameter("volume").equals("500"))
				basketItem.setOrder_product_price( productPrice * 2 *count );
			
			else if(request.getParameter("volume").equals("1000"))
				basketItem.setOrder_product_price( productPrice * 4 * count );
		}	
		
		basketsService.createBasketItem(basketItem);
		return "redirect:/mypage/basket";	
	}
	
	@PostMapping("/selectBasketItemDelete")
	public String selectBasketItemDelete(HttpServletRequest request) {
		
		String[] arr = request.getParameterValues("orderchk");
		
		for(String itemNo : arr) {
			basketsService.deleteBasketItem(Integer.parseInt(itemNo));
		}
		
		return "redirect:/mypage/basket";
	}
	
	@GetMapping("/zzimdownloadAttach")
	public void zzimdownloadAttach(int product_id, HttpServletResponse response) {
		try {
			Product product = productsSerivce.getProduct(product_id);
			// ?????? HTTP ????????? ????????? ????????? ???product_id???
			response.setContentType(product.getProduct_attachtype());
			// ?????? HTTP ????????? ??????????????? ??? ????????? ?????? ????????? ??????
			String originalName = product.getProduct_attachoname();
			// ?????? ????????? ??????, ?????? ????????? ??????
			originalName = new String(originalName.getBytes("UTF-8"), "ISO-8859-1");
			response.setHeader("Content-Disposition", "attachment; filename=\"" + originalName + "\";");
			
			// ?????? HTTP ????????? ????????? ???????????? ??????
			InputStream is = new FileInputStream("D:/kong/" + product.getProduct_attachsname());
			OutputStream os = response.getOutputStream();
			FileCopyUtils.copy(is, os);
			os.flush();
			is.close();
			os.close();
			
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	@GetMapping("/downloadAttach")
	public void downloadAttach(int basket_item_id, HttpServletResponse response) {
		try {
			BasketItem basketItem = basketsService.getBasketItem(basket_item_id);
			// ?????? HTTP ????????? ????????? ????????? ???product_id???
			response.setContentType(basketItem.getProduct_attachtype());
			// ?????? HTTP ????????? ??????????????? ??? ????????? ?????? ????????? ??????
			String originalName = basketItem.getProduct_attachoname();
			// ?????? ????????? ??????, ?????? ????????? ??????
			originalName = new String(originalName.getBytes("UTF-8"), "ISO-8859-1");
			response.setHeader("Content-Disposition", "attachment; filename=\"" + originalName + "\";");
			
			// ?????? HTTP ????????? ????????? ???????????? ??????
			InputStream is = new FileInputStream("D:/kong/" + basketItem.getProduct_attachsname());
			OutputStream os = response.getOutputStream();
			FileCopyUtils.copy(is, os);
			os.flush();
			is.close();
			os.close();
			
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	@GetMapping("/my-review")
	public String MyReview(Authentication auth, Model model) {
		List<Review> reviewList = reviewsService.getReviewByUser(auth.getName());
		model.addAttribute("reviewList", reviewList);
		return "mypage/my-review";
	}
	
	@GetMapping("/my-qna")
	public String MyQna(Model model,Principal principal) {
		//?????? ???????????? ????????? ???????????? Service??? ??????
		List<Question> list=questionsService.getListByUserQuestion(principal.getName());
		model.addAttribute("list",list);
		return "mypage/my-qna";
	}
	
	/* ????????? CREATE */
	@PostMapping("/my-qna-create")
	public String MyQnaCreate(Question question,Principal principal) {
		question.setUsers_user_id(principal.getName());
		questionsService.createQuestion(question);
		return "redirect:/mypage/my-qna";
	}
	
	/* ????????? UPDATE */
	@PostMapping("/my-qna-update")
	public String MyQnaUpdate(Question question,Principal principal) {
		question.setUsers_user_id(principal.getName());
		questionsService.updateQuestion(question);
		return "redirect:/mypage/my-qna";
	}
	
	/* ????????? DELETE */
	@PostMapping("/my-qna-delete")
	public String MyQnaDelete(Question question) {
		questionsService.deleteQuestion(question.getQuestion_id());
		return "redirect:/mypage/my-qna";
	}
	
	@PostMapping("/cancel-order")
	public String CancelOrder(Order order) {
		ordersService.updateOrderState(order.getOrder_id());
		return "redirect:/mypage/orderlist";
	}
	
	@PostMapping("/confirmation-order")
	public String confirmationOrder(Order order) {
		ordersService.updateConfirmation(order.getOrder_id());
		return "redirect:/mypage/orderlist";
	}
	
	@GetMapping("/delete-account")
	public String DeleteAccount() {
		return "mypage/delete-account";
	}
	
	@PostMapping("/delete-account")
	public String DeleteAccount_process(Authentication authentication,HttpSession session) {
		UserDetails userDetails =(UserDetails)authentication.getPrincipal();
		String user_id=userDetails.getUsername();
		session.invalidate();
		usersService.delete(user_id);
		return "redirect:home";
		/*
		 * usersService.delete(user_id); logger.info("???????????? ?????????");
		 */
	}
		
}
