package com.eatApp.service;

import java.util.List;

import com.eatApp.entity.Collection;
import com.eatApp.utils.PageBean;

public interface CollectionService {

	/**
	 *增加收藏一条数据 
	 */
	public void addCollection(Collection collcetion);

  /**
	* 通过userid和snackid查询 此用户是否收藏此商品
    */
	public Collection findIsColection(int userid,int sanckid);
	
	/**
	 * 通过userid查询到 此用户收藏的所有商品
	 */
	public List<Collection> findListByUserId(int userid);
	
	/**
  	 * 封装分页的信息
  	 * @param pageBean
  	 */
  	public void setPageBean(PageBean<Collection> pageBean, Collection collection);	
  	
    public Long getCollectionCount(Collection collection);
    
    /**
	 * 通过userid和snackid删除一条收藏记录
	 */
	public void deleteColection(int userid,int snackid);
}
