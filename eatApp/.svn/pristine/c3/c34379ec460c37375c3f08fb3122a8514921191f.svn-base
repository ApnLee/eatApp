package com.eatApp.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.eatApp.entity.Address;
import com.eatApp.entity.Order;
import com.eatApp.entity.OrderDeatil;
import com.eatApp.entity.Snack;
import com.eatApp.service.AddressService;
import com.eatApp.service.OrderDeatilService;
import com.eatApp.service.OrderService;
import com.eatApp.service.SnackService;
import com.eatApp.service.impl.AddressServiceImpl;
import com.eatApp.service.impl.OrderDeatilServiceImpl;
import com.eatApp.service.impl.OrderServiceImpl;
import com.eatApp.service.impl.SnackServiceImpl;

/**
 * 购物车
 * 
 * @author ApnLee
 *
 */
public class CartServlet extends HttpServlet {

	// 零食
	SnackService snackService = new SnackServiceImpl();
	// 地址
	AddressService addressService = new AddressServiceImpl();
    //订单
	OrderService orderService=new OrderServiceImpl();
	public void doGet(HttpServletRequest request, HttpServletResponse response) {
		String method = request.getParameter("method");
		if (method.equals("putcart")) {
			putcart(request, response);
		} else if (method.equals("clickPutcart")) {
			clickPutcart(request, response);
		} else if (method.equals("removecart")) {
			removecart(request, response);
		} else if (method.equals("topay")) {
			topay(request, response);
		} else if (method.equals("pay")) {
			pay(request, response);
		} else if (method.equals("buildcartAdd")) {
			buildcartAdd(request, response);
		} else if (method.equals("buildcartMin")) {
			buildcartMin(request, response);
		} else if (method.equals("buildcartAll")) {
			buildcartAll(request, response);
		}
	}

