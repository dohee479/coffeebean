package com.mycompany.webapp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.mycompany.webapp.dao.QuestionsDao;
import com.mycompany.webapp.dto.Question;

public class QuestionsService {
	
	@Autowired
	private QuestionsDao questionDao;
	
	public List<Question> getListByProductQuestion(int products_product_id){
		List<Question> list=questionDao.selectProduct(products_product_id);
		return list;
	}
	
	public List<Question> getListByUserQuestion(int users_user_id){
		List<Question> list=questionDao.selectUser(users_user_id);
		return list;
	}
	
	public void createQuestion(Question question) {
		questionDao.insert(question);
	}
	
	public void updateQuestion(int question_id) {
		questionDao.update(question_id);
	}
	
	public void deleteQuestion(int question_id) {
		questionDao.delete(question_id);
	}
	
}
