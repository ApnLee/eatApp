package com.eatApp.entity;
/**
 * 口味
 * @author ApnLee
 *
 */
public class Taste {

	//id
	private int id;
	private int snackid;
	//名称
	private String name;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getSnackid() {
		return snackid;
	}
	public void setSnackid(int snackid) {
		this.snackid = snackid;
	}
	
	
}
