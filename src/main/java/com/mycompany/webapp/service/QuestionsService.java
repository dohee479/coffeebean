package com.mycompany.webapp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.QuestionsDao;
import com.mycompany.webapp.dto.Question;

@Service
public class QuestionsService {
	
	@Autowired
	private QuestionsDao questionsDao;
	
	public List<Question> getListByProductQuestion(int products_product_id){
		List<Question> list=questionsDao.selectProduct(products_product_id);
		return list;
	}
	
	public List<Question> getListByUserQuestion(String users_user_id){
		List<Question> list=questionsDao.selectUser(users_user_id);
		return list;
	}
	
	public void createQuestion(Question question) {
		questionsDao.insert(question);
	}
	
	public void updateQuestion(Question question) {
		questionsDao.update(question);
	}
	
	public void deleteQuestion(int question_id) {
		questionsDao.delete(question_id);
	}
	
}
