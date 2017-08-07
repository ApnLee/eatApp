package com.eatApp.service.impl;

import com.eatApp.dao.AdminDao;
import com.eatApp.dao.impl.AdminDaoImpl;
import com.eatApp.entity.Admin;
import com.eatApp.service.AdminService;

public class AdminServiceImpl implements AdminService {

	AdminDao dao = new AdminDaoImpl();

	@Override
	public Admin getAdminByadName(Admin admin) {
		
		return dao.getAdminByadName(admin);
	}

}
