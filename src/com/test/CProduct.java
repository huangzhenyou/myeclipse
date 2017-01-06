package com.test;

public class CProduct {
	public CProduct() {
	}
	public CProduct(int pid, String name, int nums, int price, boolean sale, String provider) {
		this.pid = pid;
		this.name = name;
		this.nums = nums;
		this.price = price;
		this.sale = sale;
		this.provider = provider;
	}
	
	private int pid;
	private String name;
	private int nums;
	private int price;
	private boolean sale;
	private String provider;

	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getNums() {
		return nums;
	}
	public void setNums(int nums) {
		this.nums = nums;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public boolean isSale() {
		return sale;
	}
	public void setSale(boolean sale) {
		this.sale = sale;
	}
	public String getProvider() {
		return provider;
	}
	public void setProvider(String provider) {
		this.provider = provider;
	}
}
