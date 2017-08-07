package com.eatApp.dao.impl;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import com.eatApp.dao.CollectionDao;
import com.eatApp.entity.Collection;
import com.eatApp.utils.ComPoolUtil;

public class CollectionDaoImpl implements CollectionDao{

	@Override
	public void addCollection(Collection collcetion) {
		
		try {
			ComPoolUtil.getQueryRunner().update("insert into t_collection(userid,snackid) values (?,?)",collcetion.getUserid(),collcetion.getSnackid());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public Collection findIsColection(int userid, int sanckid) {
		Collection collection=null;
		try {
			collection=ComPoolUtil.getQueryRunner().query("select * from t_collection where userid=? and snackid=?",
					new BeanHandler<Collection>(Collection.class),userid,sanckid);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return collection;
	}

	@Override
	public List<Collection> findListByUserId(int userid) {
		List<Collection> list=null;
		try {
			list=ComPoolUtil.getQueryRunner().query("select * from t_collection where userid=?",
					new BeanListHandler<Collection>(Collection.class),userid);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Collection> getCollectionByStartPage(Collection collection, int startPage, int maxResult) {
		List<Collection> collections=null;

		StringBuilder sb = new StringBuilder("select t_collection.*,t_snack.snackName,t_snack.price,t_snack.mktprice,t_snack.image,t_snack.totalSales,t_snack.evaluate from t_snack,t_collection ");	
		//按名称查询
		if(collection.getSnackName()!=null && !"".equals(collection.getSnackName())){
					sb.append(" and t_snack.snackName like '%"+collection.getSnackName()+"%'");
				}
				sb.append(" and t_collection.snackid=t_snack.id");
				sb.append(" and t_collection.userid=?");
				sb.append(" limit "+startPage+" ,"+maxResult+"");
				
				String sql = sb.toString().replaceFirst("and", "where");
				
		try{
			collections =ComPoolUtil.getQueryRunner().query(sql,
				new BeanListHandler<Collection>(Collection.class),collection.getUserid());
	} catch (SQLException e) {
		e.printStackTrace();
		throw new RuntimeException(e);
	}
	
	return collections;
	}

	@Override
	public Long getCollectionCount(Collection collection) {
          Long totalCount = 0l;
		
		try {
			StringBuilder sb = new StringBuilder("select count(*) from t_snack a,t_collection b ");
			//按名称查询
			if(collection.getSnackName()!= null && !"".equals(collection.getSnackName())){
				sb.append(" and a.snackName like '%"+collection.getSnackName()+"%'");
			}
			
			sb.append(" and a.id = b.snackid");
			
			sb.append(" and b.userid=?");
			String sql = sb.toString().replaceFirst("and", "where");
			
			totalCount =ComPoolUtil.getQueryRunner().query(sql,
					new ScalarHandler<Long>(),collection.getUserid());
			
		} catch (SQLException e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
		
		return totalCount;
	}

	@Override
	public void deleteColection(int userid, int snackid) {
		try {
			ComPoolUtil.getQueryRunner().update("delete from t_collection where userid=? and snackid=?",userid,snackid);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	}


