package com.eatApp.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.eatApp.entity.User;
import com.eatApp.service.UserService;
import com.eatApp.service.impl.UserServieceImpl;

public class LoginServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	UserService userService = new UserServieceImpl();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String method = request.getParameter("method");
		if (method.equals("skip")) {
			skip(request, response);
		} else if (method.equals("login")) {
			login(request, response);
		}
	}

	public void login(HttpServletRequest request, HttpServletResponse response) {


		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String remember = request.getParameter("remember-me");
		Cookie cookie1 = null;
		Cookie cookie2 = null;
		System.out.println(username + password + remember);
		if (remember != null) {
			cookie1 = new Cookie("username", username);
			cookie2 = new Cookie("password", password);
			cookie1.setPath("/eatApp");
			cookie2.setPath("/eatApp");
			cookie1.setMaxAge(60 * 60 * 24 * 30);
			cookie2.setMaxAge(60 * 60 * 24 * 30);
			System.out.println("cookie");
		}
		int judgeNum = userService.LoginService(username, password);
		if (judgeNum == 1) {
			if (cookie1 != null) {
				response.addCookie(cookie1);
			}
			if (cookie2 != null) {
				response.addCookie(cookie2);
			}
			try {
				String nickName=userService.getUserByUsername(username).getNickname();
				request.getSession().setAttribute("NickName", nickName);
				request.getSession().setAttribute("UserName", username);
				String userName = (String) request.getSession().getAttribute("UserName");
			    User user=userService.getUserByUsername(userName);
			    request.getSession().setAttribute("UserId", user.getId());
				request.getRequestDispatcher("/app/welcome.jsp").forward(request, response);
			} catch (Exception e) {

				e.printStackTrace();
			}
		} else if (judgeNum == 2) {

			request.setAttribute("tip", "用户名不存在");
			try {
				request.getRequestDispatcher("/app/skip.jsp").forward(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

		}

		else {
			request.setAttribute("user", username);
			request.setAttribute("tip", "密码错误！");
			try {
				request.getRequestDispatcher("/app/skip.jsp").forward(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

		}
	}

	private void skip(HttpServletRequest request, HttpServletResponse response) {

		String username = "";
		String password = "";
		
		Cookie[] cookies = request.getCookies();
		for (int i = 0; i < cookies.length; i++) {
			if ("username".equals(cookies[i].getName())) {
				username = cookies[i].getValue();
				request.setAttribute("username", username);
			} else if ("password".equals(cookies[i].getName())) {
				password = cookies[i].getValue();
				request.setAttribute("password", password);
			}
		}
		try {
			request.getRequestDispatcher("/app/skip.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
