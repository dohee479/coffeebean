package com.mycompany.webapp.dao;

import org.apache.ibatis.annotations.Mapper;

import com.mycompany.webapp.dto.User;

@Mapper
public interface UsersDao {

	public int insert(User user);
	public User selectById(String user_id);
	public User selectByEmail(String user_email);
	public User selectByNameEmail(User user);
	public User selectByIdName(User user);
	public int updateInfo(User user);
	public int updatePassword(User user);
	public int delete(String user_id);
	
}
