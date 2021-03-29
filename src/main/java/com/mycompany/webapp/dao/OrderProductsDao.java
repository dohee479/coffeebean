package com.mycompany.webapp.dao;

import java.util.List;

import com.mycompany.webapp.dto.OrderProduct;

public interface OrderProductsDao {
	
	public List<OrderProduct> selectAll(int orders_order_id);
	public OrderProduct selectByOrderId(int orders_order_id);
	public void insert(OrderProduct orderProduct);
	public void update(int orders_order_id,int products_product_id);
	public void deleteByOrderProductId(int products_product_id);
}
