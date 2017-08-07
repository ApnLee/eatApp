package com.eatApp.service.impl;

import java.util.List;

import com.eatApp.dao.DetailImageDao;
import com.eatApp.dao.impl.DetailImageDaoImpl;
import com.eatApp.entity.DetailImage;
import com.eatApp.service.DetailImageService;

public class DetailImageServiceImpl implements DetailImageService{
	DetailImageDao imageDao=new DetailImageDaoImpl();
	@Override
	public List<DetailImage> findAllBySnackId(int snackid) {
		// TODO Auto-generated method stub
		return imageDao.findAllBySnackId(snackid);
	}
	@Override
	public List<DetailImage> findSampleImage(int snackid) {
		
		return imageDao.findSampleImage(snackid);
	}

}
