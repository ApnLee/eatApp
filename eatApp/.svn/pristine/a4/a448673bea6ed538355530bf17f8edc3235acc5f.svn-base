package com.eatApp.test;

import java.util.List;

import org.junit.Test;

import com.eatApp.dao.CategoryDAO;
import com.eatApp.dao.impl.CategoryDAOImpl;
import com.eatApp.entity.Category;
import com.eatApp.service.OrderService;
import com.eatApp.service.impl.OrderServiceImpl;

public class test01 {


	
	@Test
	public void test(){
		CategoryDAO cateDao = new CategoryDAOImpl();
		List<Category> cates = cateDao.getFirstCategory();
		
		for (Category category : cates) {
			
			System.out.println(category.getCategoryName());
			
			for (Category category1 : category.getChild()) {
				
				System.out.println(category1.getCategoryName());
				
				for (Category category2 : category1.getChild()) {
					
					System.out.println(category2.getCategoryName());
					
				}
			}
		}
	}
}
