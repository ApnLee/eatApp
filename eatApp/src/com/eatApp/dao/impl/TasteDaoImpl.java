package com.eatApp.dao.impl;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.eatApp.dao.TasteDao;
import com.eatApp.entity.Taste;
import com.eatApp.utils.ComPoolUtil;

public class TasteDaoImpl implements TasteDao{

	@Override
	public List<Taste> getListBySnackId(int snackid) {
		List<Taste> list=null;
		try {
			list=ComPoolUtil.getQueryRunner().query("select * from t_taste where snackid=?",new BeanListHandler<Taste>(Taste.class),snackid);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

}
