package com.eatApp.service.impl;

import java.util.List;

import com.eatApp.dao.LogisticsDAO;
import com.eatApp.dao.impl.LogisticsDAOImpl;
import com.eatApp.entity.Logistics;
import com.eatApp.entity.Snack;
import com.eatApp.service.LogisticsService;
import com.eatApp.utils.PageBean;

public class LogisticsServiceImpl implements LogisticsService {

	LogisticsDAO logisticsDao = new LogisticsDAOImpl();
	@Override
	public void setPageBean(PageBean<Logistics> pageBean, Logistics logistics) {
		System.out.println("current:"+pageBean.getCurrent());
		// 得到零食总记录数
		int totalCount = logisticsDao.getLogisticsCount(logistics).intValue();
		// 赋值给我的PageBean
		pageBean.setTotalCount(totalCount);
		System.out.println("total:"+pageBean.getTotal());
		// 当前页不能大于总页数
		if (pageBean.getCurrent() > pageBean.getTotal()) {
			pageBean.setCurrent(pageBean.getTotal());
		}
		System.out.println("current2:"+pageBean.getCurrent());
		// 当前页不能小于1
		if (pageBean.getCurrent() < 1) {
			pageBean.setCurrent(1);
		}
		//算出开始的条数
		System.out.println("current3:"+pageBean.getCurrent());
		int startIndex = ((pageBean.getCurrent()-1)*pageBean.getMaxResult());
	    System.out.println("startindex:"+startIndex);
		//得到分页的数据
		List<Logistics> datas = logisticsDao.getAllLogistics(logistics, startIndex, pageBean.getMaxResult());
		
		//封装到Pagebean
		pageBean.setDatas(datas);

	}

	@Override
	public Logistics findLogisticsById(int id) {
		// TODO Auto-generated method stub
		return logisticsDao.findLogisticsById(id);
	}

	@Override
	public int addLogistics(Logistics logistics) {
		// TODO Auto-generated method stub
		return logisticsDao.addLogistics(logistics);
	}

	@Override
	public int deleteLogisticsById(int id) {
		// TODO Auto-generated method stub
		return logisticsDao.deleteLogisticsById(id);
	}

	@Override
	public void updateLogistics(Logistics logistics) {
		// TODO Auto-generated method stub
		logisticsDao.updateLogistics(logistics);
	}

}
