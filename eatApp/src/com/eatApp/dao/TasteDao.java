package com.eatApp.dao;

import java.util.List;

import com.eatApp.entity.Taste;

public interface TasteDao {
/**
 * 通过snackid 查到此商品的口味
 * @return
 */
	public List<Taste> getListBySnackId(int snackid);
}
