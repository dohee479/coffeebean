package com.mycompany.webapp.controller;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mycompany.webapp.dto.BasketItem;
import com.mycompany.webapp.service.BasketsService;

@Controller
@RequestMapping("/mypage")
public class MypageController {
	
	@Autowired
	private BasketsService basketsService;
	
	private static final Logger logger = LoggerFactory.getLogger(MypageController.class);

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
  
	@GetMapping("/basket") // 유저의 장바구니 리스트 보여주기
	public String basket(Principal principal, Model model) {
		List<BasketItem> list = basketsService.getBasketItemListByUserId(principal.getName());
		
		for(BasketItem item : list) {
			logger.info(""+item.getBasket_item_id());
		}
		model.addAttribute("list", list);
		/*for (BasketItem item : list) {
			logger.info(item.getProduct_title());
		}*/
			
	
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
	
	
	@GetMapping("/my-review")
	public String MyReview() {
		return "mypage/my-review";
	}
	
	@GetMapping("/my-qna")
	public String MyQna() {
		return "mypage/my-qna";
	}
	
	@GetMapping("/delete-account")
	public String DeleteAccount() {
		return "mypage/delete-account";
	}
}
