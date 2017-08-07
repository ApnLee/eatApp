package com.eatApp.service.impl;

import java.util.List;

import com.eatApp.dao.OrderDao;
import com.eatApp.dao.impl.OrderDaoImpl;
import com.eatApp.entity.Order;
import com.eatApp.service.OrderService;
import com.eatApp.utils.PageBean;

public class OrderServiceImpl implements OrderService {
	OrderDao dao = new OrderDaoImpl();
	@Override
	public List<Order> getAllOrders(int userid) {
		
		return dao.getAllOrders(userid);
	}

	@Override
	public List<Order> getAllOrdersByPage(int currenPage, int maxResult, int userid) {
		
		return dao.getAllOrdersByPage(currenPage, maxResult, userid);
	}

	@Override
	public void setPageBean(PageBean<Order> pageBean, int userid) {
		
		// 得到当前userid的所有订单总数
		int totalCount = dao.getOrderCount(userid);
		// 赋值给pageBean
		pageBean.setTotalCount(totalCount);
		// 当前页不能大于总页数
		if (pageBean.getCurrent() > pageBean.getTotal()) {
			pageBean.setCurrent(pageBean.getTotal());
		}
		// 当前页不能小于1
		if (pageBean.getCurrent() < 1) {
			pageBean.setCurrent(1);
		}
		//得到分页的数据
		List<Order> orders=dao.getAllOrdersByPage(pageBean.getCurrent(), pageBean.getMaxResult(), userid);
		//封装数据
		pageBean.setDatas(orders);
	}

	@Override
	public void delOrderById( int orderid) {
		dao.delOrderById(orderid);
	}
	

	@Override
	public List<Integer> getStatusCount(int userid) {
		
		return dao.getStatusCount(userid);
	}

	@Override
	public void updateStatus(int orderid, int valuationlevel){
		dao.updateStatus(orderid, valuationlevel);
	}

	@Override
	public Order findOrderById(int id) {
		return dao.findOrderById(id);
	}

	@Override
	public List<Order> findAll() {
		return dao.findAll();
	}

	@Override
	public void addOrder(Order order) {
		dao.addOrder(order);
		
	}

}
