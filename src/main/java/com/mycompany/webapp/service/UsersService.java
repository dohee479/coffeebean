package com.mycompany.webapp.service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
//import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.mycompany.webapp.controller.MypageController;
import com.mycompany.webapp.dao.UsersDao;
import com.mycompany.webapp.dto.User;

@Service
public class UsersService {
	private static final Logger logger = LoggerFactory.getLogger(MypageController.class);
	@Autowired
	private UsersDao usersDao;
	
	
	
	public String join(User user) {
		BCryptPasswordEncoder bpe = new BCryptPasswordEncoder();
		user.setUser_password(bpe.encode(user.getUser_password()));
		
		User IdchkUser=usersDao.selectById(user.getUser_id());
		if(IdchkUser!=null) {
			return "alreadyId";
		}
		User EmailchkUser=usersDao.selectByEmail(user.getUser_email());
		if(EmailchkUser!=null) {
			return "alreadyEmail";
		}
		usersDao.insert(user);
		return "joinSuccess";
	}
	
	public String login(User user) {
		User dbUser = usersDao.selectById(user.getUser_id());
		
		if(dbUser == null) {
			return "wrongUid";
		} else {
			BCryptPasswordEncoder bpe = new BCryptPasswordEncoder();
			boolean result = bpe.matches(user.getUser_password(), dbUser.getUser_password());
			if(result == false) {
				return "wrongUpassword";
			}
		}		
		return "success";
	}
	public User findById(String user_id) {
		User dbUser=usersDao.selectById(user_id);
		return dbUser;
	}
	
	public User findId(User user) {
		User dbUser=usersDao.selectByNameEmail(user);
		return dbUser;
		

	}
	
	public User findPassword(User user) {
		User dbUser=usersDao.selectByIdName(user);
		return dbUser;
	}
	
	public void updateInfo(User user) {
		usersDao.updateInfo(user);
	}

	public String updatePassword(User user,String new_password) {
		User dbUser=usersDao.selectById(user.getUser_id());
		BCryptPasswordEncoder bpe=new BCryptPasswordEncoder();
		boolean result=bpe.matches(user.getUser_password(), dbUser.getUser_password());
		if(result) {
			logger.info("현재 비밀번호 일치");
			user.setUser_password(bpe.encode(new_password));
			usersDao.updatePassword(user);
			return "success";
		}else {
			logger.info("현재 비밀번호 불일치");
			return "fail";
		}
		
	}

	public void delete(String user_id) {
		logger.info("여기까진 옴");
		usersDao.delete(user_id);
	}
	
}
