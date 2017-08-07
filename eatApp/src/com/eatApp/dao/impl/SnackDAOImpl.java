package com.eatApp.dao.impl;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import com.eatApp.dao.SnackDAO;
import com.eatApp.entity.Snack;
import com.eatApp.utils.ComPoolUtil;

/**
 * 零食的service实现
 * 
 * @author ApnLee
 *
 */
public class SnackDAOImpl implements SnackDAO {

	@Override
	public List<Snack> getAllSnack(Snack snack, int startIndex, int maxResult) {

		List<Snack> snacks = null;

		StringBuilder sb = new StringBuilder("select * from t_snack");
		// 按名称查询
		if (snack.getSnackName() != null && !"".equals(snack.getSnackName())) {
			sb.append(" and snackName like '%" + snack.getSnackName() + "%'");
		}

		sb.append(" limit " + startIndex + "," + maxResult + "");
		// 替换
		String sql = sb.toString().replaceFirst("and", "where");
		System.out.println("sql:"+sql);
		
		try {
			snacks = ComPoolUtil.getQueryRunner().query(sql, new BeanListHandler<Snack>(Snack.class));
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}

		return snacks;
	}

	@Override
	public Long getSnackCount(Snack snack) {
		Long totalCount = 0l;
		StringBuilder sb = new StringBuilder("select count(*) from t_snack");

		if (snack.getSnackName() != null && !"".equals(snack.getSnackName())) {
			sb.append(" and snackName like '%" + snack.getSnackName() + "%'");
		}

		String sql = sb.toString().replaceFirst("and", "where");
		try {				
			totalCount = ComPoolUtil.getQueryRunner().query(sql, new ScalarHandler<Long>());
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		return totalCount;

	}

	@Override
	public Snack findSnackById(int id) {
		Snack snack=null;
		try {	
			snack = ComPoolUtil.getQueryRunner().query("select * from t_snack where id = ? ", 
						new BeanHandler<Snack>(Snack.class), 
						id);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}

		return snack;
	}

	@Override
	public int addSnack(Snack snack) {
		int count = 0;
		String sql = "insert into t_snack(snackName,price,mktprice,image,stock,type,materialArea,productionArea,dosing,weight,expirationDate,storeMethod,edibleMethod) values(?,?,?,?,?,?,?,?,?,?,?,?,?)";
		try {
		count = ComPoolUtil.getQueryRunner().update(sql, snack.getSnackName(),
					snack.getPrice(),snack.getMktprice(),snack.getImage(),snack.getStock(),
					snack.getType(),snack.getMaterialArea(),snack.getProductionArea(),
					snack.getDosing(),snack.getWeight(),snack.getExpirationDate(),
					snack.getStoreMethod(),snack.getEdibleMethod());
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		return count;
	}

	@Override
	public List<Snack> findAll() {
		List<Snack> list=null;
		try {
			list=ComPoolUtil.getQueryRunner().query("select * from t_sanck",new BeanListHandler<Snack>(Snack.class));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public void updateSnackCount(int id, int count) {
		Snack snack=null;
		try {
			 snack=ComPoolUtil.getQueryRunner().query("select * from t_snack where id=?",new BeanHandler<Snack>(Snack.class),id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		int totalSales=snack.getTotalSales()+count;
		try {
			ComPoolUtil.getQueryRunner().update("update t_snack set totalSales=? where id=?",totalSales,id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public void updateEvaluate(int id,int evaluate) {
		try {
			ComPoolUtil.getQueryRunner().update("update t_snack set evaluate=? where id=?",evaluate+1,id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public int deleteSnackById(int id) {
		int count = 0;		
		try {
			count=ComPoolUtil.getQueryRunner().update("delete from t_snack where id = ?", id);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		return count;
	}

	@Override
	public void updateSnack(Snack snack) {
		try {
			ComPoolUtil.getQueryRunner().update("update t_snack set snackName=?,price=?,mktprice=?,image=?,totalsales=?,evaluate=?,stock=?,type=?,materialArea=?,"
					+ "productionArea=?,dosing=?,weight=?,expirationDate=?,storeMethod=?,edibleMethod=? where id=?",
					snack.getSnackName(),snack.getPrice(),snack.getMktprice(),snack.getImage(),snack.getTotalSales(),snack.getEvaluate(),snack.getStock(),snack.getType(),snack.getMaterialArea(),
					snack.getProductionArea(),snack.getDosing(),snack.getWeight(),snack.getExpirationDate(),snack.getStoreMethod(),snack.getEdibleMethod(),snack.getId());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	@Override
	public Snack findNewSnack() {
		Snack snack=null;
		try {
			 snack=ComPoolUtil.getQueryRunner().query("select * from t_snack where id=(select max(id) from t_snack)",new BeanHandler<Snack>(Snack.class));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return snack;
	}

	@Override
	public Snack findCountSnack() {
		Snack snack=null;
		try {
			 snack=ComPoolUtil.getQueryRunner().query("select * from t_snack where totalsales=(select max(totalsales) from t_snack) order by rand() limit 1 ",new BeanHandler<Snack>(Snack.class));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return snack;
	}
		
}
