package com.mycompany.webapp.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import com.mycompany.webapp.dao.ReviewsDao;
import com.mycompany.webapp.dto.Product;
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
	
	public int delete(int review_id) {
		return reviewsDao.delete(review_id);
	}
	
	public int update(Review review) {
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
		return reviewsDao.update(review);
	}
	
	public List<Review> getReviewByUser(String user_id) {
		List<Review> reviewList = reviewsDao.selectByUserId(user_id);
		return reviewList;
	}
	
	public void getReviewImg(int review_id, HttpServletResponse response) {
		try {
			Review review = reviewsDao.selectByReviewId(review_id);
			response.setContentType(review.getReview_attachtype());

			String reviewImgOriginalName = review.getReview_attachoname();
			reviewImgOriginalName = new String(reviewImgOriginalName.getBytes("UTF-8"), "ISO-8859-1");
			response.setHeader("Content-Disposition", "inline; filename=\"" + reviewImgOriginalName + "\";");
			
			InputStream is = new FileInputStream("D:/kong/" + review.getReview_attachsname());
			OutputStream os = response.getOutputStream();
			FileCopyUtils.copy(is, os);
			os.flush();
			is.close();
			os.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}