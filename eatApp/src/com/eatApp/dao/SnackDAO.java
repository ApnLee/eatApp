package com.eatApp.dao;

import java.util.List;
import java.util.Map;

import com.eatApp.entity.Snack;

/**
 * ��ʳ��DAO��
 * @author ApnLee
 *
 */

public interface SnackDAO {

	/**
	 * 查询
	 */
	public List<Snack> getAllSnack(Snack snack,int startIndex,int maxResult);
	
	/**
	 * 得到总记录数
	 */
	public Long getSnackCount(Snack snack);
	
	/**
	 * 根据id查找snack
	 */
	public Snack findSnackById(int id);
	
	/**
	 * 添加商品
	 */
	public int addSnack(Snack snack);
	
	/**
	 * 得到所有的snack
	 */
	public List<Snack> findAll();
	
	/**
	 * 根据id删除Snack
	 */
	public int deleteSnackById(int id);
	
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
