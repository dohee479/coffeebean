package com.mycompany.webapp.dao;

import java.util.List;

import com.mycompany.webapp.dto.Review;

public interface ReviewsDao {
	public void insert(Review review);
	public int update(Review review);
	public int delete(int review_id);
	public List<Review> selectByProductId(int product_id);
	public List<Review> selectByUserId(String user_id);
}