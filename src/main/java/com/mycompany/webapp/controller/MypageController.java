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
		List<List<String>> totalProductTitle=new ArrayList<>();
		
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
		List<List<String>> totalProductTitle=new ArrayList<>();
		
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
		out.println("<script>alert('회원정보가 변경되었습니다.'); location.replace('change-info'); </script>");
		 
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
			out.println("<script>alert('비밀번호가 변경되었습니다.'); location.replace('change-info'); </script>");
		}else {				 
			out.println("<script>alert('현재 비밀번호가 틀렸습니다.'); location.replace('change-info'); </script>");
		}
		
	}
	

	@GetMapping("/basket") // 유저의 장바구니 리스트 보여주기
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
		
		basketItem.setProduct_id(Integer.parseInt(request.getParameterValues("product_id")[0]));
		basketItem.setBasket_volume(Integer.parseInt(request.getParameterValues("volume")[0]));
		basketItem.setBasket_grind(Integer.parseInt(request.getParameterValues("grind")[0]));
		basketItem.setBasket_product_count(Integer.parseInt(request.getParameterValues("count")[0]));
		basketItem.setUsers_user_id(principal.getName());
		
		if( request.getParameter("price") != null ) {
			basketItem.setOrder_product_price(Integer.parseInt(request.getParameterValues("price")[0]));
			
			if(request.getParameterValues("volume")[0].equals("200")){
				basketItem.setOrder_product_price(basketItem.getOrder_product_price() * basketItem.getBasket_product_count());
			}
			
			else if(request.getParameterValues("volume")[0].equals("500")){
				basketItem.setOrder_product_price( basketItem.getOrder_product_price() *2 * basketItem.getBasket_product_count());
			}
			
			else if(request.getParameterValues("volume")[0].equals("1000")){
				basketItem.setOrder_product_price( basketItem.getOrder_product_price() *4 * basketItem.getBasket_product_count());
			}
		} else {
			
			int productId=Integer.parseInt(request.getParameterValues("product_id")[0]);
			Product product =productsSerivce.getProduct(productId);
			int productPrice = product.getProduct_price();
			
			if(request.getParameterValues("volume")[0].equals("200"))
				basketItem.setOrder_product_price( productPrice * Integer.parseInt(request.getParameterValues("count")[0]));
			
			else if(request.getParameterValues("volume")[0].equals("500"))
				basketItem.setOrder_product_price( productPrice * 2 *Integer.parseInt(request.getParameterValues("count")[0]));
			
			else if(request.getParameterValues("volume")[0].equals("1000"))
				basketItem.setOrder_product_price( productPrice * 4 *Integer.parseInt(request.getParameterValues("count")[0]));
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
		logger.info("실행");
		try {
			Product product = productsSerivce.getProduct(product_id);
			// 응답 HTTP 헤더에 저장될 바디의 타product_id입
			response.setContentType(product.getProduct_attachtype());
			// 응답 HTTP 헤더에 다운로드할 수 있도록 파일 이름을 지정
			String originalName = product.getProduct_attachoname();
			// 한글 파일일 경우, 깨짐 현상을 방지
			originalName = new String(originalName.getBytes("UTF-8"), "ISO-8859-1");
			response.setHeader("Content-Disposition", "attachment; filename=\"" + originalName + "\";");
			
			// 응답 HTTP 바디로 이미지 데이터를 출력
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
		logger.info("실행");
		try {
			BasketItem basketItem = basketsService.getBasketItem(basket_item_id);
			// 응답 HTTP 헤더에 저장될 바디의 타product_id입
			response.setContentType(basketItem.getProduct_attachtype());
			// 응답 HTTP 헤더에 다운로드할 수 있도록 파일 이름을 지정
			String originalName = basketItem.getProduct_attachoname();
			// 한글 파일일 경우, 깨짐 현상을 방지
			originalName = new String(originalName.getBytes("UTF-8"), "ISO-8859-1");
			response.setHeader("Content-Disposition", "attachment; filename=\"" + originalName + "\";");
			
			// 응답 HTTP 바디로 이미지 데이터를 출력
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
		//현재 사용자의 계정을 받아와서 Service에 전달
		List<Question> list=questionsService.getListByUserQuestion(principal.getName());
		model.addAttribute("list",list);
		return "mypage/my-qna";
	}
	
	/* 내문의 CREATE */
	@PostMapping("/my-qna-create")
	public String MyQnaCreate(Question question,Principal principal) {
		question.setUsers_user_id(principal.getName());
		questionsService.createQuestion(question);
		return "redirect:/mypage/my-qna";
	}
	
	/* 내문의 UPDATE */
	@PostMapping("/my-qna-update")
	public String MyQnaUpdate(Question question,Principal principal) {
		question.setUsers_user_id(principal.getName());
		questionsService.updateQuestion(question);
		return "redirect:/mypage/my-qna";
	}
	
	/* 내문의 DELETE */
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
	
	@GetMapping("/delete-account")
	public String DeleteAccount() {
		return "mypage/delete-account";
	}
	
	@PostMapping("/delete-account")
	public String DeleteAccount_process(Authentication authentication,HttpSession session) {
		UserDetails userDetails =(UserDetails)authentication.getPrincipal();
		String user_id=userDetails.getUsername();
		logger.info(user_id);
		session.invalidate();
		usersService.delete(user_id);
		return "redirect:home";
		/*
		 * usersService.delete(user_id); logger.info("딜리트에 들어옴");
		 */
	}
	
}
