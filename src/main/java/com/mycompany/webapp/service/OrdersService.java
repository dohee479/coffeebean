package com.mycompany.webapp.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;

import com.mycompany.webapp.dao.OrdersDao;
import com.mycompany.webapp.dto.Order;

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
	
	public void createOrder(Order order) {
		ordersDao.insert(order);
	}
	
	/*  
	 Update 
	 배송지 변경이나 주문 완료 후 옵션 수정 할 수 없음
	 다만 구매확정, 환불, 취소의 경우 order_state 필드 업데이트 필요.
	*/
	public void updateOrder(@Param("order_id") int order_id, @Param("order_state") int order_state) {
		ordersDao.update(order_id, order_state);
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
	
	
	
}
