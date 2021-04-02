package com.mycompany.webapp.service;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.mycompany.webapp.dao.ReviewsDao;
import com.mycompany.webapp.dto.Review;

@Service
public class ReviewsService {
	@Autowired
	private ReviewsDao reviewsDao;
	
	public void createReview(Review review) {
		MultipartFile review_attach = review.getReview_attach();
		if (!review_attach.isEmpty()) {
			review.setReview_attachoname(review_attach.getOriginalFilename());
			review.setReview_attachtype(review_attach.getContentType());
			String saveName = new Date().getTime() + "-" + review_attach.getOriginalFilename();
			review.setReview_attachsname(saveName);
			File file = new File("D:/kong/" + review.getReview_attachsname());
			try {
				review_attach.transferTo(file);
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		reviewsDao.insert(review);
	}
	
	public List<Review> reviewList(int product_id) {
		List<Review> reviewList = reviewsDao.selectByProductId(product_id);
		return reviewList;
	}
}
