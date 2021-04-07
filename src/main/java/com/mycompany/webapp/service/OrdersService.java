package com.mycompany.webapp.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.OrdersDao;
import com.mycompany.webapp.dto.Order;
import com.mycompany.webapp.dto.User;

@Service
public class OrdersService {

	@Autowired
	private OrdersDao ordersDao;
	
	/*사용자 자신의 주문 목록 불러오기*/
	public List<Order> getOrderListByUserId(String users_user_id){
		List<Order> list = ordersDao.selectAll(users_user_id);
		return list;
	}
	
	/*주문번호로 주문테이블 한 행 가져오기*/
	public Order getOrder(int order_id) {
		Order order = ordersDao.selectByOrderId(order_id);
		return order;
	}
	
	public int createOrder(User user,int total_price) {
		int order_id=ordersDao.insert(user,total_price);
		return order_id;
	}
	
	/*  
	 Update 
	 배송지 변경이나 주문 완료 후 옵션 수정 할 수 없음
	 다만 구매확정, 환불, 취소의 경우 order_state 필드 업데이트 필요.
	*/
	public void updateOrder(Order order) {
		ordersDao.update(order);
	}
	
	/* 
	 주문취소, 환불의 경우 따로 테이블이 없기 때문에 
	 order table의 order_state에 따라 구분해야 함
	 즉 주문취소, 환불의 경우에도 주문테이블에서 칼럼이 지워지면 안 됨.
	 아래의 메서드는 주문삭제 테이블임 
	 현재 프로젝트에서 사용되지 않을 메소드로 판단됨
	*/
	public void deleteOrder(int order_id) {
		ordersDao.deleteByOrderId(order_id);
	}
	
	public int getSeqOrderId() {
		int seq_order_id= ordersDao.selectSeqOrderId();
		return seq_order_id;
	}
	
	public List<Order> getCompleteOrderlist(String users_user_id){
		List<Order> completeorderlist=ordersDao.selectCompleteOrder(users_user_id);
		return completeorderlist;
	}
	
	public List<Order> getRefundOrderlist(String users_user_id){
		List<Order> completeorderlist=ordersDao.selectRefundOrder(users_user_id);
		return completeorderlist;
	}
	
	public void updateOrderState(int order_id) {
		ordersDao.updateOrderState(order_id);
	}
	
}
