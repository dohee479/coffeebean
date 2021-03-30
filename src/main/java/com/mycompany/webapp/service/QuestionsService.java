package com.mycompany.webapp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.mycompany.webapp.dao.QuestionsDao;
import com.mycompany.webapp.dto.Question;

public class QuestionsService {
	
	@Autowired
	private QuestionsDao questionDao;
	
	public List<Question> getListByProductQuestion(int question_id){
		List<Question> list=questionDao.selectProduct(question_id);
		return list;
	}
	
	public List<Question> getListByUserQuestion(int question_id){
		List<Question> list=questionDao.selectUser(question_id);
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
