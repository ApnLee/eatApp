package com.eatApp.entity;

public class Collection {
private int id;
private int userid;
private int snackid;
private String snackName;
private double price;
private double mktprice;
private String image;
private int totalSales;
private int evaluate;
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public int getUserid() {
	return userid;
}
public void setUserid(int userid) {
	this.userid = userid;
}
public int getSnackid() {
	return snackid;
}
public void setSnackid(int snackid) {
	this.snackid = snackid;
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


}
