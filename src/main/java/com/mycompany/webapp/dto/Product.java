package com.mycompany.webapp.dto;

import java.util.List;

public class Product {

	private int product_id;
	private String product_title;
	// 생산국가
	private String product_country;
	// 맛/향
	private String product_taste;
	// 가격
	private int product_price;
	// product 상세정보를 나타내주는 이미지
	private String product_detail_attachoname;
	private String product_detail_battachsname;
	private String product_detail_battachtype;
	// product 이미지
	private String product_attachoname;
	private String product_attachsname;
	private String product_attachtype;
	// 판매 개수
	private int product_sale_count;
	
	private List<Review> reviews;
	
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public String getProduct_title() {
		return product_title;
	}
	public void setProduct_title(String product_title) {
		this.product_title = product_title;
	}
	public String getProduct_country() {
		return product_country;
	}
	public void setProduct_country(String product_country) {
		this.product_country = product_country;
	}
	public String getProduct_taste() {
		return product_taste;
	}
	public void setProduct_taste(String product_taste) {
		this.product_taste = product_taste;
	}
	public int getProduct_price() {
		return product_price;
	}
	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}
	public String getProduct_detail_attachoname() {
		return product_detail_attachoname;
	}
	public void setProduct_detail_attachoname(String product_detail_attachoname) {
		this.product_detail_attachoname = product_detail_attachoname;
	}
	public String getProduct_detail_battachsname() {
		return product_detail_battachsname;
	}
	public void setProduct_detail_battachsname(String product_detail_battachsname) {
		this.product_detail_battachsname = product_detail_battachsname;
	}
	public String getProduct_detail_battachtype() {
		return product_detail_battachtype;
	}
	public void setProduct_detail_battachtype(String product_detail_battachtype) {
		this.product_detail_battachtype = product_detail_battachtype;
	}
	public String getProduct_attachoname() {
		return product_attachoname;
	}
	public void setProduct_attachoname(String product_attachoname) {
		this.product_attachoname = product_attachoname;
	}
	public String getProduct_attachsname() {
		return product_attachsname;
	}
	public void setProduct_attachsname(String product_attachsname) {
		this.product_attachsname = product_attachsname;
	}
	public String getProduct_attachtype() {
		return product_attachtype;
	}
	public void setProduct_attachtype(String product_attachtype) {
		this.product_attachtype = product_attachtype;
	}
	public int getProduct_sale_count() {
		return product_sale_count;
	}
	public void setProduct_sale_count(int product_sale_count) {
		this.product_sale_count = product_sale_count;
	}
	public List<Review> getReviews() {
		return reviews;
	}
	public void setReviews(List<Review> reviews) {
		this.reviews = reviews;
	}

	
	
	
}
