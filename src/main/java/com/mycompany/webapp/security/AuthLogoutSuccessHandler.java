package com.mycompany.webapp.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.logout.LogoutSuccessHandler;

import com.mycompany.webapp.service.OrdersService;

public class AuthLogoutSuccessHandler implements LogoutSuccessHandler{
	
	@Autowired
	OrdersService ordersService;
	
	@Override
	public void onLogoutSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication)
			throws IOException, ServletException {
		if (authentication != null && authentication.getDetails() != null) {
            try {	
            	ordersService.deleteTempOrder(authentication.getName()); // 주문이 완료되지 않은 데이터를 삭제함
            	request.getSession().invalidate();

            } catch (Exception e) {
                e.printStackTrace();
            }
        } 
        response.sendRedirect("/kong");
	}

}
