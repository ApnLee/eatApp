package com.eatApp.service.impl;

import java.util.List;
import java.util.Map;

import com.eatApp.dao.SnackDAO;
import com.eatApp.dao.impl.SnackDAOImpl;
import com.eatApp.entity.Snack;
import com.eatApp.service.SnackService;
import com.eatApp.utils.PageBean;

public class SnackServiceImpl implements SnackService {

	SnackDAO snackDao = new SnackDAOImpl();

	@Override
	public void setPageBean(PageBean<Snack> pageBean, Snack snack) {
		System.out.println("current:"+pageBean.getCurrent());
		// 得到零食总记录数
		int totalCount = snackDao.getSnackCount(snack).intValue();
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
		List<Snack> datas = snackDao.getAllSnack(snack, startIndex, pageBean.getMaxResult());
		
		//封装到Pagebean
		pageBean.setDatas(datas);
		
	}

	@Override
	public Snack findSnackById(int id) {

		return snackDao.findSnackById(id);
	}

	@Override
	public int addSnack(Snack snack) {
		
		return snackDao.addSnack(snack);
	}

	@Override
	public List<Snack> findAll() {
		
		return snackDao.findAll();
	}

	@Override
	public void updateSnackCount(int id, int count) {
		
		snackDao.updateSnackCount(id, count);
	}

	@Override
	public void updateEvaluate(int id, int evaluate) {
		
		snackDao.updateEvaluate(id, evaluate);		
	}

	@Override
	public int deleteSnackById(int id) {

		return snackDao.deleteSnackById(id);
	}

	@Override
	public void updateSnack(Snack snack) {
		
		snackDao.updateSnack(snack);
	}

	@Override
	public Snack findNewSnack() {
		
		return snackDao.findNewSnack();
	}

	@Override
	public Snack findCountSnack() {
		
		return snackDao.findCountSnack();
	}
	
	


	

}
