package com.mycompany.webapp.dto;

public class BasketItem {
	
	private int basket_item_id;
	private String users_user_id;
	private int product_id;
	private int basket_volume;
	private int basket_grind;
	private int basket_product_count;
	
	// 아래 join시 추가되는 필드
	private String prducts_product_title;
	private int products_product_price;
	private String products_product_imgoname; 
	private String products_product_imgsname;
	private String products_product_imgtype;
	
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
	public String getPrducts_product_title() {
		return prducts_product_title;
	}
	public void setPrducts_product_title(String prducts_product_title) {
		this.prducts_product_title = prducts_product_title;
	}
	public int getProducts_product_price() {
		return products_product_price;
	}
	public void setProducts_product_price(int products_product_price) {
		this.products_product_price = products_product_price;
	}
	public String getProducts_product_imgoname() {
		return products_product_imgoname;
	}
	public void setProducts_product_imgoname(String products_product_imgoname) {
		this.products_product_imgoname = products_product_imgoname;
	}
	public String getProducts_product_imgsname() {
		return products_product_imgsname;
	}
	public void setProducts_product_imgsname(String products_product_imgsname) {
		this.products_product_imgsname = products_product_imgsname;
	}
	public String getProducts_product_imgtype() {
		return products_product_imgtype;
	}
	public void setProducts_product_imgtype(String products_product_imgtype) {
		this.products_product_imgtype = products_product_imgtype;
	}
	
}