package com.eatApp.dao;

import java.util.List;

import com.eatApp.entity.DetailImage;

public interface DetailImageDao {

	/**
	 * 拿到当前商品的所有图片
	 * @param sanckid
	 * @return
	 */
	public List<DetailImage> findAllBySnackId(int snackid);
	/**
	 * 拿到商品样品图
	 * @param snackid
	 * @return
	 */
	public List<DetailImage> findSampleImage(int snackid);
}
