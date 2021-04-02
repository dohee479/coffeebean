package com.mycompany.webapp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.mycompany.webapp.dto.Review;

public interface ReviewsDao {
	public void insert(Review review);
	public int update(Review review);
	public int deleteReview(@Param("user_id") String user_id, @Param("proudct_id") int product_id);
	public List<Review> selectByProductId(int product_id);
}
