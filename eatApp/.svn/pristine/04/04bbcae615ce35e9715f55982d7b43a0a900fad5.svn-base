package com.eatApp.dao;

import java.util.List;

import com.eatApp.entity.User;

public interface UserDao {

	
	/**
	 * 通过手机号和邮箱号拿到此用户所有信息
	 */
	public User getUserByUsername(String username);
	
	/**
	 * 注册
	 */
	public void register(String phone ,String email,String password);
	
	/**
	 * 查找出所有的表信息
	 */
	public List<User> findAll();
	/**
	 * 更新用户
	 */
	public void updateUser(User user);
}
