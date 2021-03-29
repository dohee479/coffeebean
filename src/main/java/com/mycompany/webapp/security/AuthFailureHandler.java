package com.mycompany.webapp.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationFailureHandler;

/*
 * SimpleUrlAuthenticationFailureHandler
 * 사용자가 로그인 성공후에 무조건 홈으로 이동
 * 
 * SavedRequestAwareAuthenticationSuccessHandler
 * 로그인 성공 후에 사용자가 접근하고자 했던 페이지로 이동
 */

public class AuthFailureHandler extends SimpleUrlAuthenticationFailureHandler {
//public class AuthFailureHandler extends SavedRequestAwareAuthenticationSuccessHandler{
	
	private static final Logger logger = LoggerFactory.getLogger(AuthFailureHandler.class);
	
	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {
		super.onAuthenticationFailure(request, response, exception);
	}
}
