package com.mycompany.webapp.dao;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.webapp.dto.User;

@Mapper
public interface UsersDao {

	public int insert(User user);
	public User selectByUid(String user_id);
	public int updatePassword(User user);
	public int deleteUser(User user);
	
}
