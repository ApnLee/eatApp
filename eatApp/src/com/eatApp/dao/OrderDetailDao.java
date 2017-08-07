package com.eatApp.dao;

import java.util.List;

import com.eatApp.entity.OrderDeatil;

public interface OrderDetailDao {

	
	/***
	 * 通过订单编号 获得订单详情
	 */
	public List<OrderDeatil> getAllOrders(int orderid);
	
	public List<OrderDeatil> getAllOrder(int orderid);
	/**
	 * 通过订单编号删除订单详情
	 */
	public void delOrderDetailByOrderId(int orderid);
	/**
	 * 添加评价
	 */
	 public void updateOrderDeatil(OrderDeatil deatil);
	 /**
	  * 通过订单详情id 获得订单详情
	  */
	 public OrderDeatil queryOrderDetail(int id);
	
	 //通过snackid拿到订单详情且评价不为空
	 public List<OrderDeatil> findListByShopId(int shopid);
	 
	 /**
		 * 分页查询
		 */
	public List<OrderDeatil> getOrderDeatilByStartPage(int startPage, int maxResult,int snackId);
		
	public Long getOrderDeatilCount(int snackId);

    /**
     * 拿到当前用户的所有评价
     */
	public List<OrderDeatil> getAllByUserId(int userid);
}
