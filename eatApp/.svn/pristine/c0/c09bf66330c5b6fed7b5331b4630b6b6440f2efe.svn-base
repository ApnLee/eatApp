package com.eatApp.service;

import java.util.List;

import com.eatApp.entity.User;

public interface UserService {
/**
 * 通过用户名拿到密码 判断是否正确
 */
	public int LoginService(String Username,String Password);
	
	/**
	 * 注册
	 */
	public void register(String phoneoremail ,String email,String password);
	
	/**
	 * 查找出所有的表信息
	 */
	public List<User> findAll();
	/**
	 * 通过手机号和邮箱号拿到此用户所有信息
	 */
	public User getUserByUsername(String username);
	/**
	 * 更新用户信息
	 */
	public void updateUser(User user);
}
