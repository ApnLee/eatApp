package com.eatApp.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.eatApp.entity.Collection;
import com.eatApp.entity.Snack;
import com.eatApp.entity.User;
import com.eatApp.service.CollectionService;
import com.eatApp.service.SnackService;
import com.eatApp.service.UserService;
import com.eatApp.service.impl.CollectionServiceImpl;
import com.eatApp.service.impl.SnackServiceImpl;
import com.eatApp.service.impl.UserServieceImpl;
import com.eatApp.utils.PageBean;

public class CollectionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	UserService userService = new UserServieceImpl();
	SnackService snackService = new SnackServiceImpl();
	CollectionService collectionService=new CollectionServiceImpl();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String method=request.getParameter("method");
		if("clickCollection".equals(method)){
			clickCollection(request,response);
		}else if("showCollection".equals(method)){
			showCollection(request,response);
		}else if("deleteCollection".equals(method)){
			deleteCollection(request,response);
		}
	}

	


	private void clickCollection(HttpServletRequest request, HttpServletResponse response) throws IOException {
		//获取点击收藏后商品的id
		String strId=request.getParameter("id");
		String userName = (String) request.getSession().getAttribute("UserName");
	    User user=userService.getUserByUsername(userName);
		if(user!=null){
		//System.out.println(1234567);
	    Collection collection=new Collection();
	    collection.setUserid(user.getId()); 
	    collection.setSnackid(Integer.parseInt(strId));
	    collectionService.addCollection(collection);
		}
		else{
			PrintWriter pw=response.getWriter();
			pw.write("未登录");
			pw.flush();
			pw.close();
		}
	}
	
	private void showCollection(HttpServletRequest request, HttpServletResponse response) {
		
		String UserId = String.valueOf( request.getSession().getAttribute("UserId"));
		
		if(UserId!=null&&!"".equals(UserId)){
		String name = request.getParameter("searchValue");
		Collection collection=new Collection();
		collection.setUserid(Integer.parseInt(UserId));
		collection.setSnackName(name);
		        //通用分页Pagebean
				PageBean<Collection> pageBean = new PageBean<Collection>();
				pageBean.setMaxResult(10);
				
				//默认为第一页
				int intPage = 1;
				String currentPage = request.getParameter("currentPage");
				if (currentPage != null && !"".equals(currentPage)) {
					intPage = Integer.parseInt(currentPage);
				}
				pageBean.setCurrent(intPage);
				collectionService.setPageBean(pageBean,collection);
			
				//放入作用域
				request.setAttribute("pageBean", pageBean);
		try {
			request.getRequestDispatcher("app/collection.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
		}
		else{
			try {
				request.getRequestDispatcher("app/login.jsp").forward(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	private void deleteCollection(HttpServletRequest request, HttpServletResponse response) {
		String strId=request.getParameter("id");
		String UserId = String.valueOf(request.getSession().getAttribute("UserId"));
		collectionService.deleteColection(Integer.parseInt(UserId),Integer.parseInt(strId));
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
