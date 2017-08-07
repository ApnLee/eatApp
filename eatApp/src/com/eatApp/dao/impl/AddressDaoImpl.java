package com.eatApp.dao.impl;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.eatApp.dao.AddressDao;
import com.eatApp.entity.Address;
import com.eatApp.utils.ComPoolUtil;

public class AddressDaoImpl implements AddressDao{

	@Override
	public void addAdress(Address address) {
		
		try {
			ComPoolUtil.getQueryRunner().update("insert into t_address(userid,consignee,phone,province,city,county,address) values (?,?,?,?,?,?,?)",address.getUserid(),address.getConsignee(),address.getPhone(),address.getProvince(),address.getCity(),address.getCounty(),address.getAddress());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public List<Address> getAddressListByUserid(int userid) {
		List<Address> address=null;
		try {
			address=ComPoolUtil.getQueryRunner().query("select * from t_address where userid=?",
					new BeanListHandler<Address>(Address.class)
					,userid );
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
				
		return address;
	}

	@Override
	public void delectAddress(int id) {
		
		try {
			ComPoolUtil.getQueryRunner().update("delete from t_address where id=?",id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public Address getAddressById(int id) {
		
		Address address=null; 
		try {
		address=ComPoolUtil.getQueryRunner().query("select * from t_address where id=?",
					new BeanHandler<Address>(Address.class),
					id
					);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return address;
	}

	@Override
	public void setDefaultAddress(int id,int userid) {
		try {
			ComPoolUtil.getQueryRunner().update("update  t_address set isdefault=? where isdefault=? and userid=? ",0,1,userid);
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		
		try {
			ComPoolUtil.getQueryRunner().update("update t_address set isdefault=? where id=?",1,id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
