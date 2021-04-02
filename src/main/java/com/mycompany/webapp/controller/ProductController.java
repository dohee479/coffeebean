package com.mycompany.webapp.controller;


import java.security.Principal;
import java.util.List;



import org.json.JSONObject;

import java.util.List;

import javax.servlet.http.HttpServletResponse;



import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;


import org.springframework.web.bind.annotation.PostMapping;

import org.springframework.web.bind.annotation.PathVariable;


import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.mycompany.webapp.dto.Question;

import com.mycompany.webapp.dto.Product;
import com.mycompany.webapp.dto.Review;
import com.mycompany.webapp.service.ProductsService;

import com.mycompany.webapp.service.QuestionsService;
import com.mycompany.webapp.service.ReviewsService;

@Controller
@RequestMapping("/product")
public class ProductController {

	private static final Logger logger = LoggerFactory.getLogger(ProductController.class);

	@Autowired
	private ProductsService productsService;
	
	@Autowired
	private ReviewsService reviewsService;

	@Autowired
	private QuestionsService questionsService;
	

	// 나라
	@GetMapping("/country") 
	public String Country(String c, String s, Model model) {
		List<Product> productList = productsService.country(c, s);
		model.addAttribute("productList", productList);
		return "/product/country";
	}
	
	// 맛&향
	@GetMapping("/flavor") 
	public String Flavor(String f, String s, Model model) {
		List<Product> productList = productsService.taste(f, s);
		model.addAttribute("productList", productList);
		return "/product/flavor";
	}
	
	@GetMapping("/detail")
	public String Detail(Model model) {
		//현재 상품의 id를 받아와서 Service에 전달
		List<Question> list=
				questionsService.getListByProductQuestion(500);
		model.addAttribute("list",list);
		return "/product/detail";
	}
	
	/* 상세페이지-상품 QnA 코드 */
	@PostMapping("/detail-qna-create")
	public String DetailCreateQna(Question question,Principal principal){
		logger.info("detail CREATE TEST");
		question.setUsers_user_id(principal.getName());
		questionsService.createQuestion(question);
		return "redirect:/product/detail";
	}
	
	@PostMapping("/detail-qna-update")
	public String DetailUpdateQna(Question question){
		logger.info("detail UPDATE TEST");
		questionsService.updateQuestion(question);
		return "redirect:/product/detail";
	}
	
	@PostMapping("/detail-qna-delete")
	public String DetailDeleteQna(int question_id){
		logger.info("detail DELETE TEST");
		questionsService.deleteQuestion(question_id);
		return "redirect:/product/detail";
    
	@GetMapping("/detail/{product_id}")
	public String Detail(@PathVariable("product_id") int product_id, Model model) {
		Product product = productsService.selectByProductId(product_id);
		List<Review> reviewList = reviewsService.reviewList(product_id);
		model.addAttribute("product", product);
		model.addAttribute("reviewList", reviewList);
		return "/product/detail";
	}
		
	// 아이템 목록 이미지 받기
	@GetMapping("/downloadImg")
	public void downloadImg(int product_id, HttpServletResponse response) {
		productsService.getProduct(product_id, response);
	}
	
	// 상세페이지 상세정보 이미지 받기 
	@GetMapping("/detail/downloadDetailImg")
	public void downloadDetailImg(int product_id, HttpServletResponse response) {
		productsService.getDetailImg(product_id, response);
	}
}	

	@GetMapping("/detail")
	public String detail(int product_id, Model model) {
		Product dbProduct=productsService.getProduct(product_id);
		model.addAttribute("product",dbProduct);
		return "/product/detail";
	}
}
