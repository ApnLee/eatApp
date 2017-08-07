package com.eatApp.dao;

import java.util.List;

import com.eatApp.entity.Order;
import com.eatApp.utils.AdminPageBean;

public interface OrderDao {
    /**
     * 通过userid获得所有订单
     */
	public List<Order> getAllOrders(int userid);
	
	/**
	 *获得userid的订单总数 
	 */
	public int getOrderCount(int userid);
	
	/***
	 * 通过userid 分页获得订单
	 */
	public List<Order> getAllOrdersByPage(int currenPage , int maxResult,int userid);
	/**
	 * 通过userid、orderid删除一个订单
	 */
	public void delOrderById(int orderid);
	/**
	 * 根据orderid查找订单
	 */
	public Order findOrderById(int id);
	
	/***
	 * 获得userid的各种订单状态的条数
	 */
	public List<Integer> getStatusCount(int userid);
	/**
	 * 通过orderid 修改订单 状态
	 * @param orderid
	 * @param valuationlevel
	 */
	public void updateStatus(int orderid,int valuationlevel);
	/**
	 * 获得所有的订单
	 */
	public List<Order> findAll();

	/**
	 * 添加一条订单
	 */
	public void addOrder(Order order);
	
}
