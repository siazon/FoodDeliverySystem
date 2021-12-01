package com.model;
/**
 * 
 * 
 * @author Xiasong Chen
 * @date 2021-11-30 23:56:18
 * @version v1.0
 */
public class UserAddress {
	
	private int address_id;
	private String user_email;
	private String county;
	private String street;
	private String address;
	private String phone;
	
	public UserAddress(int addressId,String user_email,String county,String street,String address,String phone)
	{
		this.address_id=addressId;
		this.user_email=user_email;
		this.county=county;
		this.street=street;
		this.address=address;
		this.phone=phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public int getAddress_id() {
		return address_id;
	}
	public void setAddress_id(int address_id) {
		this.address_id = address_id;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public String getCounty() {
		return county;
	}
	public void setCounty(String county) {
		this.county = county;
	}
	public String getStreet() {
		return street;
	}
	public void setStreet(String street) {
		this.street = street;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
}
