package com.eatApp.service;

import java.util.List;

import com.eatApp.entity.Address;

public interface AddressService {

	/**
	 * address表中添加一条数据
	 */
	public void addAdress(Address address);
	
	/**
	 * 根据userId从address中取出一组数据
	 */
	
	public List<Address> getAddressListByUserid(int userid);
	/**
	 * 通过id删除一条数据  
	 */
	public void delectAddress(int id);
	/**
	 * 通过id查询一条记录
	 */
	public Address getAddressById(int id);
	/**
	 * 通过id更改为默认地址 1代表 默认 
	 */
	public void setDefaultAddress(int id,int userid);
	
}
