package com.mycompany.webapp.dto;

import java.util.Date;

public class Review {

	private int review_id;
	private String review_title;
	private int review_grade;
	private String review_content;
	// 리뷰에 들어가는 이미지
	private String review_attachoname;
	private String review_attachsname;
	private String review_attachtype;
	// 리뷰 작성 날짜
	private Date review_date;
	
	private User user;
	private Product product;

	public int getReview_id() {
		return review_id;
	}

	public void setReview_id(int review_id) {
		this.review_id = review_id;
	}

	public String getReview_title() {
		return review_title;
	}

	public void setReview_title(String review_title) {
		this.review_title = review_title;
	}

	public int getReview_grade() {
		return review_grade;
	}

	public void setReview_grade(int review_grade) {
		this.review_grade = review_grade;
	}

	public String getReview_content() {
		return review_content;
	}

	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}

	public String getReview_attachoname() {
		return review_attachoname;
	}

	public void setReview_attachoname(String review_attachoname) {
		this.review_attachoname = review_attachoname;
	}

	public String getReview_attachsname() {
		return review_attachsname;
	}

	public void setReview_attachsname(String review_attachsname) {
		this.review_attachsname = review_attachsname;
	}

	public String getReview_attachtype() {
		return review_attachtype;
	}

	public void setReview_attachtype(String review_attachtype) {
		this.review_attachtype = review_attachtype;
	}

	public Date getReview_date() {
		return review_date;
	}

	public void setReview_date(Date review_date) {
		this.review_date = review_date;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
	
	
}
