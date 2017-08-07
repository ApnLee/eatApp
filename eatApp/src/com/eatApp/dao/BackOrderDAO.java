package com.eatApp.dao;

import java.util.List;

import com.eatApp.entity.Order;

/**
 * 后台订单
 * @author ApnLee
 *
 */
public interface BackOrderDAO {

	/**
	 * 得到所有订单
	 */
	public List<Order> findAllOrder(Order order, int startIndex,int maxResult);
	
	
	/**
	 * 得到订单的总数
	 */
	public Long getOrderCount(Order order);
	
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
