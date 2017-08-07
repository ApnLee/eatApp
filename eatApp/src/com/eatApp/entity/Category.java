package com.eatApp.entity;

import java.util.List;

/**
 * 分类
 * @author ApnLee
 *
 */
public class Category {

	//id
	private int id;
	//分类的名称
	private String categoryName;
	//父id
	private int parentId;
	
	private List<Category> child;
	
	public int getId() {
		return id;
	}
	public List<Category> getChild() {
		return child;
	}
	public void setChild(List<Category> child) {
		this.child = child;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	public int getParentId() {
		return parentId;
	}
	public void setParentId(int parentId) {
		this.parentId = parentId;
	}
	
	
}
