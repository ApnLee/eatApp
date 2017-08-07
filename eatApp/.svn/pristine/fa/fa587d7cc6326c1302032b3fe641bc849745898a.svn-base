package com.eatApp.service;

import java.util.List;

import com.eatApp.entity.Order;
import com.eatApp.utils.AdminPageBean;
import com.eatApp.utils.PageBean;

public interface OrderService {
    /**
     * 获得所有订单
     */
	public List<Order> getAllOrders(int userid);
	/**
	 * 根据当前页和每页显示的条数，分页查询数据
	 * @param food  查询的条件
	 * @param currenPage 当前页
	 * @param maxResult  控制每页显示多少条数据
	 * @return
	 */
	public List<Order> getAllOrdersByPage(int currenPage , int maxResult,int userid);
	public void setPageBean(PageBean<Order> pageBean,int userid);
	/**
	 * 通过userid、orderid删除一个订单
	 */
	public void delOrderById(int orderid);
	
	/***
	 * 获得userid的各种订单状态的条数
	 */
	public List<Integer> getStatusCount(int userid);
	/**
	 * 通过orderid修改状态
	 */
	public void updateStatus(int orderid, int valuationlevel);
	
	/**
	 * 根据orderid查找订单
	 */
	public Order findOrderById(int id);
	/**
	 * 获得所有的订单
	 */
	public List<Order> findAll();
	/**
	 * 添加一条订单
	 */
	public void addOrder(Order order);
}
