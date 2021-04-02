package com.mycompany.webapp.controller;

import java.security.Principal;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.webapp.dto.Question;
import com.mycompany.webapp.service.QuestionsService;

@Controller
@RequestMapping("/product")
public class ProductController {
	
	private static final Logger logger = LoggerFactory.getLogger(MypageController.class);
	
	@Autowired
	private QuestionsService questionsService;
	
	@GetMapping("/country") 
	public String Country() {
		return "/product/country";
	}
	
	@GetMapping("/flavor") 
	public String Flavor() {
		return "/product/flavor";
	}
	
	@GetMapping("/detail")
	public String Detail(Model model) {
		//현재 상품의 id를 받아와서 Service에 전달
		List<Question> list=
				questionsService.getListByProductQuestion(500);
		model.addAttribute("list",list);
		return "/product/detail";
	}
	
	/* 상세페이지-상품 QnA 코드 */
	@PostMapping("/detail-qna-create")
	public String DetailCreateQna(Question question,Principal principal){
		logger.info("detail CREATE TEST");
		question.setUsers_user_id(principal.getName());
		questionsService.createQuestion(question);
		return "redirect:/product/detail";
	}
	
	@PostMapping("/detail-qna-update")
	public String DetailUpdateQna(Question question){
		logger.info("detail UPDATE TEST");
		questionsService.updateQuestion(question);
		return "redirect:/product/detail";
	}
	
	@PostMapping("/detail-qna-delete")
	public String DetailDeleteQna(int question_id){
		logger.info("detail DELETE TEST");
		questionsService.deleteQuestion(question_id);
		return "redirect:/product/detail";
	}

}
