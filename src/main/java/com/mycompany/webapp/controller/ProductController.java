package com.mycompany.webapp.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mycompany.webapp.dto.BasketItem;
import com.mycompany.webapp.dto.Product;
import com.mycompany.webapp.dto.Question;
import com.mycompany.webapp.dto.Review;
import com.mycompany.webapp.service.BasketsService;
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
	
	@Autowired
	private BasketsService basketsService;
	

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
	
	/* 상세페이지-상품 QnA 코드 */
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
	
	// 장바구니 리스트 가져오기
	@GetMapping(value="/basket", produces="application/json;charset=UTF-8") 
	@ResponseBody
	public String basket(Principal principal) {
		if (principal == null) {
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("failure", "failure");
			return jsonObject.toString();	
		} 
		List<BasketItem> basketList = basketsService.getBasketItemListByUserId(principal.getName());
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("basketList", basketList);
		return jsonObject.toString();	
	}
	
	@GetMapping(value="/basketitem", produces="application/json;charset=UTF-8") 
	@ResponseBody
	public String basketItem(String basket_item_id) {
			BasketItem basketItem = basketsService.getBasketItem(Integer.parseInt(basket_item_id));
			HashMap<String, String> basket = new HashMap<>();
			basket.put("product_title", basketItem.getProduct_title());
			basket.put("product_price", Integer.toString(basketItem.getOrder_product_price()));
			basket.put("product_taste", basketItem.getProduct_taste());
			basket.put("product_country", basketItem.getProduct_country());
			basket.put("product_grade", Integer.toString(basketItem.getProduct_grade()));
			JSONObject jsonObject =  new JSONObject(basket);
			return jsonObject.toString(); 
	}
	
	@GetMapping("/search")
	public String search(String keyword, Model model) {
		List<Product> searchList = productsService.search(keyword);
		model.addAttribute("keyword", keyword);
		model.addAttribute("searchList", searchList);
		return "/search/searchlist";
	}

}
