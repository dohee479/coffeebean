package com.mycompany.webapp.dao;

import java.util.HashMap;
import java.util.List;

import com.mycompany.webapp.dto.Product;
import com.mycompany.webapp.dto.Question;

public interface ProductsDao {
	public List<Product> selectCountry(HashMap<String, String> params);
	public List<Product> selectTaste(HashMap<String, String> parmas);
	public Product selectByProductId(int product_id);
	public void insertProduct(Product product);
	public List<Product> selectAll();
	public List<Product> search(String keyword);
	public void updateSaleCountByProductId(int productId);
	
	/* 상품 QnA 작성 
	public List<Question> selectProduct(int products_product_id);
	public void createQuestion(Question question);
	public void updateQuestion(Question question);
	public void deleteQuestion(Question question);*/
}
