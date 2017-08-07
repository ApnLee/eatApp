package com.eatApp.service.impl;

import java.util.List;

import com.eatApp.dao.OrderDetailDao;
import com.eatApp.dao.impl.OrderDeatilDaoImpl;
import com.eatApp.entity.Collection;
import com.eatApp.entity.OrderDeatil;
import com.eatApp.service.OrderDeatilService;
import com.eatApp.utils.PageBean;

public class OrderDeatilServiceImpl implements OrderDeatilService{
       OrderDetailDao dao=new OrderDeatilDaoImpl();
	@Override
	public List<OrderDeatil> getAllOrders(int orderid) {
		// TODO Auto-generated method stub
		return dao.getAllOrders(orderid);
	}
	@Override
	public void delOrderDetailByOrderId(int orderid) {
		// TODO Auto-generated method stub
		dao.delOrderDetailByOrderId(orderid);
	}
	@Override
	public void updateOrderDeatil(OrderDeatil deatil) {
		// TODO Auto-generated method stub
		dao.updateOrderDeatil(deatil);
	}
	@Override
	public OrderDeatil queryOrderDetail(int id) {
		// TODO Auto-generated method stub
		return dao.queryOrderDetail(id);
	}
	@Override
	public List<OrderDeatil> findListByShopId(int shopid) {
		// TODO Auto-generated method stub
		return dao.findListByShopId(shopid);
	}
	@Override
	public void setPageBean(PageBean<OrderDeatil> pageBean,int snackId) {
		 int count = this.getOrderDeatilCount(snackId).intValue();
			
			pageBean.setTotalCount(count);
			
			//当前页不能大于总页数
			if(pageBean.getCurrent() > pageBean.getTotal()){
				pageBean.setCurrent(pageBean.getTotal());
			}
			//当前页不能小于1
			if(pageBean.getCurrent() < 1){
				pageBean.setCurrent(1);
			}
			
			
			//算出开始的条数
			int startIndex = (pageBean.getCurrent() - 1) * pageBean.getMaxResult();
			//得到分页的数据
			List<OrderDeatil> deatils =dao.getOrderDeatilByStartPage(startIndex, pageBean.getMaxResult(),snackId);
			
			//封装到pageBean
			pageBean.setDatas(deatils);

		
	}
	@Override
	public Long getOrderDeatilCount(int snackId) {
		
		return dao.getOrderDeatilCount(snackId);
	}

	@Override
	public List<OrderDeatil> getAllByUserId(int userid) {
		
		return dao.getAllByUserId(userid);
	}

	@Override
	public List<OrderDeatil> getAllOrder(int orderid) {
		// TODO Auto-generated method stub
		return dao.getAllOrder(orderid);
	}
}
