package com.eatApp.dao.impl;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.eatApp.dao.UserDao;
import com.eatApp.entity.User;
import com.eatApp.utils.ComPoolUtil;

public class UserDaoImpl implements UserDao {

	@Override
	public User getUserByUsername(String username) {
		User user=null;
	 try {
		user=ComPoolUtil.getQueryRunner().query("select * from t_user where phone=? or email=?",
					new BeanHandler<User>(User.class),
					new Object[]{username,username});
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return user;
	}

	@Override
	public void register(String phone, String email,String password) {

		if(phone==null||"".equals(phone)){
		try {
			ComPoolUtil.getQueryRunner().update("insert into t_user(nickname,email,password,sex) values (?,?,?,?)",email,email,password,0);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}else{
		try {
			ComPoolUtil.getQueryRunner().update("insert into t_user(nickname,phone,password,sex) values (?,?,?,?)",phone,phone,password,0);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	}

	@Override
	public List<User> findAll() {
		List<User> userList=null;
		try {
			userList=ComPoolUtil.getQueryRunner().query("select * from t_user",new BeanListHandler<User>(User.class));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return userList;
	}

	@Override
	public void updateUser(User user) {
		try {
			ComPoolUtil.getQueryRunner().update("update t_user set realname=?,nickname=?,password=?,sex=?,birthday=?,phone=?,email=? where id=?"
					,user.getRealname(),user.getNickname(),user.getPassword(),user.getSex(),user.getBirthday(),user.getPhone(),user.getEmail(),user.getId());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}
