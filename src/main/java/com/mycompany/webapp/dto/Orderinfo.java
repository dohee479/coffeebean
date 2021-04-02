package com.mycompany.webapp.dto;

import java.util.Date;

public class Orderinfo {
	
	private int order_id;
	private String order_receiver;
	private String user_id;
	private String user_zipcode;

	private String order_tel;
	private String order_address;
	private String order_detail_address;
	private Date order_date;
	private String order_msg;
	private int order_state; 
	private String order_account_name;
	private String order_account;
	private int order_total_price;
	


	private int order_product_volume;
	private int order_product_grind;
	private int order_product_count;
	private int order_product_price;

	private int product_id;
	private String product_title;
	private String product_country;
	private String product_taste;

	private int product_price;

	private String product_attachoname;
	private String product_attachsname;
	private String product_attachtype;
	// 판매 개수
	private int product_sale_count;
	public int getOrder_id() {
		return order_id;
	}
	public Orderinfo(int order_id, String order_receiver, String user_id, String order_tel, String order_address,
			String order_detail_address, int order_state, String order_account_name,
			int order_product_volume, int order_product_grind, int order_product_count, int order_product_price,
			int product_id, String product_title, int product_price, String product_attachoname,
			String product_attachsname, String product_attachtype, String user_zipcode) {
		super();
		this.order_id = order_id;
		this.order_receiver = order_receiver;
		this.user_id = user_id;
		this.order_tel = order_tel;
		this.order_address = order_address;
		this.order_detail_address = order_detail_address;
		this.order_state = order_state;
		this.order_account_name = order_account_name;
		this.order_product_volume = order_product_volume;
		this.order_product_grind = order_product_grind;
		this.order_product_count = order_product_count;
		this.order_product_price = order_product_price;
		this.product_id = product_id;
		this.product_title = product_title;
		this.product_price = product_price;
		this.product_attachoname = product_attachoname;
		this.product_attachsname = product_attachsname;
		this.product_attachtype = product_attachtype;
		this.user_zipcode=user_zipcode;
	}
	
	public String getUser_zipcode() {
		return user_zipcode;
	}
	public void setUser_zipcode(String user_zipcode) {
		this.user_zipcode = user_zipcode;
	}
	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}
	public String getOrder_receiver() {
		return order_receiver;
	}
	public void setOrder_receiver(String order_receiver) {
		this.order_receiver = order_receiver;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getOrder_tel() {
		return order_tel;
	}
	public void setOrder_tel(String order_tel) {
		this.order_tel = order_tel;
	}
	public String getOrder_address() {
		return order_address;
	}
	public void setOrder_address(String order_address) {
		this.order_address = order_address;
	}
	public String getOrder_detail_address() {
		return order_detail_address;
	}
	public void setOrder_detail_address(String order_detail_address) {
		this.order_detail_address = order_detail_address;
	}
	public Date getOrder_date() {
		return order_date;
	}
	public void setOrder_date(Date order_date) {
		this.order_date = order_date;
	}
	public String getOrder_msg() {
		return order_msg;
	}
	public void setOrder_msg(String order_msg) {
		this.order_msg = order_msg;
	}
	public int getOrder_state() {
		return order_state;
	}
	public void setOrder_state(int order_state) {
		this.order_state = order_state;
	}
	public String getOrder_account_name() {
		return order_account_name;
	}
	public void setOrder_account_name(String order_account_name) {
		this.order_account_name = order_account_name;
	}
	public String getOrder_account() {
		return order_account;
	}
	public void setOrder_account(String order_account) {
		this.order_account = order_account;
	}
	public int getOrder_product_volume() {
		return order_product_volume;
	}
	public void setOrder_product_volume(int order_product_volume) {
		this.order_product_volume = order_product_volume;
	}
	public int getOrder_product_grind() {
		return order_product_grind;
	}
	public void setOrder_product_grind(int order_product_grind) {
		this.order_product_grind = order_product_grind;
	}
	public int getOrder_product_count() {
		return order_product_count;
	}
	public void setOrder_product_count(int order_product_count) {
		this.order_product_count = order_product_count;
	}
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
	public int getOrder_total_price() {
		return order_total_price;
	}
	public void setOrder_total_price(int order_total_price) {
		this.order_total_price = order_total_price;
	}
	public int getOrder_product_price() {
		return order_product_price;
	}
	public void setOrder_product_price(int order_product_price) {
		this.order_product_price = order_product_price;
	}

}
