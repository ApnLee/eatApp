package com.eatApp.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.eatApp.entity.Address;
import com.eatApp.entity.Collection;
import com.eatApp.entity.OrderDeatil;
import com.eatApp.entity.Snack;
import com.eatApp.entity.User;
import com.eatApp.service.AddressService;
import com.eatApp.service.CollectionService;
import com.eatApp.service.OrderService;
import com.eatApp.service.SnackService;
import com.eatApp.service.UserService;
import com.eatApp.service.impl.AddressServiceImpl;
import com.eatApp.service.impl.CollectionServiceImpl;
import com.eatApp.service.impl.OrderServiceImpl;
import com.eatApp.service.impl.SnackServiceImpl;
import com.eatApp.service.impl.UserServieceImpl;
import com.eatApp.utils.PageBean;

import net.sf.json.JSONArray;

public class PersonServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	UserService userService = new UserServieceImpl();
	AddressService addressService = new AddressServiceImpl();
	OrderService orderService = new OrderServiceImpl();
	SnackService snackService=new SnackServiceImpl();
	CollectionService collectionService=new CollectionServiceImpl();
	String strId = null;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String method = request.getParameter("method");
		if ("information".equals(method)) {
			information(request, response);
		} else if ("saveInformation".equals(method)) {
			saveInformation(request, response);
		} else if ("UpDatePassWord".equals(method)) {
			UpDatePassWord(request, response);
		} else if ("ToUpDatePassWord".equals(method)) {
			ToUpDatePassWord(request, response);
		} else if ("bindphone".equals(method)) {
			bindphone(request, response);
		} else if ("saveAddress".equals(method)) {
			saveAddress(request, response);
		} else if ("lookAddress".equals(method)) {
			lookAddress(request, response);
		} else if ("deleteAddress".equals(method)) {
			deleteAddress(request, response);
		} else if ("updateAddress".equals(method)) {
			updateAddress(request, response);
		} else if ("setDefaultAddress".equals(method)) {
			setDefaultAddress(request, response);
		} else if ("chageEmail".equals(method)) {
			chageEmial(request, response);
		} else if ("go".equals(method)) {
			go(request, response);
		}else if("loadMore".equals(method)){
			loadMore(request, response);
		}else if ("ajaxSetDefaultAddress".equals(method)) {
			ajaxSetDefaultAddress(request, response);
		}else if ("deleteAddressOnPay".equals(method)) {
			deleteAddressOnPay(request, response);
		}
	}



	private void lookAddress(HttpServletRequest request, HttpServletResponse response) {
		int UserId = (int) request.getSession().getAttribute("UserId");
		List<Address> list = addressService.getAddressListByUserid(UserId);
		request.setAttribute("list", list);
		try {
			request.getRequestDispatcher("app/address.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private void chageEmial(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String userName = (String) request.getSession().getAttribute("UserName");
		User user = userService.getUserByUsername(userName);
		String email = request.getParameter("user-email");
		if (user != null) {
			user.setEmail(email);
			userService.updateUser(user);
			try {
				request.getRequestDispatcher("app/email.jsp").forward(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	private void saveAddress(HttpServletRequest request, HttpServletResponse response) {
		String consignee = request.getParameter("consignee");
		String phone = request.getParameter("phone");
		String province = request.getParameter("s_province");
		String city = request.getParameter("s_city");
		String county = request.getParameter("s_county");
		String address = request.getParameter("address");
		if (strId != null) {
			addressService.delectAddress(Integer.parseInt(strId));
		}
		String userName = (String) request.getSession().getAttribute("UserName");
		User user = userService.getUserByUsername(userName);
		if (user != null) {
			int userId = user.getId();
			Address userAddress = new Address();
			userAddress.setUserid(userId);
			userAddress.setConsignee(consignee);
			userAddress.setPhone(phone);
			userAddress.setProvince(province);
			userAddress.setCity(city);
			userAddress.setCounty(county);
			userAddress.setAddress(address);
			addressService.addAdress(userAddress);
			List<Address> list = addressService.getAddressListByUserid(userId);

			request.setAttribute("list", list);

			try {
				request.getRequestDispatcher("app/address.jsp").forward(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	private void bindphone(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String phone = request.getParameter("user-new-phone");
		User user = userService.getUserByUsername((String) request.getSession().getAttribute("UserName"));
		if (user != null) {
			user.setPhone(phone);
			userService.updateUser(user);
			try {
				request.getRequestDispatcher("/app/bindphone.jsp").forward(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	private void ToUpDatePassWord(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String newPassWord = request.getParameter("user-new-password");
		User user = userService.getUserByUsername((String) request.getSession().getAttribute("UserName"));
		user.setPassword(newPassWord);
		userService.updateUser(user);
		UpDatePassWord(request, response);
	}

	private void UpDatePassWord(HttpServletRequest request, HttpServletResponse response) {
		String userName = (String) request.getSession().getAttribute("UserName");
		String passWord = userService.getUserByUsername(userName).getPassword();
		request.setAttribute("PassWord", passWord);
		try {
			request.getRequestDispatcher("/app/password.jsp").forward(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	private void information(HttpServletRequest request, HttpServletResponse response) {

		// 此username代表注册的账号！ 唯一。

		String username = (String) request.getSession().getAttribute("UserName");
		User user = userService.getUserByUsername(username);
		Date date = user.getBirthday();
		if (user != null) {
			if (date != null && !"".equals(date)) {
				request.setAttribute("userYear", date.getYear() + 1900);
				request.setAttribute("userMonth", date.getMonth() + 1);
				request.setAttribute("userDay", date.getDate());
				System.out.println(date.getDate());
			}
			request.setAttribute("User", user);
			int year = new Date().getYear() + 1900;
			request.setAttribute("year", year);
			try {
				request.getRequestDispatcher("/app/information.jsp").forward(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	private void saveInformation(HttpServletRequest request, HttpServletResponse response) {
		String username = (String) request.getSession().getAttribute("UserName");
		User user = userService.getUserByUsername(username);
		// 获取昵称
		String nickname = request.getParameter("nickname");
		// 获得真实姓名
		String realname = request.getParameter("realname");
		// 性别用数字表示 0代表保密 1代表男 2代表女
		String sex = request.getParameter("radio10");
		// 获取用户提交生日的年份
		String userYear = request.getParameter("userYear");
		// 获取获取用户提交生日的月份
		String userMonth = request.getParameter("userMonth");
		// 获取获取用户提交生日的天
		String userDay = request.getParameter("userDay");
		Date date = new Date();
		date.setYear(Integer.parseInt(userYear) - 1900);
		date.setMonth(Integer.parseInt(userMonth) - 1);
		date.setDate(Integer.parseInt(userDay));
		user.setNickname(nickname);
		user.setRealname(realname);
		user.setSex(Integer.parseInt(sex));
		user.setBirthday(date);
		userService.updateUser(user);
		user = userService.getUserByUsername(username);
		if (user != null) {
			if (date != null && !"".equals(date)) {
				request.setAttribute("userYear", date.getYear() + 1900);
				request.setAttribute("userMonth", date.getMonth() + 1);
				request.setAttribute("userDay", date.getDate());
			}
			request.setAttribute("User", user);
			int year = new Date().getYear() + 1900;
			request.setAttribute("year", year);

			String nickName = userService.getUserByUsername(username).getNickname();
			request.getSession().setAttribute("NickName", nickName);
			try {
				request.getRequestDispatcher("/app/information.jsp").forward(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

		}
	}

	private void deleteAddress(HttpServletRequest request, HttpServletResponse response) {
		String strId = request.getParameter("id");
		addressService.delectAddress(Integer.parseInt(strId));
		lookAddress(request, response);

	}

	// 通过strId编辑后保存 将编辑之前的数据删除

	private void updateAddress(HttpServletRequest request, HttpServletResponse response) {
		strId = request.getParameter("id");
		Address address = addressService.getAddressById(Integer.parseInt(strId));
		request.setAttribute("address", address);
		lookAddress(request, response);
	}

	private void setDefaultAddress(HttpServletRequest request, HttpServletResponse response) {

		int id = Integer.parseInt(request.getParameter("id"));
		String userName = (String) request.getSession().getAttribute("UserName");
		int userid = userService.getUserByUsername(userName).getId();
		addressService.setDefaultAddress(id, userid);
		lookAddress(request, response);
	}

	private void go(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String userName = (String) request.getSession().getAttribute("UserName");
		User user = userService.getUserByUsername(userName);
		List<Integer> status = orderService.getStatusCount(user.getId());
		int statu3 = status.get(2);
		int statu4 = status.get(3);
		int statu5 = status.get(4);
		int statu6 = status.get(5);
		//System.out.println(statu3 + statu4 + statu5 + statu6);
		request.setAttribute("statu3", statu3);
		request.setAttribute("statu4", statu4);
		request.setAttribute("statu5", statu5);
		request.setAttribute("statu6", statu6);
		
		//显示最新商品
		Snack snack=snackService.findNewSnack();
		request.setAttribute("snack", snack);
		//找到销量最高的商品
		Snack snackCount=snackService.findCountSnack();
		request.setAttribute("snackCount", snackCount);
		

		
		if(user!=null){
		Collection collection=new Collection();
		collection.setUserid(user.getId());
		        //通用分页Pagebean
				PageBean<Collection> pageBean = new PageBean<Collection>();
				pageBean.setMaxResult(1);
				
				//默认为第一页
				int intPage = 1;
				String currentPage = request.getParameter("currentPage");
				if (currentPage != null && !"".equals(currentPage)) {
					intPage = Integer.parseInt(currentPage);
				}
				pageBean.setCurrent(intPage);
				collectionService.setPageBean(pageBean,collection);
				if(pageBean.getCurrent()>=pageBean.getTotal()){
					request.setAttribute("flag","到底啦");	
				}else{
					request.setAttribute("flag","更多");
				}
				//放入作用域
				request.setAttribute("pageBean", pageBean);
		try {
			request.getRequestDispatcher("/app/person.jsp").forward(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		}
	}


	private void loadMore(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		PageBean<Collection> pageBean = new PageBean<Collection>();
		pageBean.setMaxResult(1);
		//默认为第一页
		int intPage = 1;
		String currentPage = request.getParameter("currentPage");
		if (currentPage != null && !"".equals(currentPage)) {
			intPage = Integer.parseInt(currentPage);
		}
		pageBean.setCurrent(intPage);
		String userName = (String) request.getSession().getAttribute("UserName");
		User user = userService.getUserByUsername(userName);
		Collection collection=new Collection();
		collection.setUserid(user.getId());
		collectionService.setPageBean(pageBean,collection);
		if(Integer.parseInt(currentPage)>pageBean.getTotal()){
			PrintWriter pw=response.getWriter();
			pw.write("到底啦");
			pw.flush();pw.close();	
		}
		else{
			JSONArray jsonArr = JSONArray.fromObject(pageBean);
		//System.out.println(jsonArr.toString());;
		PrintWriter pw=response.getWriter();
		pw.write(jsonArr.toString());
		pw.flush();pw.close();
	}
		
	}

	
	private void ajaxSetDefaultAddress(HttpServletRequest request, HttpServletResponse response) {
		int id = Integer.parseInt(request.getParameter("addressid"));
		String userName = (String) request.getSession().getAttribute("UserName");
		int userid = userService.getUserByUsername(userName).getId();
		addressService.setDefaultAddress(id, userid);
		
	}

	private void deleteAddressOnPay(HttpServletRequest request, HttpServletResponse response) {
		String strId = request.getParameter("id");
		addressService.delectAddress(Integer.parseInt(strId));
		int UserId = (int) request.getSession().getAttribute("UserId");
		List<Address> list = addressService.getAddressListByUserid(UserId);
		request.setAttribute("list", list);
		try {
			request.getRequestDispatcher("app/pay.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
