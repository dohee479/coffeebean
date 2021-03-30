package com.mycompany.webapp.dao;

import java.util.List;

import com.mycompany.webapp.dto.Question;

public interface QuestionsDao {
	
	public List<Question> selectProduct(int products_product_id);
	public List<Question> selectUser(int users_user_id);
	public void insert(Question question);
	public void update(int question_id);
	public void delete(int question_id);
}
