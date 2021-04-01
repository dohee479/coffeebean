package com.mycompany.webapp.controller;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;


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
	
	@GetMapping("/detail/{product_id}")
	public String Detail(@PathVariable("product_id") int product_id, Model model) {
		Product product = productsService.selectByProductId(product_id);
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
}
