package com.eatApp.dao.impl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import com.eatApp.dao.OrderDao;
import com.eatApp.entity.Order;
import com.eatApp.entity.OrderDeatil;
import com.eatApp.service.OrderDeatilService;
import com.eatApp.service.impl.OrderDeatilServiceImpl;
import com.eatApp.utils.AdminPageBean;
import com.eatApp.utils.ComPoolUtil;

public class OrderDaoImpl implements OrderDao {

	@Override
	public List<Order> getAllOrders(int userid) {

		List<Order> orders = null;
		try {
			orders = ComPoolUtil.getQueryRunner().query("select * from t_order where userid=?",
					new BeanListHandler<Order>(Order.class), userid);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return orders;
	}

	@Override
	public int getOrderCount(int userid) {

		Long count = 0l;
		try {
			count = ComPoolUtil.getQueryRunner().query("select count(*) from t_order where userid=?",
					new ScalarHandler<Long>(), userid);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return new Long(count).intValue();
	}

	@Override
	public List<Order> getAllOrdersByPage(int currenPage, int maxResult, int userid) {

		List<Order> pageOrder = null;
		OrderDeatilService deatilService = new OrderDeatilServiceImpl();
		// 计算出从多少条数据开始
		int startIndex = (currenPage - 1) * maxResult;
		try {
			pageOrder = ComPoolUtil.getQueryRunner().query("select * from t_order where userid=? limit ?,?",
					new BeanListHandler<Order>(Order.class), new Object[] { userid, startIndex, maxResult });
			for (Order order : pageOrder) {
				order.setOrderDeatils(deatilService.getAllOrder(order.getId()));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return pageOrder;
	}

	@Override
	public void delOrderById(int orderid) {
		// 删除订单并删除关联的订单详情
		try {
			ComPoolUtil.getQueryRunner().update("delete from t_order where id=?", orderid);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		OrderDeatilService deatilService = new OrderDeatilServiceImpl();
		deatilService.delOrderDetailByOrderId(orderid);

	}

	@Override
	public List<Integer> getStatusCount(int userid) {

		List<Integer> status = new ArrayList<Integer>();
		try {
			for (int i = 0; i < 6; i++) {
				int temp = ComPoolUtil.getQueryRunner()
						.query("select count(*) from t_order where userid=? and orderstatus=?",
								new ScalarHandler<Long>(), userid, (i + 1))
						.intValue();
				status.add(i, temp);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();

		}
		return status;
	}

	@Override
	public Order findOrderById(int id) {
		Order order = null;
		try {
			order = (Order) ComPoolUtil.getQueryRunner().query("select * from t_order where id = ?",
					new BeanHandler<Order>(Order.class), id);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
		return order;
	}

	@Override
	public void updateStatus(int orderid, int valuationlevel) {
		try {
			ComPoolUtil.getQueryRunner().update("update t_order set orderstatus=? where id=?", valuationlevel, orderid);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<Order> findAll() {

		List<Order> orders = null;
		try {
			orders = ComPoolUtil.getQueryRunner().query("select * from t_order",
					new BeanListHandler<Order>(Order.class));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return orders;
	}

	@Override
	public void addOrder(Order order) {
		// 获得最大的id
		int id = 0;
		try {
			id = ComPoolUtil.getQueryRunner().query("select max(id) from t_order", new ScalarHandler<Integer>()) + 1;
			ComPoolUtil.getQueryRunner().update(
					"insert into t_order(userid,orderdate,totalprice,shopcount,orderstatus) values(?,?,?,?,?)", order.getUserId(),
					order.getOrderdate(), order.getTotalprice(),order.getShopcount(),5);
			for (OrderDeatil deatil : order.getOrderDeatils()) {
				deatil.setOrderid(id);
				// 口味
				
				ComPoolUtil.getQueryRunner().update("insert into t_orderdeatil(orderid,shopid,taste) values(?,?,?)",
						deatil.getOrderid(), deatil.getShopid(),deatil.getTaste());
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
}
