package com.mycompany.webapp.dto;

public class BasketItem {
	
	private int basket_item_id;
	private String users_user_id;
	private int product_id;
	private int basket_volume;
	private int basket_grind;
	private int basket_product_count;

	// 아래 join시 추가되는 필드
	private String product_title;
	private int product_price;
	private String product_attachoname; 
	private String product_attachsname;
	private String product_attachtype;
	private String product_taste;
	private String product_country;
	private int product_grade;
	
	
	public int getBasket_item_id() {
		return basket_item_id;
	}
	public void setBasket_item_id(int basket_item_id) {
		this.basket_item_id = basket_item_id;
	}
	public String getUsers_user_id() {
		return users_user_id;
	}
	public void setUsers_user_id(String users_user_id) {
		this.users_user_id = users_user_id;
	}
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public int getBasket_volume() {
		return basket_volume;
	}
	public void setBasket_volume(int basket_volume) {
		this.basket_volume = basket_volume;
	}
	public int getBasket_grind() {
		return basket_grind;
	}
	public void setBasket_grind(int basket_grind) {
		this.basket_grind = basket_grind;
	}
	public int getBasket_product_count() {
		return basket_product_count;
	}
	public void setBasket_product_count(int basket_product_count) {
		this.basket_product_count = basket_product_count;
	}
	public String getProduct_title() {
		return product_title;
	}
	public void setProduct_title(String product_title) {
		this.product_title = product_title;
	}
	public int getProduct_price() {
		return product_price;
	}
	public void setProduct_price(int product_price) {
		this.product_price = product_price;
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
	public String getProduct_taste() {
		return product_taste;
	}
	public void setProduct_taste(String product_taste) {
		this.product_taste = product_taste;
	}
	public String getProduct_country() {
		return product_country;
	}
	public void setProduct_country(String product_country) {
		this.product_country = product_country;
	}
	public int getProduct_grade() {
		return product_grade;
	}
	public void setProduct_grade(int product_grade) {
		this.product_grade = product_grade;
	}

	
	
}
