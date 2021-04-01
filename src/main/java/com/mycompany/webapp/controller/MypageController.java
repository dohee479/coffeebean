package com.mycompany.webapp.controller;



import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import java.io.FileInputStream;
import java.io.InputStream;
import java.io.OutputStream;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.util.FileCopyUtils;


import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mycompany.webapp.dto.BasketItem;
import com.mycompany.webapp.dto.Pager;

import com.mycompany.webapp.service.BasketsService;

import com.mycompany.webapp.dto.User;
import com.mycompany.webapp.service.UsersService;

import com.mycompany.webapp.dto.Product;
import com.mycompany.webapp.dto.Question;
import com.mycompany.webapp.dto.User;
import com.mycompany.webapp.service.QuestionsService;

@Controller
@RequestMapping("/mypage")
public class MypageController {
	@Autowired
	private QuestionsService questionsService;

	
	@Autowired
	private BasketsService basketsService;
	
	private static final Logger logger = LoggerFactory.getLogger(MypageController.class);
	
	@Autowired
	private UsersService usersService;
	
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
	public String ChangeInfo(Authentication authentication, Model model) {
		UserDetails userDetails =(UserDetails)authentication.getPrincipal();
		String user_id=userDetails.getUsername();
		User dbUser= usersService.findById(user_id);
		model.addAttribute("user_id",dbUser.getUser_id());
		model.addAttribute("user_name",dbUser.getUser_name());
		model.addAttribute("user_tel",dbUser.getUser_tel());
		model.addAttribute("user_address",dbUser.getUser_address());
		model.addAttribute("user_detail_address",dbUser.getUser_detail_address());
		model.addAttribute("user_zipcode",dbUser.getUser_zipcode());
		return "mypage/change-info";
	}
  

	@PostMapping("/change-info")
	public void changeInfo_result(User user,HttpServletResponse response) throws IOException {
		usersService.updateInfo(user);
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();	 
		out.println("<script>alert('회원정보가 변경되었습니다.'); location.replace('change-info'); </script>");
		 
		out.flush();
		//return  "redirect:/mypage/change-info";
	}
	
	@PostMapping("/change-pwd")
	public void changeInfo_pwd(Authentication authentication,String user_password,String new_password1,HttpServletResponse response) throws IOException {
		UserDetails userDetails =(UserDetails)authentication.getPrincipal();
		String user_id=userDetails.getUsername();
		User user=new User();
		user.setUser_password(user_password);
		user.setUser_id(user_id);
		String result=usersService.updatePassword(user,new_password1);
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		if(result.equals("success")) {
			out.println("<script>alert('비밀번호가 변경되었습니다.'); location.replace('change-info'); </script>");
		}else {				 
			out.println("<script>alert('현재 비밀번호가 틀렸습니다.'); location.replace('change-info'); </script>");
		}
		
	}
	

	@GetMapping("/basket") // 유저의 장바구니 리스트 보여주기
	public String basket(
			Principal principal, 
			Model model, 
			HttpServletResponse response, 
			String pageNo,
			HttpSession session) {
		
			int intPageNo = 1;
			if(pageNo == null) {
				// 세션에서 Pager를 찾고, 있으면 pageNo를 설정
				Pager pager = (Pager) session.getAttribute("pager");
				
				if(pager != null) {
					intPageNo = pager.getPageNo();
				}
			} else {
				intPageNo = Integer.parseInt(pageNo);
		}
			
			int totalRows = basketsService.getTotalRows();
			Pager pager = new Pager(5, 5, totalRows, intPageNo);
			session.setAttribute("pager", pager);
			
			List<BasketItem> list = basketsService.getBasketItemListByUserId(principal.getName(), pager);
			model.addAttribute("list", list);
			model.addAttribute("pager", pager);


		return "mypage/basket";
	}
	
	@PostMapping("/addBasket")
	public String addBasket(BasketItem basketItem, HttpServletRequest request, Principal principal) {
		
		basketItem.setProduct_id(Integer.parseInt(request.getParameterValues("itemNo")[0]));
		basketItem.setBasket_volume(Integer.parseInt(request.getParameterValues("volume")[0]));
		basketItem.setBasket_grind(Integer.parseInt(request.getParameterValues("grind")[0]));
		basketItem.setBasket_product_count(Integer.parseInt(request.getParameterValues("count")[0]));
		basketItem.setUsers_user_id(principal.getName());
	
		basketsService.createBasketItem(basketItem);
	
		return "redirect:/mypage/basket";	
	}
	
	@PostMapping("/selectBasketItemDelete")
	public String selectBasketItemDelete(HttpServletRequest request) {
		
		String[] arr = request.getParameterValues("orderchk");
		
		for(String itemNo : arr) {
			basketsService.deleteBasketItem(Integer.parseInt(itemNo));
		}
		
		return "redirect:/mypage/basket";
	}
	
	@GetMapping("/downloadAttach")
	public void downloadAttach(int basket_item_id, HttpServletResponse response) {
		logger.info("실행");
		try {
			BasketItem basketItem = basketsService.getBasketItem(basket_item_id);
			// 응답 HTTP 헤더에 저장될 바디의 타product_id입
			response.setContentType(basketItem.getProduct_attachtype());
			// 응답 HTTP 헤더에 다운로드할 수 있도록 파일 이름을 지정
			String originalName = basketItem.getProduct_attachoname();
			// 한글 파일일 경우, 깨짐 현상을 방지
			originalName = new String(originalName.getBytes("UTF-8"), "ISO-8859-1");
			response.setHeader("Content-Disposition", "attachment; filename=\"" + originalName + "\";");
			
			// 응답 HTTP 바디로 이미지 데이터를 출력
			InputStream is = new FileInputStream("D:/kong/" + basketItem.getProduct_attachsname());
			OutputStream os = response.getOutputStream();
			FileCopyUtils.copy(is, os);
			os.flush();
			is.close();
			os.close();
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
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
	
	@PostMapping("/delete-account")
	public String DeleteAccount_process(Authentication authentication,HttpSession session) {
		UserDetails userDetails =(UserDetails)authentication.getPrincipal();
		String user_id=userDetails.getUsername();
		logger.info(user_id);
		session.invalidate();
		//usersService.delete(user_id);
		return "mypage/delete-account";
		/*
		 * usersService.delete(user_id); logger.info("딜리트에 들어옴");
		 */
		
	}
}
