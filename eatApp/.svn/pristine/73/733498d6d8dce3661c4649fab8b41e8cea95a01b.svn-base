package com.eatApp.service.impl;

import java.util.List;

import com.eatApp.dao.CollectionDao;
import com.eatApp.dao.impl.CollectionDaoImpl;
import com.eatApp.entity.Collection;
import com.eatApp.service.CollectionService;
import com.eatApp.utils.PageBean;

public class CollectionServiceImpl implements CollectionService {

	CollectionDao collectionDao=new CollectionDaoImpl();
	@Override
	public void addCollection(Collection collcetion) {
		
		collectionDao.addCollection(collcetion);
	}
	@Override
	public Collection findIsColection(int userid, int sanckid) {
		
		return collectionDao.findIsColection(userid, sanckid);
	}
	@Override
	public List<Collection> findListByUserId(int userid) {

		return collectionDao.findListByUserId(userid);
	}
	@Override
	public Long getCollectionCount(Collection collection) {
		return collectionDao.getCollectionCount(collection);
	}
	@Override
	public void setPageBean(PageBean<Collection> pageBean, Collection collection) {
		 int count = this.getCollectionCount(collection).intValue();
			
			pageBean.setTotalCount(count);
			
			//当前页不能大于总页数
			if(pageBean.getCurrent() > pageBean.getTotal()){
				pageBean.setCurrent(pageBean.getTotal());
			}
			
			//当前页不能小于1
			if(pageBean.getCurrent() < 1){
				pageBean.setCurrent(1);
			}
			
			
			//算出开始的条数
			int startIndex = (pageBean.getCurrent() - 1) * pageBean.getMaxResult();
			
			//得到分页的数据
			List<Collection> foods = collectionDao.getCollectionByStartPage(collection, startIndex, pageBean.getMaxResult());
			
			//封装到pageBean
			pageBean.setDatas(foods);

		
	}
	@Override
	public void deleteColection(int userid, int snackid) {
		collectionDao.deleteColection(userid, snackid);
	}
	

}
