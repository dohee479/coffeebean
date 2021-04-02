package com.mycompany.webapp.dao;

import java.util.List;

import com.mycompany.webapp.dto.Product;
import com.mycompany.webapp.dto.Question;

public interface ProductsDao {
	public List<Product> selectCountry(String product_country);
	public List<Product> selectTaste(String product_taste);
	public Product selectByProductId(int product_id);
	public void insertProduct(Product product);
	
	/* 상품 QnA 작성 
	public List<Question> selectProduct(int products_product_id);
	public void createQuestion(Question question);
	public void updateQuestion(Question question);
	public void deleteQuestion(Question question);*/
}
