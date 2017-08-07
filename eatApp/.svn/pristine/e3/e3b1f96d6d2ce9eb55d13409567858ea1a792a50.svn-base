package com.eatApp.dao.impl;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import com.eatApp.dao.BackOrderDAO;
import com.eatApp.entity.Order;
import com.eatApp.utils.ComPoolUtil;

public class BackOrderDAOImpl implements BackOrderDAO {

	//有物流
	@Override
	public List<Order> findAllOrder(Order order, int startIndex, int maxResult) {
		List<Order> orders = null;

		StringBuilder sb = new StringBuilder("select e.*,f.statusName from t_status f right join"+
											 " (select c.*,d.logisticsCompany from t_logistics d right join"+ 
		" (select a.*,b.realname from  t_user b right join t_order a on a.userid = b.id) c on c.waycode = d.logisticsCode) e "+ 
											 " on e.orderstatus = f.id ");			
		sb.append(" limit "+ startIndex + "," + maxResult);		
		
		String sql = sb.toString();						
		System.out.println("sql:" + sql);
		
		try {
			orders = ComPoolUtil.getQueryRunner().query(sql, new BeanListHandler<Order>(Order.class));
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		
		return orders;
	}
	
	//有物流
	@Override
	public Long getOrderCount(Order order) {
		Long totalCount = 0l;		
		
		StringBuilder sb = new StringBuilder("select count(*) from t_status f right join"+
				 " (select c.*,d.logisticsCompany from t_logistics d right join"+ 
				 " (select a.*,b.realname from  t_user b right join t_order a on a.userid = b.id) c on c.waycode = d.logisticsCode) e"+ 
				 " on e.orderstatus = f.id ");
		
		String sql = sb.toString();	
		System.out.println("sql:" + sql);
		
		try {
			totalCount = ComPoolUtil.getQueryRunner().query(sql, new ScalarHandler<Long>());
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		
		return totalCount;
	}

	@Override
	public Order findOrderById(int id) {
		Order order = null;
		
		try {
			order = ComPoolUtil.getQueryRunner().query("select * from t_order where id = ?", new BeanHandler<Order>(Order.class),id);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		
		return order;
	}

	@Override
	public int update(Order order) {
		int count = 0;
		
		try {
			count = ComPoolUtil.getQueryRunner().update(
					"update t_order set orderdate = ?,waycode = ?,waynum = ?,orderstatus = ?,address = ? where id = ?",
					order.getOrderdate(),order.getWaycode(),order.getWaynum(),order.getOrderStatus(),order.getAddress(),order.getId());
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		return count;
	}

	@Override
	public int deleteOrder(int id) {
		int count = 0;
		try {
			count = ComPoolUtil.getQueryRunner().update("delete from t_order where id = ?",id);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		return count;
	}

}
