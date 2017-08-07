package com.eatApp.service.impl;

import java.util.List;

import com.eatApp.dao.CategoryDAO;
import com.eatApp.dao.impl.CategoryDAOImpl;
import com.eatApp.entity.Category;
import com.eatApp.service.CategoryService;

public class CategoryServiceImpl implements CategoryService {

	CategoryDAO cateDao = new CategoryDAOImpl();

	@Override
	public List<Category> getFirstCategory() {
		
		 return cateDao.getFirstCategory();
	}

}
