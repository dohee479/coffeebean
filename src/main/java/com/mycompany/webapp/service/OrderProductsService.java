package com.mycompany.webapp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.mycompany.webapp.dao.OrderProductsDao;
import com.mycompany.webapp.dto.OrderProduct;

public class OrderProductsService {

	@Autowired
	private OrderProductsDao orderProductsDao;
	
	/*주문 id에 따른 주문상품을 불러오기 */
	public List<OrderProduct> getListByOrderId(int orders_order_id){
		List<OrderProduct> list=orderProductsDao.selectAll(orders_order_id);
		return list;
	}
	
	public void createOrderProduct(OrderProduct orderProduct) {
		orderProductsDao.insert(orderProduct);
	}
	
	public void updateOrderProduct(int orders_order_id, int products_product_id) {
		orderProductsDao.update(orders_order_id, products_product_id);
	}
	
	public void deleteOrderProduct(int order_product_id) {
		orderProductsDao.deleteByOrderProductId(order_product_id);
	}
}
