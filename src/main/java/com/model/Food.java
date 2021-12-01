package com.model;
/**
 * 
 * 
 * @author Xiasong Chen
 * @date 2021-11-30 23:56:18
 * @version v1.0
 */
public class Food {
	private int id;
	private int group_id;
	private String food_name;
	private double price;
	private int stock;
	private String description;

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Food(int id,int group_id, String food_name, double price, int stock,String description) {
		this.id = id;
		this.group_id=group_id;
		this.food_name = food_name;
		this.price = price;
		this.stock = stock;
		this.description=description;
	}

	public int getGroup_id() {
		return group_id;
	}

	public void setGroup_id(int group_id) {
		this.group_id = group_id;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFood_name() {
		return food_name;
	}

	public void setFood_name(String food_name) {
		this.food_name = food_name;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public int getStock() {
		return stock;
	}

	public void setStock(int stock) {
		this.stock = stock;
	}
}
