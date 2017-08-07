package com.eatApp.servlet;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.eatApp.entity.Order;
import com.eatApp.service.BackOrderService;
import com.eatApp.service.impl.BackOrderServiceImpl;
import com.eatApp.utils.PageBean;


public class BackOrderServlet extends HttpServlet {
	
	BackOrderService backOrderService = new BackOrderServiceImpl();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String method = request.getParameter("method");
		
		if("list".equals(method)){
			list(request,response);
		}else if("updateUI".equals(method)){
			updateUI(request,response);
		}else if("update".equals(method)){
			update(request,response);
		}else if("delete".equals(method)){
			delete(request,response);
		}
		
	}

	
	public void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = request.getParameter("id");	
		if (null != id && !"".equals(id)) {
			backOrderService.deleteOrder(Integer.parseInt(id));
		}	
		//跳转
		request.getRequestDispatcher("BackOrderServlet?method=list").forward(request, response);
	}


	public void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//获取页面传过来的参数
		String orderId = request.getParameter("orderId");
		String orderdate = request.getParameter("orderdate");
		String waycode = request.getParameter("waycode");
		String waynum = request.getParameter("waynum");
		String orderStatus = request.getParameter("orderStatus");
		String address = request.getParameter("address");
		
		//封装
		Order order = new Order();
		if (null != orderId && !"".equals(orderId)) {
			order.setId(Integer.parseInt(orderId));
		}
		
		Date date = null;
		try {
			date = new SimpleDateFormat("yyyy-MM-dd").parse(orderdate);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		order.setOrderdate(date);
		
		order.setWaycode(waycode);
		order.setWaynum(waynum);
		
		if (null != orderStatus && !"".equals(orderStatus)) {
			order.setOrderStatus(Integer.parseInt(orderStatus));
		}

		order.setAddress(address);
		
		backOrderService.update(order);
		
		//跳转
		request.getRequestDispatcher("BackOrderServlet?method=list").forward(request, response);
		
	}


	public void updateUI(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		
		int orderId = 0;
		if (null != id && !"".equals(id)) {
			orderId = Integer.parseInt(id);
		}
		
		Order order = backOrderService.findOrderById(orderId);
		
		//放入作用域
		request.setAttribute("order", order);
		if (order.getOrderStatus() == 2 || order.getOrderStatus() == 3 || order.getOrderStatus() == 5 ) {
			//跳转
			request.getRequestDispatcher("back/order/updateOrder01.jsp").forward(request, response);
		}else{
			//跳转
			request.getRequestDispatcher("back/order/updateOrder02.jsp").forward(request, response);
		}
		
		
	}


	public void list(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Order order = new Order();
		//通用分页Bean
		PageBean<Order> pageBean = new PageBean<>();
		pageBean.setMaxResult(2);
		
		//默认第1页
		int intPage = 1;
		String currentPage = request.getParameter("currentPage");
		if (null != currentPage && !"".equals(currentPage)) {
			intPage = Integer.parseInt(currentPage);
		}
		pageBean.setCurrent(intPage);
		
		backOrderService.setPageBean(pageBean, order);
		
		//放入作用域
		request.setAttribute("pageBean", pageBean);
		request.setAttribute("order", order);
		
		//跳转
		request.getRequestDispatcher("back/order/orderList.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
		
	}

}
