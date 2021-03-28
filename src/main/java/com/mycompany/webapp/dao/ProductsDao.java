package com.mycompany.webapp.dao;

import java.util.List;

import com.mycompany.webapp.dto.Product;

public interface ProductsDao {
	public List<Product> selectCountry(String product_country);
	public List<Product> selectTaste(String product_taste);
	public Product selectByProductId(int product_id);
	public void insertProduct(Product product);
	
}
