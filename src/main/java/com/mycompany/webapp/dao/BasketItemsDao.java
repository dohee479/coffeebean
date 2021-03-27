package com.mycompany.webapp.dao;

import java.util.List;

import com.mycompany.webapp.dto.BasketItem;

public interface BasketItemsDao {
	public List<BasketItem> selectAll(String users_user_id);
	public BasketItem selectByBasketItemId(int basket_item_id);
	public void insert(List<BasketItem> list);
	public void update(BasketItem basketItem);
	public void deleteByBasketItemId(int basket_item_id);
}
