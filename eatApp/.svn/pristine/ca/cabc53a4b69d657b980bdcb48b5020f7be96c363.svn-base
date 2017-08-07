package com.eatApp.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.eatApp.entity.Logistics;
import com.eatApp.entity.Order;
import com.eatApp.service.LogisticsService;
import com.eatApp.service.impl.LogisticsServiceImpl;
import com.eatApp.utils.PageBean;


public class BackLogisticsServlet extends HttpServlet {
	
	LogisticsService logisticsService = new LogisticsServiceImpl();
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String method = request.getParameter("method");		
		if("list".equals(method)){
			list(request,response);
		}else if("add".equals(method)){
			add(request,response);
		}else if("updateUI".equals(method)){
			updateUI(request,response);
		}else if("update".equals(method)){
			update(request,response);
		}else if("delete".equals(method)){
			delete(request,response);
		}
	}

	
	public void add(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//获取页面传递过来的参数
		String logisticsCode = request.getParameter("logisticsCode");
		String logisticsCompany = request.getParameter("logisticsCompany");
		//封装
		Logistics logistics = new Logistics();
		if (null != logisticsCode && !"".equals(logisticsCode)) {
			logistics.setLogisticsCode(logisticsCode);
		}
		if (null != logisticsCompany && !"".equals(logisticsCompany)) {
			logistics.setLogisticsCompany(logisticsCompany);
		}

		logisticsService.addLogistics(logistics);
		
		request.getRequestDispatcher("BackLogisticsServlet?method=list").forward(request, response);
		
	}


	public void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = request.getParameter("id");
		if (null != id && !id.equals("")) {
			logisticsService.deleteLogisticsById(Integer.parseInt(id));
		}
		request.getRequestDispatcher("BackLogisticsServlet?method=list").forward(request, response);
		
	}


	public void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String logisticsId = request.getParameter("id");
		String logisticsCode = request.getParameter("logisticsCode");
		String logisticsCompany = request.getParameter("logisticsCompany");
		System.out.println("******"+logisticsCode+"***"+logisticsCompany);
		Logistics logistics = new Logistics();
		if (null != logisticsId && !"".equals(logisticsId)) {
			logistics.setId(Integer.parseInt(logisticsId));
		}
		
		logistics.setLogisticsCode(logisticsCode);
		logistics.setLogisticsCompany(logisticsCompany);
		
		logisticsService.updateLogistics(logistics);
		
		//跳转
		request.getRequestDispatcher("BackLogisticsServlet?method=list").forward(request, response);
	}


	public void updateUI(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = request.getParameter("id");
		
		int logisticsId = 0;
		if (null != id && !"".equals(id)) {
			logisticsId = Integer.parseInt(id);
		}
		
		Logistics logistics = logisticsService.findLogisticsById(logisticsId);
		
		//放入作用域
		request.setAttribute("logistics", logistics);

		//跳转
		request.getRequestDispatcher("back/logistics/updateLogistics.jsp").forward(request, response);

		
	}


	public void list(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Logistics logistics = new Logistics();
		//通用分页Pagebean
		PageBean<Logistics> pageBean = new PageBean<Logistics>();
		pageBean.setMaxResult(5);
				
		//默认为第一页
		int intPage = 1;
				
		String currentPage = request.getParameter("currentPage");
		if (currentPage != null && !"".equals(currentPage)) {
			intPage = Integer.parseInt(currentPage);
		}
		pageBean.setCurrent(intPage);
		logisticsService.setPageBean(pageBean, logistics);
			
		//放入作用域
		request.setAttribute("pageBean", pageBean);
		request.setAttribute("logistics", logistics);
		//跳转
		request.getRequestDispatcher("back/logistics/logisticsList.jsp").forward(request, response);
		
	}


	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
