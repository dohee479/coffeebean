package com.mycompany.webapp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.QuestionsDao;
import com.mycompany.webapp.dto.Question;

@Service
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
	
	public void updateQuestion(Question question) {
		questionDao.update(question);
	}
	
	public void deleteQuestion(int question_id) {
		questionDao.delete(question_id);
	}
	
}
