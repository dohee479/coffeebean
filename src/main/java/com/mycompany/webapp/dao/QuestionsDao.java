package com.mycompany.webapp.dao;

import java.util.List;

import com.mycompany.webapp.dto.Question;

public interface QuestionsDao {

	public List<Question> selectAll(int question_id);
	public Question selectByQuestionId(int question_id);
	public void insert(Question question);
	public void update(int question_id);
	public void deleteByOrderProductId(int question_id);
}
