package com.mycompany.webapp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.mycompany.webapp.dao.QuestionsDao;
import com.mycompany.webapp.dto.Question;

public class QuestionsService {
	
	@Autowired
	private QuestionsDao questionDao;
	
	public List<Question> getListByOrderId(int question_id){
		List<Question> list=questionDao.selectAll(question_id);
		return list;
	}
	
	public void createOrderProduct(Question question) {
		questionDao.insert(question);
	}
	
	public void updateOrderProduct(int question_id) {
		questionDao.update(question_id);
	}
	
	public void deleteOrderProduct(int question_id) {
		questionDao.deleteByOrderProductId(question_id);
	}
	
}
