package com.mycompany.webapp.dto;

import java.util.Date;

public class Question {
	
	private int question_id;
	private String question_title;
	private String question_content;
	private Date question_date;
	private String users_user_id;
	private int products_product_id;
	
	public int getQuestion_id() {
		return question_id;
	}
	public void setQuestion_id(int question_id) {
		this.question_id = question_id;
	}
	public String getQuestion_title() {
		return question_title;
	}
	public void setQuestion_title(String question_title) {
		this.question_title = question_title;
	}
	public String getQuestion_content() {
		return question_content;
	}
	public void setQuestion_content(String question_content) {
		this.question_content = question_content;
	}
	public Date getQuestion_date() {
		return question_date;
	}
	public void setQuestion_date(Date question_date) {
		this.question_date = question_date;
	}
	public String getUsers_user_id() {
		return users_user_id;
	}
	public void setUsers_user_id(String users_user_id) {
		this.users_user_id = users_user_id;
	}
	public int getProducts_product_id() {
		return products_product_id;
	}
	public void setProducts_product_id(int products_product_id) {
		this.products_product_id = products_product_id;
	}
	
}
