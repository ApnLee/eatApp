package com.eatApp.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.eatApp.entity.Snack;
import com.eatApp.entity.User;
import com.eatApp.service.SnackService;
import com.eatApp.service.UserService;
import com.eatApp.service.impl.SnackServiceImpl;
import com.eatApp.service.impl.UserServieceImpl;

public class FootServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	UserService userService = new UserServieceImpl();
	SnackService snackService = new SnackServiceImpl();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String method=request.getParameter("method");
		if("showFoot".equals(method)){
			showFoot(request,response);
		}else if("deleteFood".equals(method)){
			deleteFood(request,response);
		}
	}


	private void showFoot(HttpServletRequest request, HttpServletResponse response) {
		String userName = (String) request.getSession().getAttribute("UserName");
	    User user=userService.getUserByUsername(userName);
		if(user!=null){
			Cookie[] cookies=request.getCookies();
			String[] idsArr = null;
			if(cookies!=null){
				for (Cookie cookie : cookies) {
					if(cookie.getName().equals((user.getId()+""))){
						if(!"".equals(cookie.getValue())&&null!=cookie.getValue()){
						idsArr = cookie.getValue().split(",");
						System.out.println("idsArr:"+idsArr.length);
						break;
						}
					}
				}
			}else{
				request.setAttribute("tag","您还没有足迹，快去逛逛吧~");
			}
			
		   if(idsArr!= null){
			List<Snack> list=new ArrayList<Snack>();
			for (String string : idsArr) {
				if(!"null".equals(string)){
				Snack snack=snackService.findSnackById(Integer.parseInt(string));
				System.out.println(string+snack.getSnackName());
				list.add(snack);
				}
				}
			request.setAttribute("list",list);
		}else{
			request.setAttribute("tag","您还没有足迹，快去逛逛吧~");
		}
		   try {
				request.getRequestDispatcher("app/foot.jsp").forward(request, response);
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

	
	private void deleteFood(HttpServletRequest request, HttpServletResponse response) {
		String userName = (String) request.getSession().getAttribute("UserName");
	    User user=userService.getUserByUsername(userName);
		String id=request.getParameter("id");
		Cookie[] cookies=request.getCookies();
		String[] idsArr = null;
		if(cookies!=null){
			for (Cookie cookie : cookies) {
				if(cookie.getName().equals(String.valueOf(user.getId()))){
					idsArr = cookie.getValue().split(",");
					break;
				}
			}
			String footId="";
				for (String string : idsArr) {
					if(string.equals(id)){
					continue;
					}
					footId+=string+",";			
	}
				//有可能只有一个足迹 并且要清楚的情况
			if(!footId.equals("")){
		
			StringBuilder sb = new StringBuilder(footId);
			 sb = sb.deleteCharAt(sb.length()-1);	 
			 footId=sb.toString();
			 System.out.println("footid:"+footId);
			 Cookie idCookie = new Cookie(String.valueOf(user.getId()),footId);
				idCookie.setMaxAge(60*60*24*30);//保存一个月历史记录
				response.addCookie(idCookie);//保存至浏览器
			 } else{
				 Cookie idCookie = new Cookie(String.valueOf(user.getId()),"");
				 idCookie.setMaxAge(60*60*24*30);//保存一个月历史记录
					response.addCookie(idCookie);//保存至浏览器
			 }
			showFoot(request,response);
	}
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
