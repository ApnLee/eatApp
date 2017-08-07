package com.eatApp.service.impl;

import java.util.List;

import com.eatApp.dao.AddressDao;
import com.eatApp.dao.impl.AddressDaoImpl;
import com.eatApp.entity.Address;
import com.eatApp.service.AddressService;

public class AddressServiceImpl implements AddressService  {

	AddressDao addressDao=new AddressDaoImpl();
	
	@Override
	public void addAdress(Address address) {
		addressDao.addAdress(address);
		
	}

	@Override
	public List<Address> getAddressListByUserid(int userid) {
		return addressDao.getAddressListByUserid(userid);
	}

	@Override
	public void delectAddress(int id) {
  
		addressDao.delectAddress(id);
	}

	@Override
	public Address getAddressById(int id) {
		
		return addressDao.getAddressById(id);
	}

	@Override
	public void setDefaultAddress(int id ,int userid) {
	 
		addressDao.setDefaultAddress(id,userid);
		
	}

}
