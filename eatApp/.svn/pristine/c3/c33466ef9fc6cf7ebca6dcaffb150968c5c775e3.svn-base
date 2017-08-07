package com.eatApp.dao.impl;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import com.eatApp.dao.OrderDetailDao;
import com.eatApp.entity.Collection;
import com.eatApp.entity.OrderDeatil;
import com.eatApp.utils.ComPoolUtil;


public class OrderDeatilDaoImpl implements OrderDetailDao {

	@Override
	public List<OrderDeatil> getAllOrders(int orderid) {
		// TODO Auto-generated method stub
		List<OrderDeatil> OrderDeatils=null;
		try {
			OrderDeatils=ComPoolUtil.getQueryRunner().query(
					  "select t_orderdeatil.id,orderid,shopcount,snackName,image,mktprice,shopid from t_orderdeatil,t_snack where "
					+ "orderid=? AND t_orderdeatil.shopid=t_snack.id and valuationlevel IS  NULL", 
					new BeanListHandler<OrderDeatil>(OrderDeatil.class),orderid);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return OrderDeatils;
	}

	@Override
	public void delOrderDetailByOrderId(int orderid) {
		try {
			ComPoolUtil.getQueryRunner().update("delete from t_orderdeatil where orderid=?",orderid);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	@Override
	public void updateOrderDeatil(OrderDeatil deatil) {
		// TODO Auto-generated method stub
		try {
			ComPoolUtil.getQueryRunner().update("update t_orderdeatil set comment=?,valuationlevel=?,commentDate=?  where id=?",
					deatil.getComment(),deatil.getValuationlevel(),deatil.getCommentDate(),deatil.getId());
			Long count=ComPoolUtil.getQueryRunner().query("select count(*) from t_orderdeatil where orderid=? and valuationlevel IS NULL", 
					    new ScalarHandler<Long>(),deatil.getOrderid());
			if (count==0) {
				ComPoolUtil.getQueryRunner().update("update t_order set orderstatus=1 where id=?",deatil.getOrderid());
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	@Override
	public OrderDeatil queryOrderDetail(int id) {
		   OrderDeatil deatil=null;
		   try {                                                     
			deatil=ComPoolUtil.getQueryRunner().query("select * from t_orderdeatil where id=?", 
					   new BeanHandler<OrderDeatil>(OrderDeatil.class),id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		   
		return deatil;
	}

	@Override
	public List<OrderDeatil> findListByShopId(int shopid) {
		List<OrderDeatil> list=null;
		try {
			list=ComPoolUtil.getQueryRunner().query("select * from t_orderdeatil where shopid=? and comment IS NOT NULL",new BeanListHandler<OrderDeatil>(OrderDeatil.class),shopid);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<OrderDeatil> getOrderDeatilByStartPage(int startPage, int maxResult,int snackId) {
		List<OrderDeatil> orderDeatils=null;

		StringBuilder sb = new StringBuilder("select t_orderdeatil.*,t_user.nickname from t_orderdeatil,t_order,t_user and t_orderdeatil.orderid=t_order.id and t_order.userid=t_user.id and t_orderdeatil.shopid=?");	
		
				sb.append(" limit "+startPage+" ,"+maxResult+"");
				
				String sql = sb.toString().replaceFirst("and", "where");
				
				
		try{
			orderDeatils =ComPoolUtil.getQueryRunner().query(sql,
				new BeanListHandler<OrderDeatil>(OrderDeatil.class),snackId);
	} catch (SQLException e) {
		e.printStackTrace();
		throw new RuntimeException(e);
	}
	
	return orderDeatils;
	}

	@Override
	public Long getOrderDeatilCount(int snackId) {
		 Long totalCount = 0l;
			
			try {
				StringBuilder sb = new StringBuilder("select count(*) from t_orderdeatil,t_order,t_user and t_orderdeatil.orderid=t_order.id and t_order.userid=t_user.id and t_orderdeatil.shopid=? ");
	
				String sql = sb.toString().replaceFirst("and", "where");
				
				totalCount =ComPoolUtil.getQueryRunner().query(sql,
						new ScalarHandler<Long>(),snackId);
				
			} catch (SQLException e) {
				e.printStackTrace();
				throw new RuntimeException(e);
			}
			
			return totalCount;
	}

	@Override
	public List<OrderDeatil> getAllByUserId(int userid) {
		List<OrderDeatil> list=null;
		try {
			list=ComPoolUtil.getQueryRunner().query("select t_orderdeatil.*,t_snack.image,t_snack.snackName from t_snack,t_order,t_orderdeatil where t_order.id=t_orderdeatil.orderid and t_orderdeatil.shopid=t_snack.id and comment is not null and  t_order.userid=?;",
					new BeanListHandler<OrderDeatil>(OrderDeatil.class),userid);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<OrderDeatil> getAllOrder(int orderid) {

		// TODO Auto-generated method stub
		List<OrderDeatil> OrderDeatils=null;
		try {
			OrderDeatils=ComPoolUtil.getQueryRunner().query(
					  "select t_orderdeatil.id,orderid,shopcount,snackName,image,mktprice,shopid from t_orderdeatil,t_snack where "
					+ "orderid=? AND t_orderdeatil.shopid=t_snack.id", 
					new BeanListHandler<OrderDeatil>(OrderDeatil.class),orderid);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return OrderDeatils;
	
	}


	
}