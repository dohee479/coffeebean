package com.mycompany.webapp.controller;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.webapp.dto.Review;
import com.mycompany.webapp.service.ReviewsService;

@Controller
@RequestMapping("/review")
public class ReviewController {

	@Autowired
	private ReviewsService reviewsService;
	
	
	@PostMapping("/create")
	public String Review(Review review, Authentication auth) {
		review.setUsers_user_id(auth.getName());
		System.out.println(review.getOrder_product_id());
		reviewsService.createReview(review);
		/*
		 * String view = "redirect:/product/detail/" + review.getProducts_product_id();
		 */
		return "redirect:/mypage/my-review";
	}
	
	@PostMapping("/delete")
	public String Delete(int review_id, int product_id) {
		reviewsService.delete(review_id);
		if (product_id != 0) {
			String view = "redirect:/product/detail/" + product_id;
			return view;			
		} else {
			return "redirect:/mypage/my-review";
		}
	}
	
	@PostMapping("/update")
	public String Update(Review review, int product_id) {
		reviewsService.update(review);
		if (product_id != 0) {
			String view = "redirect:/product/detail/" + product_id;
			return view;			
		} else {
			return "redirect:/mypage/my-review";
		}
	}
	
	@GetMapping("/downloadReviewImg")
	public void downloadReviewImg(int review_id, HttpServletResponse response) {
		reviewsService.getReviewImg(review_id, response);
	}
}