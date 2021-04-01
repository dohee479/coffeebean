package com.mycompany.webapp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.ProductsDao;
import com.mycompany.webapp.dto.Product;

@Service
public class ProductsService {
	@Autowired
	ProductsDao productsDao;
	
	
	public Product getProduct(int product_id) {
		Product dbProduct=productsDao.selectByProductId(product_id);
		return dbProduct;
	}
}
