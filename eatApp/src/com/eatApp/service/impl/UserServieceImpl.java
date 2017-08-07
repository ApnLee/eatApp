package com.eatApp.service.impl;

import java.util.List;

import com.eatApp.dao.UserDao;
import com.eatApp.dao.impl.UserDaoImpl;
import com.eatApp.entity.User;
import com.eatApp.service.UserService;

public class UserServieceImpl implements UserService {
	UserDao userdao =new UserDaoImpl();
/**
 * 返回2，用户名不存在
 * 返回1，密码正确！
 * 返回0，密码错误。
 */
	@Override
	public int LoginService(String username,String password) {
	    User user=userdao.getUserByUsername(username);
	    if(user==null){
	    	return 2;
	    }else if(user.getPassword().equals(password)){
	    	return 1;
	    }else{
	    	return 0;
	    }
	}
@Override
public void register(String phone, String email, String password) {
	userdao.register(phone, email, password);
	
}
@Override
public List<User> findAll() {
	
	return userdao.findAll();
}
@Override
public User getUserByUsername(String username) {
	// TODO Auto-generated method stub
	return userdao.getUserByUsername(username);
}
@Override
public void updateUser(User user) {
	// TODO Auto-generated method stub
	userdao.updateUser(user);
}

}
