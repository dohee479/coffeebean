package com.mycompany.webapp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mycompany.webapp.dao.UsersDao;
import com.mycompany.webapp.dto.User;

@Service
public class UsersService {

	@Autowired
	private UsersDao usersDao;
	
	public void join(User user) {
		usersDao.insert(user);
	}
	
	public String login(User user) {
		User dbUser = usersDao.selectByUid(user.getUser_id());
		
		return "#";
	}
	
	public void updatePassword(User user) {
		usersDao.updatePassword(user);
	}
	
	public void deleteUser(User user) {
		usersDao.deleteUser(user);
	}
	
}
