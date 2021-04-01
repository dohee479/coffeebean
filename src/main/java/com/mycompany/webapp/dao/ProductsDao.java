package com.mycompany.webapp.dao;

import java.util.HashMap;
import java.util.List;

import com.mycompany.webapp.dto.Product;

public interface ProductsDao {
	public List<Product> selectCountry(HashMap<String, String> params);
	public List<Product> selectTaste(HashMap<String, String> parmas);
	public Product selectByProductId(int product_id);
	public void insertProduct(Product product);
	
}
