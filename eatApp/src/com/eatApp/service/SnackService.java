package com.eatApp.service;

import java.util.List;
import java.util.Map;

import com.eatApp.entity.Snack;
import com.eatApp.utils.PageBean;

public interface SnackService {

	/**
	 * 查询
	 */
	public void setPageBean(PageBean<Snack> pageBean,Snack snack);
	
	/**
	 * 根据id查找snack
	 */
	public Snack findSnackById(int id);
	
	/**
	 * 根据id删除Snack
	 */
	public int deleteSnackById(int id);
	
	/**
	 * 添加商品
	 */
	public int addSnack(Snack snack);
	
	/**
	 * 得到所有的snack
	 */
	public List<Snack> findAll();
	 /**
	  * 通过shopId找到 Snack更改当前销量
	  */
	 public void updateSnackCount(int id,int count);
	 /**
	 * 通过shopid 增加 评价数量
	 */
	public void updateEvaluate(int id,int evaluate);
	/**
	 * 更新snack
	 */
	public void updateSnack(Snack snack);
	
	/**
	 * 查找到snack中最新的一条记录
	 */
	public Snack findNewSnack();
	
	/**
	 * 查找到snack中销量最高的一条记录
	 */
	public Snack findCountSnack();
}
