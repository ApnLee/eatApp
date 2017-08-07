package com.eatApp.dao.impl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.eatApp.dao.CategoryDAO;
import com.eatApp.entity.Category;
import com.eatApp.utils.ComPoolUtil;

public class CategoryDAOImpl implements CategoryDAO {

	@Override
	public List<Category> getFirstCategory() {
		List<Category> firstCates = null;
		List<Category> secondCates = null;
		List<Category> thirdCates = null;
		
		
		StringBuilder sb1 = new StringBuilder("select * from t_category where parent_id is null ");
		StringBuilder sb2 = new StringBuilder("select * from t_category where parent_id = ? ");
		
		
		String sql1 = sb1.toString();
		String sql2 = sb2.toString();
	
		
		try {
			firstCates = ComPoolUtil.getQueryRunner().query(sql1, new BeanListHandler<Category>(Category.class));
			
			for (Category category1 : firstCates) {				
				secondCates = ComPoolUtil.getQueryRunner().query(sql2, new BeanListHandler<Category>(Category.class),category1.getId());
				category1.setChild(secondCates);
				
				for (Category category2 : secondCates) {				
					thirdCates = ComPoolUtil.getQueryRunner().query(sql2, new BeanListHandler<Category>(Category.class),category2.getId());
					category2.setChild(thirdCates);
				}

			}
			
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		return firstCates;
		
	}

	
}
