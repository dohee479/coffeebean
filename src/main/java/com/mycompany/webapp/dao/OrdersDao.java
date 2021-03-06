package com.mycompany.webapp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.mycompany.webapp.dto.Order;
import com.mycompany.webapp.dto.User;


@Mapper
public interface OrdersDao {
	public List<Order> selectAll(String users_user_id);
	public Order selectByOrderId(int order_id);
	public int insert(@Param(value = "user")User user,@Param(value="total_price")int total_price);
	public void update(Order order);
	public void updatekakao(Order order);
	public void deleteByOrderId(int order_id);
	public int selectSeqOrderId();
	public List<Order> selectCompleteOrder(String users_user_id);
	public List<Order> selectRefundOrder(String users_user_id);
	public void updateOrderState(int order_id);
	public void updateConfirmation(int order_id);
	public void deleteTempOrder(String users_user_id);
}

