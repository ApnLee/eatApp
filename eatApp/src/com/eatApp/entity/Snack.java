package com.eatApp.entity;

/**
 * 
 * @author ApnLee
 *
 */
public class Snack {
	
	//零食id
	private int id;
	//零食的名称
	private String snackName;
	//零食的促销价
	private double price;
	//零食的原价
	private double mktprice;
	//零食的图片
	private String image;
	//总销量
	private int totalSales;
	//评价
	private int evaluate;
	//库存
	private int stock;

    private String taste;
	//产品类型
	private String type;
	//原料产地
	private String materialArea;
	//产地
	private String productionArea;
	//配料表
	private String dosing;
	//产品规格
	private int weight;
	//保质期
	private String expirationDate;
	//储存方法
	private String storeMethod;
	//食用方法
	private String edibleMethod;
	//是否被选中
	private int isCh;
	
	
	public int getIsCh() {
		return isCh;
	}
	public void setIsCh(int isCh) {
		this.isCh = isCh;
	}
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getSnackName() {
		return snackName;
	}
	public void setSnackName(String snackName) {
		this.snackName = snackName;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public double getMktprice() {
		return mktprice;
	}
	public void setMktprice(double mktprice) {
		this.mktprice = mktprice;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public int getTotalSales() {
		return totalSales;
	}
	public void setTotalSales(int totalSales) {
		this.totalSales = totalSales;
	}
	public int getEvaluate() {
		return evaluate;
	}
	public void setEvaluate(int evaluate) {
		this.evaluate = evaluate;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getMaterialArea() {
		return materialArea;
	}
	public void setMaterialArea(String materialArea) {
		this.materialArea = materialArea;
	}
	public String getProductionArea() {
		return productionArea;
	}
	public void setProductionArea(String productionArea) {
		this.productionArea = productionArea;
	}
	public String getDosing() {
		return dosing;
	}
	public void setDosing(String dosing) {
		this.dosing = dosing;
	}
	public int getWeight() {
		return weight;
	}
	public void setWeight(int weight) {
		this.weight = weight;
	}
	public String getExpirationDate() {
		return expirationDate;
	}
	public void setExpirationDate(String expirationDate) {
		this.expirationDate = expirationDate;
	}
	public String getStoreMethod() {
		return storeMethod;
	}
	public void setStoreMethod(String storeMethod) {
		this.storeMethod = storeMethod;
	}
	public String getEdibleMethod() {
		return edibleMethod;
	}
	public void setEdibleMethod(String edibleMethod) {
		this.edibleMethod = edibleMethod;
	}
	public String getTaste() {
		return taste;
	}
	public void setTaste(String taste) {
		this.taste = taste;
	}
	
	@Override
	public int hashCode() {
		// TODO Auto-generated method stub
		return this.id;
	}
	@Override
	public boolean equals(Object arg0) {
		Snack snack=(Snack) arg0;
		return this.taste.equals(snack.getTaste());
	}
	
}
