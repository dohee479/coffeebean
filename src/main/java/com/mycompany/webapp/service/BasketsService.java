package com.mycompany.webapp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.mycompany.webapp.dao.BasketItemsDao;
import com.mycompany.webapp.dto.BasketItem;

public class BasketsService {
	
	@Autowired
	private BasketItemsDao basketItemsDao;
	
	/* 사용자 자신의 장바구니 목록 불러오기 */
	public List<BasketItem> getBasketItemListByUserId(String users_user_id){
		List<BasketItem> list = basketItemsDao.selectAll(users_user_id);
		return list;
	}
	
	/* 장바구니번호로 장바구니 한 행 가져오기 */
	public BasketItem getBasketItem(int basket_item_id) {
		BasketItem basketItem = basketItemsDao.selectByBasketItemId(basket_item_id);
		return basketItem;
	}
	
	/* 장바구니에 여러 상품을 추가 
	 * 제품 상세페이지에서는 하나의 아이템만 추가 가능하지만
	 * 찜하기에서 장바구니에 추가할 때 
	 * 여러 상품을 장바구니에 추가할 수 있음
	 */
	public void createBasketItem(List<BasketItem> list) {
		basketItemsDao.insert(list);
	}
	
	/* update
	 * 현재 기능상 장바구니 테이블의 수정 작업은 없어보임
	 * 장바구니 내에서 옵션 변경이 가능하도록 수정한다면 필요함
	 */
	public void updateBasketItem(BasketItem basketItem) {
		basketItemsDao.update(basketItem);
	}
	
	public void deleteBasketItem(int basket_item_id) {
		basketItemsDao.deleteByBasketItemId(basket_item_id);
	}

}