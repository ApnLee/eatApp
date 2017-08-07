package com.eatApp.utils;

import java.util.List;

/**
 * 通用的分页
 * 
 * @author 蔺凯龙
 * @param <T>
 *
 */
public class PageBean<T> {
	/** 当前页 */
	private int current;
	/** 总页数 */
	private int total;
	/** 每页显示多少条 */
	private int maxResult;
	/** 分页的数据 */
	private List<T> datas;
	/** 数据总条数 */
	private int totalCount;
	/** url */
	private String url;

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public int getCurrent() {
		return current;
	}

	public void setCurrent(int current) {
		this.current = current;
	}

	public int getTotal() {
		// 根据总记录数计算出总页数
		return this.getTotalCount() % this.maxResult == 0 ? this.getTotalCount() / this.maxResult
				: this.getTotalCount() / this.maxResult + 1;
	}

	public int getMaxResult() {
		return maxResult;
	}

	public void setMaxResult(int maxResult) {
		this.maxResult = maxResult;
	}

	public List<T> getDatas() {
		return datas;
	}

	public void setDatas(List<T> datas) {
		this.datas = datas;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public PageBean() {
		super();
		// TODO Auto-generated constructor stub
	}

}
