package com.eatApp.dao;

import java.util.List;

import com.eatApp.entity.Logistics;
import com.eatApp.entity.Snack;

public interface LogisticsDAO {


	/**
	 * 查询
	 */
	public List<Logistics> getAllLogistics(Logistics logistics,int startIndex,int maxResult);
	
	/**
	 * 得到总记录数
	 */
	public Long getLogisticsCount(Logistics logistics);
	
	/**
	 * 根据id查找snack
	 */
	public Logistics findLogisticsById(int id);
	
	/**
	 * 添加商品
	 */
	public int addLogistics(Logistics logistics);

	/**
	 * 根据id删除Snack
	 */
	public int deleteLogisticsById(int id);
	
	/**
	 * 更新snack
	 */
	public void updateLogistics(Logistics logistics);
}
