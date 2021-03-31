package com.mycompany.webapp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;


import com.mycompany.webapp.dto.BasketItem;
import com.mycompany.webapp.dto.Pager;

@Mapper
public interface BasketItemsDao {
	public List<BasketItem> selectAll(@Param("users_user_id")String users_user_id, @Param("pager")Pager pager);
	public BasketItem selectByBasketItemId(int basket_item_id);
	public void insert(BasketItem basketItem);
	public void update(BasketItem basketItem);
	public void deleteByBasketItemId(int basket_item_id);
	public int count();
}
