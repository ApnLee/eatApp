package com.eatApp.service;

import java.util.List;

import com.eatApp.entity.OrderDeatil;
import com.eatApp.utils.PageBean;

public interface OrderDeatilService {

	/***
	 * 通过订单编号 获得订单详情
	 */
	public List<OrderDeatil> getAllOrders(int orderid);
	/**
	 * 通过订单编号删除订单详情
	 */
	public void delOrderDetailByOrderId(int orderid);
	public List<OrderDeatil> getAllOrder(int orderid);
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
	  	 * 封装分页的信息
	  	 * @param pageBean
	  	 */
	  	public void setPageBean(PageBean<OrderDeatil> pageBean,int snackId);	
	  	
	    public Long getOrderDeatilCount(int snackId);
	    
	    /**
	     * 拿到当前用户的所有评价
	     */
		public List<OrderDeatil> getAllByUserId(int userid);
}
