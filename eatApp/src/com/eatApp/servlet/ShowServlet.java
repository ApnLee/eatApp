package com.eatApp.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.eatApp.entity.Category;
import com.eatApp.entity.Collection;
import com.eatApp.entity.DetailImage;
import com.eatApp.entity.Order;
import com.eatApp.entity.OrderDeatil;
import com.eatApp.entity.Snack;
import com.eatApp.entity.Taste;
import com.eatApp.entity.User;
import com.eatApp.service.CategoryService;
import com.eatApp.service.CollectionService;
import com.eatApp.service.DetailImageService;
import com.eatApp.service.OrderDeatilService;
import com.eatApp.service.OrderService;
import com.eatApp.service.SnackService;
import com.eatApp.service.TasteService;
import com.eatApp.service.UserService;
import com.eatApp.service.impl.CategoryServiceImpl;
import com.eatApp.service.impl.CollectionServiceImpl;
import com.eatApp.service.impl.DetailImageServiceImpl;
import com.eatApp.service.impl.OrderDeatilServiceImpl;
import com.eatApp.service.impl.OrderServiceImpl;
import com.eatApp.service.impl.SnackServiceImpl;
import com.eatApp.service.impl.TasteServiceImpl;
import com.eatApp.service.impl.UserServieceImpl;
import com.eatApp.utils.PageBean;

import net.sf.json.JSONArray;

/**
 * ��ʾ
 */

public class ShowServlet extends HttpServlet {
	
