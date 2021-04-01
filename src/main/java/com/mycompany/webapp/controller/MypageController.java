package com.mycompany.webapp.controller;

import java.security.Principal;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.webapp.dto.Product;
import com.mycompany.webapp.dto.Question;
import com.mycompany.webapp.dto.User;
import com.mycompany.webapp.service.QuestionsService;

@Controller
@RequestMapping("/mypage")
public class MypageController {

	private static final Logger logger = LoggerFactory.getLogger(MypageController.class);
	
	@Autowired
	private QuestionsService questionsService;
	
	@GetMapping("/orderlist")
	public String OrderList() {
		return "mypage/orderlist";
	}
	
	@GetMapping("/refund")
	public String RefundList() {
		return "mypage/refund";
	}

	@GetMapping("/zzim")
	public String ZzimList() {
		return "mypage/zzim";
	}
	
	@GetMapping("/change-info")
	public String ChangeInfo() {
		return "mypage/change-info";
	}
  
	@GetMapping("/basket")
	public String basket() {
		return "mypage/basket";
	}
	
	@GetMapping("/my-review")
	public String MyReview() {
		return "mypage/my-review";
	}
	
	@GetMapping("/my-qna")
	public String MyQna() {
		return "mypage/my-qna";
	}
	
	/* CREATE QNA */
	@PostMapping("/my-qna-create")
	public String MyQnaCreate(Question question,Principal principal) {
		logger.info("my-qna CREATE TEST");
		question.setUsers_user_id(principal.getName());
		questionsService.createQuestion(question);
		return "redirect:/mypage/my-qna";
	}
	
	/* UPDATE QNA */
	@PostMapping("/my-qna-update")
	public String MyQnaUpdate(Question question) {
		logger.info("my-qna UPDATE TEST");
		questionsService.updateQuestion(question);
		return "redirect:/mypage/my-qna";
	}
	
	/* DELETE QNA */
	@PostMapping("/my-qna-delete")
	public String MyQnaDelete(int question_id) {
		logger.info("my-qna DELETE TEST");
		questionsService.deleteQuestion(question_id);
		return "redirect:/mypage/my-qna";
	}
	
	@GetMapping("/delete-account")
	public String DeleteAccount() {
		return "mypage/delete-account";
	}
}
