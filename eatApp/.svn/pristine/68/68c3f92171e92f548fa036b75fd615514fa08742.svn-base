package com.eatApp.servlet;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.eatApp.entity.Order;
import com.eatApp.entity.OrderDeatil;
import com.eatApp.entity.Snack;
import com.eatApp.entity.User;
import com.eatApp.service.OrderDeatilService;
import com.eatApp.service.OrderService;
import com.eatApp.service.SnackService;
import com.eatApp.service.UserService;
import com.eatApp.service.impl.OrderDeatilServiceImpl;
import com.eatApp.service.impl.OrderServiceImpl;
import com.eatApp.service.impl.SnackServiceImpl;
import com.eatApp.service.impl.UserServieceImpl;
import com.eatApp.utils.KdniaoTrackQueryAPI;
import com.eatApp.utils.PageBean;

public class OrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	UserService userService = new UserServieceImpl();
	OrderService orderService = new OrderServiceImpl();
	OrderDeatilService deatilService = new OrderDeatilServiceImpl();
	SnackService snackService = new SnackServiceImpl();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String method = request.getParameter("method");
		if ("showOrders".equals(method)) {
			showOrders(request, response);
		} else if ("delOrder".equals(method)) {
			delOrder(request, response);
		} else if ("comment".equals(method)) {
			comment(request, response);
		} else if ("gotoComment".equals(method)) {
			gotoComment(request, response);
		}else if ("showlogistics".equals(method)) {
			showlogistics(request, response);
		}else if("verifyOrder".equals(method)){
			verifyOrder(request, response);
		}else if("showComment".equals(method)){
			showComment(request, response);
		}
	}
	



	private void showComment(HttpServletRequest request, HttpServletResponse response) {
		User user = userService.getUserByUsername((String) request.getSession().getAttribute("UserName"));
	    if(user!=null){
	    	List<OrderDeatil> list=deatilService.getAllByUserId(user.getId());
	    	request.setAttribute("list", list);
	    	try {
				request.getRequestDispatcher("/app/comment.jsp").forward(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	    }
	
	}




	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	private void showOrders(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		int current = 1;
		PageBean<Order> pageBean = new PageBean<Order>();
		pageBean.setMaxResult(2);
		if (request.getParameter("currentPage") != null && !"".equals(request.getParameter("currentPage"))) {
			current = Integer.parseInt(request.getParameter("currentPage"));
		}
		pageBean.setCurrent(current);
		User user = userService.getUserByUsername((String) request.getSession().getAttribute("UserName"));
		orderService.setPageBean(pageBean, user.getId());
		request.setAttribute("pageBean", pageBean);
		try {
			request.getRequestDispatcher("/app/order.jsp").forward(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	private void delOrder(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		int orderid = Integer.parseInt(request.getParameter("orderid"));
		orderService.delOrderById(orderid);
		showOrders(request, response);
	}

	private void comment(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		int orderId = Integer.parseInt(request.getParameter("orderid"));
		List<OrderDeatil> orderDeatils = deatilService.getAllOrders(orderId);
		request.setAttribute("orderDeatils", orderDeatils);
		try {
			request.getRequestDispatcher("/app/commentlist.jsp").forward(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	private void gotoComment(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		String orderDetialid = request.getParameter("orderDeailid");
		String comment = request.getParameter("comm"+orderDetialid);
		if ("".equals(comment)||comment==null) {
			comment="系统默认好评";
		}
		OrderDeatil orderDeatil=deatilService.queryOrderDetail(Integer.parseInt(orderDetialid));
		String levle = request.getParameter("level");
		try {
			levle=new String(levle.getBytes("iso-8859-1"), "utf-8");
	
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		int intLevle=0;
		switch (levle) {
		case "好评":
             intLevle=1;
			break;
		case "中评":
            intLevle=2;
			break;
		case "差评":
            intLevle=3;
			break;

		}
		orderDeatil.setComment(comment);
		orderDeatil.setValuationlevel(intLevle);
		orderDeatil.setCommentDate(new Date());
		deatilService.updateOrderDeatil(orderDeatil);
		//当前商品的评论数增加
		OrderDeatil detail=deatilService.queryOrderDetail(Integer.parseInt(orderDetialid));
		int count=snackService.findSnackById(detail.getShopid()).getEvaluate();
		snackService.updateEvaluate(detail.getShopid(),count);
		showOrders(request, response);

	}
	private void showlogistics(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		int orderId=Integer.parseInt(request.getParameter("orderid"));
		List<String> list=null;
		Order order=orderService.findOrderById(orderId);
		try {
			list = new KdniaoTrackQueryAPI().getOrderTracesByJson(order.getWaycode(), order.getWaynum());
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		request.setAttribute("order", order);
		request.setAttribute("list", list);
		try {
			request.getRequestDispatcher("app/logistics.jsp").forward(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	private void verifyOrder(HttpServletRequest request, HttpServletResponse response) {
		int id=Integer.parseInt(request.getParameter("id"));
		//点击确认收货后，更改订单状态为6待评价
		orderService.updateStatus(id, 6);
	   //通过orderid 拿到orderdetail 再更改snack销量
		List<OrderDeatil> detailList=deatilService.getAllOrders(id);
		for (OrderDeatil orderDeatil : detailList) {
			snackService.updateSnackCount(orderDeatil.getShopid(),orderDeatil.getShopcount());
		}
		showOrders(request, response);
	}


	
}