	//零食
	SnackService snackService = new SnackServiceImpl();
	//分类
	CategoryService categoryService = new CategoryServiceImpl();
	//收藏
	CollectionService collectionService=new CollectionServiceImpl();
	//用户
	UserService userService = new UserServieceImpl();
	//口味
	TasteService tasteService=new TasteServiceImpl();
	//图片
	DetailImageService imageService=new DetailImageServiceImpl();
	//商品详情
	OrderDeatilService detailService=new OrderDeatilServiceImpl();
	//订单
	OrderService orderService=new OrderServiceImpl();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String method = request.getParameter("method");
		if (method.equals("index")) {
			index(request, response);
		}else if(method.equals("search")){
			search(request, response);
		}else if(method.equals("introduction")){
			introduction(request, response);
		}else if(method.equals("clickMore")){
			clickMore(request, response);
		}
	}

	
	private void clickMore(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String snackid = request.getParameter("snackid");
		PageBean<OrderDeatil> pageBean = new PageBean<OrderDeatil>();
		pageBean.setMaxResult(2);
		//默认为第一页
		int intPage = 1;
		String currentPage = request.getParameter("currentPage");
		if (currentPage != null && !"".equals(currentPage)) {
			intPage = Integer.parseInt(currentPage);
		}
		pageBean.setCurrent(intPage);	
		detailService.setPageBean(pageBean,Integer.parseInt(snackid));
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
	}}


	private void introduction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int snackId = 0;
		//获取页面传递过来的参数
		String id = request.getParameter("id");
		
		if (id != null && !"".equals(id)) {
			snackId = Integer.parseInt(id);
		}
		
		//封装
		Snack snack = new Snack();
		snack = snackService.findSnackById(snackId);
		request.setAttribute("snack", snack);
		//查找到此商品的口味
		List<Taste> taste=tasteService.getListBySnackId(snackId);
		request.setAttribute("taste", taste);
		//查找到此商品的图片
		List<DetailImage> image=imageService.findAllBySnackId(snackId);
		request.setAttribute("image", image);
		//商品样品图
		List<DetailImage> sampleImage=imageService.findSampleImage(snackId);
		DetailImage firstImage=sampleImage.get(0);
		request.setAttribute("firstImage", firstImage);
		request.setAttribute("sampleImage", sampleImage);
		
		//足迹
		String userName = (String) request.getSession().getAttribute("UserName");
	    User user=userService.getUserByUsername(userName);
		if(user!=null){
			//如果是不是第一次
			int userid=user.getId();
			String ids = getCookieValue(request,userid+"",id);
			//System.out.println(ids);
			Cookie idCookie = new Cookie(userid+"",ids);
			idCookie.setMaxAge(60*60*24*30);//保存一个月历史记录
			response.addCookie(idCookie);//保存至浏览器
			
			//看了又看 是从足迹中抓取数据
			String[] idsArr=ids.split(",");
			List<Snack> list=new ArrayList<Snack>();
			for (String string : idsArr) {
				if(!"null".equals(string)){
				Snack snacks=snackService.findSnackById(Integer.parseInt(string));
				list.add(snacks);
				}
				}

			//System.out.println("zuji"+list.size());

			//限制看了又看里面的数据 最大是5
			if(list.size()>5){
				List<Snack> newList=new ArrayList<Snack>();
				for(int i=0;i<5;i++){
					newList.add(list.get(i));
				}
				request.setAttribute("list",newList);
			}else{
				request.setAttribute("list",list);
			}
				
		}
		//拿到评论
		List<OrderDeatil> orderDeatilList=detailService.findListByShopId(snackId);
		//好评中评差评数量
		int goodComment=0; int middleComment=0; int badComment=0;
		for (OrderDeatil orderDeatil : orderDeatilList) {
			int level=orderDeatil.getValuationlevel();
			if(level==1){goodComment++;}
			if(level==2){middleComment++;}
			if(level==3){badComment++;}
		}
		request.setAttribute("goodComment",goodComment);
		request.setAttribute("middleComment",middleComment);
		request.setAttribute("badComment",badComment);
		
		        //通用分页Pagebean
				PageBean<OrderDeatil> pageBean = new PageBean<OrderDeatil>();
				pageBean.setMaxResult(2);
				
				//默认为第一页
				int intPage = 1;
				String currentPage = request.getParameter("currentPage");
				if (currentPage != null && !"".equals(currentPage)) {
					intPage = Integer.parseInt(currentPage);
				}
				pageBean.setCurrent(intPage);
				
				detailService.setPageBean(pageBean,snackId);
				if(pageBean.getCurrent()>=pageBean.getTotal()){
					request.setAttribute("flag","到底啦");	
				}else{
					request.setAttribute("flag","点击加载更多");
				}
				//放入作用域
				request.setAttribute("pageBean", pageBean);
		//查询用户此商品是否收藏
		if(user!=null){
	    Collection collection=collectionService.findIsColection(user.getId(),snack.getId());
	    if(collection!=null){
	    	request.setAttribute("collection","取消收藏");
	    	}
	    else{
	    	request.setAttribute("collection","点击收藏");
	    	}
	   }
		
		 else{request.setAttribute("collection","点击收藏");}
		//跳转
		request.getRequestDispatcher("app/introduction.jsp").forward(request, response);
		
		
	}


	private void search(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//获取页面传过来的参数
		String name = request.getParameter("searchValue");
		//System.out.println(1123+name);
		//封装
		Snack snack = new Snack();
	    snack.setSnackName(name);

		
		//通用分页Pagebean
		PageBean<Snack> pageBean = new PageBean<Snack>();
		pageBean.setMaxResult(12);
		
		//默认为第一页
		int intPage = 1;
		
		String currentPage = request.getParameter("currentPage");
		if (currentPage != null && !"".equals(currentPage)) {
			intPage = Integer.parseInt(currentPage);
		}
		//System.out.println("intPage:"+intPage);
		pageBean.setCurrent(intPage);
		snackService.setPageBean(pageBean, snack);
	
		//放入作用域
		request.setAttribute("pageBean", pageBean);
		request.setAttribute("snack", snack);
		//跳转
		request.getRequestDispatcher("app/search.jsp").forward(request, response);
		
	}


	private void index(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		List<Category> cates = categoryService.getFirstCategory();
			
		//放入作用域
		request.setAttribute("cates", cates);
		
		//跳转
		request.getRequestDispatcher("app/index.jsp").forward(request, response);
		
		
	}
	
	
	 public String getCookieValue(HttpServletRequest request,String userid,String id){
		 
		 Cookie[] cookies = request.getCookies(); //获取浏览器cookie
		 Cookie ids = null;  //存储历史商品的，ids 
	 
		 for(Cookie c : cookies){
			 if(c.getName().equals(userid)){
				
				 ids = c; //匹配是否存在历史id cookie
				 //System.out.println("ids");
				 break;
			 }
		 }
		 if(ids==null){
			 return id;//说明是第一次浏览商品
		 }
		 //加入之前试1,2
		 //把字符串 1,2,3 转化成 LinkList集合   
		 String idsValue = ids.getValue(); //1,2,3             得到cookie 里面 存储的   商品  id 集合
		 String[] idsArr =idsValue.split(",");
		 //把数组转换成集合
		 List<String> colls = Arrays.asList(idsArr);
		 
		 LinkedList<String> links = new LinkedList<String>(colls);
		 
		 if(links.size() < 20){ // 1,2
			 if(links.contains(id)){  // id = 
				 links.remove(id);//删除cookie 以存在的id
				 links.addFirst(id); //添加新的在最前面
			 }else{
				 links.addFirst(id); //添加新的在最前面
			 }
		 }else{
			 if(links.contains(id)){ //1,2,3       
				 links.remove(id);//删除cookie 以存在的id
				 links.addFirst(id); //添加新的在最前面
			 }else{
				 links.addFirst(id); //添加新的在最前面   5,  1,2,3   
				 links.removeLast();//删除最后一个
			 }
		 }
		 
		 StringBuilder sb = new StringBuilder();
		 for(String s : links){
			 sb.append(s+",");
		 }
		 
		 //删除最后一个逗号
		 sb = sb.deleteCharAt(sb.length()-1);
		 
		 return sb.toString();
	 }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		doGet(request, response);
	}

}
