package com.mycompany.webapp.service;

import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
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
		User dbUser = usersDao.selectById(user.getUser_id());
		
<<<<<<< HEAD
		if(dbUser==null) {
			return "wrongUid";
		}else {
			/*BCryptPasswordEncoder bpe=new BCryptPasswordEncoder();
			boolean result=bpe.matches(user.getUser_password(), dbUser.getUser_password());
			if(result==false) {
				return "wrongUpassword";
			}*/
		}
		
		
=======
//		if(dbUser==null) {
//			return "wrongUid";
//		}else {
//			BCryptPasswordEncoder bpe=new BCryptPasswordEncoder();
//			boolean result=bpe.matches(user.getUser_password(), dbUser.getUser_password());
//			if(result==false) {
//				return "wrongUpassword";
//			}
//		}
//		
//		
>>>>>>> branch 'develop' of https://github.com/dohee479/coffeebean.git
		return "success";
	}
	
	public User findId(User user) {
		User dbUser=usersDao.selectByEmail(user.getUser_email());
		return dbUser;
		

	}
	
	public User findPassword(User user) {
		User dbUser=usersDao.selectById(user.getUser_id());
		return dbUser;
	}
	
	public void updateInfo(User user) {
		usersDao.updateInfo(user);
	}

	public void updatePassword(User user) {
		usersDao.updatePassword(user);
	}

	public void delete(String user_id) {
		//컨트롤러에서 principal로 현재 로그인한 id 받아옴
		usersDao.delete(user_id);
	}
	
}
