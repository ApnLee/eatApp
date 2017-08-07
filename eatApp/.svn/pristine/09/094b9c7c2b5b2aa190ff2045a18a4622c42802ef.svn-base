package com.eatApp.dao.impl;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.eatApp.dao.DetailImageDao;
import com.eatApp.entity.DetailImage;
import com.eatApp.utils.ComPoolUtil;

public class DetailImageDaoImpl implements DetailImageDao{

	@Override
	public List<DetailImage> findAllBySnackId(int snackid) {
		 List<DetailImage> list=null;
		try {
			list=ComPoolUtil.getQueryRunner().query("select * from t_detailImage where snackid=?",new BeanListHandler<DetailImage>(DetailImage.class),snackid);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<DetailImage> findSampleImage(int snackid) {
		 List<DetailImage> list=null;
			try {
				list=ComPoolUtil.getQueryRunner().query("select * from t_detailImage where snackid=? and isMajor=1",new BeanListHandler<DetailImage>(DetailImage.class),snackid);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return list;
	}

}
