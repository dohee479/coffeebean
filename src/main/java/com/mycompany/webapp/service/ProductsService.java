package com.mycompany.webapp.service;


import org.springframework.stereotype.Service;
import com.mycompany.webapp.dao.ProductsDao;
import com.mycompany.webapp.dto.Product;

import java.io.FileInputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;

import com.mycompany.webapp.dao.ProductsDao;
import com.mycompany.webapp.dto.Product;
import com.mycompany.webapp.dto.Review;


@Service
public class ProductsService {
	private static final Logger logger = LoggerFactory.getLogger(ProductsService.class);

	@Autowired
	private ProductsDao productsDao;
	
	public List<Product> country(String c, String s) {
		HashMap<String, String> params = new HashMap<>();
		params.put("c", c);
		params.put("s", s);
		List<Product> countryList = productsDao.selectCountry(params);
		return countryList; 
	}
	
	public void getProduct(int product_id, HttpServletResponse response) {
		try {
			Product product = productsDao.selectByProductId(product_id);
			response.setContentType(product.getProduct_attachtype());
			
			String imgOriginalName = product.getProduct_attachoname();
			// 응답 HTTP 헤더에 다운로드할 수 있도록 파일 이름을 지정
			// 한글 파일일 경우, 깨짐 현상을 방지 (헤더에는 한글을 넣을 수 없다)
			imgOriginalName = new String(imgOriginalName.getBytes("UTF-8"), "ISO-8859-1");
			response.setHeader("Content-Disposition", "inline; filename=\"" + imgOriginalName + "\";");
			
			// 응답 HTTP 바디로 이미지 데이터 출력
			InputStream is = new FileInputStream("D:/kong/" + product.getProduct_attachsname());
			OutputStream os = response.getOutputStream();
			FileCopyUtils.copy(is, os);
			os.flush();
			is.close();
			os.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void getDetailImg(int product_id, HttpServletResponse response) {
		try {
			Product product = productsDao.selectByProductId(product_id);
			response.setContentType(product.getProduct_detail_attachtype());
			
			String detailImgOriginalName = product.getProduct_detail_attachoname();
			detailImgOriginalName = new String(detailImgOriginalName.getBytes("UTF-8"), "ISO-8859-1");
			response.setHeader("Content-Disposition", "inline; filename=\"" + detailImgOriginalName + "\";");
			
			InputStream is = new FileInputStream("D:/kong/" + product.getProduct_detail_attachsname());
			OutputStream os = response.getOutputStream();
			FileCopyUtils.copy(is, os);
			os.flush();
			is.close();
			os.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public List<Product> taste(String f, String s) {
		HashMap<String, String> params = new HashMap<>();
		params.put("f", f);
		params.put("s", s);
		List<Product> tasteList = productsDao.selectTaste(params);
		return tasteList;
	}
	
	public Product selectByProductId(int product_id) {
		Product product = productsDao.selectByProductId(product_id);
		return product;
	}

  
  public Product getProduct(int product_id) {
	  Product dbProduct=productsDao.selectByProductId(product_id);
	  return dbProduct;
  }

	public void updateSaleCount(int productId) {
		
		productsDao.updateSaleCountByProductId(productId);
	}

}

