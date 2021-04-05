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
import com.mycompany.webapp.service.ProductsService;

import com.mycompany.webapp.service.QuestionsService;

@Controller
@RequestMapping("/product")
public class ProductController {

	private static final Logger logger = LoggerFactory.getLogger(ProductController.class);

	@Autowired
	private ProductsService productsService;

	@Autowired
	private QuestionsService questionsService;

	
	@GetMapping("/country") 
	public String Country(String c, String s, Model model) {
		List<Product> productList = productsService.country(c, s);
		model.addAttribute("productList", productList);
		return "/product/country";
	}
	
	@GetMapping("/flavor") 
	public String Flavor(String f, String s, Model model) {
		List<Product> productList = productsService.taste(f, s);
		model.addAttribute("productList", productList);
		return "/product/flavor";
	}
	
	/*	상품문의 CREATE	*/
	@PostMapping("/detail-qna-create")
	public String DetailCreateQna(Question question,Principal principal){
		question.setUsers_user_id(principal.getName());
		questionsService.createQuestion(question);
		return "redirect:/product/detail/"+question.getProducts_product_id();
	}
	
	/*	상품문의 UPDATE	*/
	@PostMapping("/detail-qna-update")
	public String DetailUpdateQna(Question question){
		questionsService.updateQuestion(question);
		return "redirect:/product/detail";
	}
	
	/*	상품문의 DELETE	*/
	@PostMapping("/detail-qna-delete")
	public String DetailDeleteQna(int question_id){
		questionsService.deleteQuestion(question_id);
		return "redirect:/product/detail";
	}
	
	@GetMapping("/detail/{product_id}")
	public String Detail(@PathVariable("product_id") int product_id, Model model,Principal principal,Question question) {
		Product product = productsService.selectByProductId(product_id);
		List<Question> list=
				questionsService.getListByProductQuestion(product_id);
		question.setProducts_product_id(product_id);
		model.addAttribute("list",list);
		model.addAttribute("product", product);
		return "/product/detail";
	}
	
	@GetMapping("/downloadImg")
	public void downloadImg(int product_id, HttpServletResponse response) {
		productsService.getProduct(product_id, response);
	}
	
	@GetMapping("/detail/downloadDetailImg")
	public void downloadDetailImg(int product_id, HttpServletResponse response) {
		productsService.getDetailImg(product_id, response);
	}

	
	@GetMapping("/detail")
	public String detail(int product_id, Model model) {
		Product dbProduct=productsService.getProduct(product_id);
		model.addAttribute("product",dbProduct);
		return "/product/detail";
	}
}