	public void removecart(HttpServletRequest request, HttpServletResponse response) {

		String snackId = request.getParameter("snackId");
		Snack snack = snackService.findSnackById(Integer.parseInt(snackId));
        snack.setTaste(request.getParameter("taste"));
		// 获取购物车
		Map<Snack, Integer> sessCart = (Map<Snack, Integer>) request.getSession().getAttribute("cart");
		snack.setStock(snack.getStock() + sessCart.get(snack));
		snackService.updateSnack(snack);
		sessCart.remove(snack);
		request.getSession().setAttribute("cart", sessCart);
		try {
			request.getRequestDispatcher("app/shopcart.jsp").forward(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public void putcart(HttpServletRequest request, HttpServletResponse response) {
		String snackId = request.getParameter("snackId");
		Snack snack = snackService.findSnackById(Integer.parseInt(snackId));
		String taste = request.getParameter("taste");
        snack.setTaste(taste);
		// 获取购物车
		Map<Snack, Integer> sessCart = (Map<Snack, Integer>) request.getSession().getAttribute("cart");

		int stocknum = 1;
		String stockNum = request.getParameter("stockNum");
		if (stockNum != null && !"".equals(stockNum)) {
			stocknum = Integer.parseInt(stockNum);
		}
		snack.setStock(snack.getStock() - stocknum);
		snackService.updateSnack(snack);
		// 购物车是否存在
		if (sessCart == null) {// 购物车不存在
			// Map存储
			sessCart = new HashMap<Snack, Integer>();
			sessCart.put(snack, stocknum);

		} else {// 购物车存在
			if (sessCart.containsKey(snack)) {// 购物车已经包含这个零食
				int oldCon = sessCart.get(snack);
				sessCart.put(snack, oldCon + stocknum);
			} else {
				// 加入购物车
				sessCart.put(snack, stocknum);
			}
		}
		request.getSession().setAttribute("cart", sessCart);

		try

		{
			request.getRequestDispatcher("app/shopcart.jsp").forward(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void clickPutcart(HttpServletRequest request, HttpServletResponse response) {

		String snackId = request.getParameter("snackId");
		Snack snack = snackService.findSnackById(Integer.parseInt(snackId));
		snack.setTaste(request.getParameter("taste"));
		double chajia = 0;
		// 获取购物车
		Map<Snack, Integer> sessCart = (Map<Snack, Integer>) request.getSession().getAttribute("cart");
		int stockNum = Integer.parseInt(request.getParameter("con"));
		chajia = (stockNum - sessCart.get(snack)) * snack.getPrice();
		if (chajia > 0) {
			snack.setStock(snack.getStock() - 1);
		} else {
			snack.setStock(snack.getStock() + 1);
		}
		snackService.updateSnack(snack);
		sessCart.put(snack, stockNum);
		request.getSession().setAttribute("cart", sessCart);
		PrintWriter pw;
		try {
			pw = response.getWriter();
			pw.write(String.valueOf(chajia));
			pw.flush();
			pw.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	private void topay(HttpServletRequest request, HttpServletResponse response) {
		// 获得用户的收货地址
		int UserId = (int) request.getSession().getAttribute("UserId");
		List<Address> list = addressService.getAddressListByUserid(UserId);
		request.setAttribute("list", list);
		try {
			request.getRequestDispatcher("app/pay.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) {

		doGet(request, response);
	}

	private void pay(HttpServletRequest request, HttpServletResponse response) {
		double total=0;
		int count=0;
        List<OrderDeatil> detailList= new ArrayList<OrderDeatil>();
		int addressid = Integer.parseInt(request.getParameter("addressid"));
		Address address = addressService.getAddressById(addressid);
		String ar = address.getProvince() + address.getCity() + address.getCounty() + address.getAddress()
				+ address.getConsignee() + address.getPhone();
		Order order = new Order();
		order.setUserId((int) request.getSession().getAttribute("UserId"));
		order.setAddress(ar);
		order.setOrderdate(new Date());
		// 获取最终购物车
		Map<Snack, Integer> sessCart2 = (Map<Snack, Integer>) request.getSession().getAttribute("fcart");
		for (Entry<Snack, Integer> entry : sessCart2.entrySet()) {  
		   OrderDeatil deatil=new OrderDeatil();
		   deatil.setShopid(entry.getKey().getId());
		   deatil.setShopcount(entry.getValue());
		   deatil.setTaste(entry.getKey().getTaste());
		   total=total+entry.getKey().getPrice()*entry.getValue();
		   detailList.add(deatil);
		   count=count+entry.getValue();
		}  
		order.setShopcount(count);
		order.setTotalprice(total);
		order.setOrderDeatils(detailList);
		orderService.addOrder(order);
		try {
			response.sendRedirect("app/success.jsp");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	private void buildcartAdd(HttpServletRequest request, HttpServletResponse response) {

		// 获取购物车
		Map<Snack, Integer> sessCart = (Map<Snack, Integer>) request.getSession().getAttribute("cart");
		// 获取最终购物车
		Map<Snack, Integer> sessCart2 = (Map<Snack, Integer>) request.getSession().getAttribute("fcart");

		int snackid = Integer.parseInt(request.getParameter("snackId"));
		if (sessCart2 == null) {
			sessCart2 = new HashMap<Snack, Integer>();
		} else {
			Snack snack = snackService.findSnackById(snackid);
			  snack.setTaste(request.getParameter("taste"));
			sessCart2.put(snack, sessCart.get(snack));
		}
		request.getSession().setAttribute("fcart", sessCart2);
	}

	private void buildcartMin(HttpServletRequest request, HttpServletResponse response) {

		// 获取购物车
		Map<Snack, Integer> sessCart = (Map<Snack, Integer>) request.getSession().getAttribute("cart");
		// 获取最终购物车
		Map<Snack, Integer> sessCart2 = (Map<Snack, Integer>) request.getSession().getAttribute("fcart");
		int snackid = Integer.parseInt(request.getParameter("snackId"));
		Snack snack = snackService.findSnackById(snackid);
		snack.setIsCh(1);
		snack.setTaste(request.getParameter("taste"));
		sessCart2.remove(snack);
		request.getSession().setAttribute("fcart", sessCart2);
   
	}

	private void buildcartAll(HttpServletRequest request, HttpServletResponse response) {
		String all=request.getParameter("all");
		// 获取购物车
		Map<Snack, Integer> sessCart = (Map<Snack, Integer>) request.getSession().getAttribute("cart");
		// 获取最终购物车
		Map<Snack, Integer> sessCart2 = (Map<Snack, Integer>) request.getSession().getAttribute("fcart");
		sessCart2=null;
		if ("1".equals(all)) {		
			sessCart2=sessCart;
			for (Entry<Snack, Integer> entry : sessCart.entrySet()) {  
				   OrderDeatil deatil=new OrderDeatil();
				   for (Entry<Snack, Integer> entry2 : sessCart.entrySet()) {  
					   entry2.getKey().setIsCh(1);
					   
					}     
				  
				}  
			
		}
    	request.getSession().setAttribute("fcart", sessCart2);
	}

}
