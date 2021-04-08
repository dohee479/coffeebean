package com.mycompany.webapp.dto;

public class Zzim {
	private String users_user_id;
	private int products_product_id;
	
	public String getUsers_user_id() {
		return users_user_id;
	}
	
	public Zzim() {
		super();
	}

	public Zzim(String users_user_id, int products_product_id) {
		super();
		this.users_user_id = users_user_id;
		this.products_product_id = products_product_id;
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
