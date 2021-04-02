package com.mycompany.webapp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.webapp.dto.Order;
import com.mycompany.webapp.dto.User;


@Mapper
public interface OrdersDao {
	public List<Order> selectAll(String users_user_id);
	public Order selectByOrderId(int order_id);
	public int insert(User user);
	public void update(int order_id, int order_state);
	public void deleteByOrderId(int order_id);
}

