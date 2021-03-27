package com.mycompany.webapp.dao;

import java.util.List;

import com.mycompany.webapp.dto.Order;

public interface OrdersDao {
	public List<Order> selectAll(String users_user_id);
	public Order selectByOrderId(int order_id);
	public void insert(Order order);
	public void update(int order_id, int order_state);
	public void deleteByOrderId(int order_id);
}

