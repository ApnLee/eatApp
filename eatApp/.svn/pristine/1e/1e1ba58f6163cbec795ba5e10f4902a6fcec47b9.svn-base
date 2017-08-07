package com.eatApp.dao.impl;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import com.eatApp.dao.LogisticsDAO;
import com.eatApp.entity.Logistics;
import com.eatApp.entity.Snack;
import com.eatApp.utils.ComPoolUtil;

public class LogisticsDAOImpl implements LogisticsDAO {

	@Override
	public List<Logistics> getAllLogistics(Logistics logistics, int startIndex, int maxResult) {
		List<Logistics> logisticses = null;

		StringBuilder sb = new StringBuilder("select * from t_logistics");
		sb.append(" limit " + startIndex + "," + maxResult + "");
		String sql = sb.toString();
		System.out.println("sql:" + sql);

		try {
			logisticses = ComPoolUtil.getQueryRunner().query(sql, new BeanListHandler<Logistics>(Logistics.class));
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}

		return logisticses;
	}

	@Override
	public Long getLogisticsCount(Logistics logistics) {
		Long totalCount = 0l;
		StringBuilder sb = new StringBuilder("select count(*) from t_logistics");
		String sql = sb.toString();
		try {
			totalCount = ComPoolUtil.getQueryRunner().query(sql, new ScalarHandler<Long>());
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		return totalCount;
	}

	@Override
	public Logistics findLogisticsById(int id) {
		Logistics logistics=null;
		try {	
			logistics = ComPoolUtil.getQueryRunner().query("select * from t_logistics where id = ? ", 
						new BeanHandler<Logistics>(Logistics.class), 
						id);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		return logistics;
	}

	@Override
	public int addLogistics(Logistics logistics) {
		int count = 0;
		String sql = "insert into t_logistics(logisticsCode,logisticsCompany) values(?,?)";
		try {
		count = ComPoolUtil.getQueryRunner().update(sql,logistics.getLogisticsCode(),logistics.getLogisticsCompany());
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		return count;
	}

	@Override
	public int deleteLogisticsById(int id) {
		int count = 0;		
		try {
			count=ComPoolUtil.getQueryRunner().update("delete from t_logistics where id = ?", id);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		return count;
	}

	@Override
	public void updateLogistics(Logistics logistics) {
		try {
			ComPoolUtil.getQueryRunner().update("update t_logistics set logisticsCode = ?,logisticsCompany = ? where id = ?",
					logistics.getLogisticsCode(),logistics.getLogisticsCompany(),logistics.getId());
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}

	}

}
