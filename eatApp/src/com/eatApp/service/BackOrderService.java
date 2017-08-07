package com.eatApp.service;

import java.util.List;

import com.eatApp.entity.Order;
import com.eatApp.entity.Snack;
import com.eatApp.utils.PageBean;

public interface BackOrderService {

	/**
	 * 查询
	 */
	public void setPageBean(PageBean<Order> pageBean,Order order);
	
	/**
	 * 根据id查询订单
	 */
	public Order findOrderById(int id);
	
	/**
	 * 修改状态
	 */
	public int update(Order order);
	/**
	 * 删除
	 */
	public int deleteOrder(int id);
	
}
