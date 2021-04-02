package com.mycompany.webapp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
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
		review.setOrder_product_id(1);
		reviewsService.createReview(review);
		String view = "redirect:/product/detail/" + review.getProducts_product_id();
		return view;
	}
	
}
