package com.model;

public class User {
	protected int user_id;
	protected String user_name;
	protected String user_password;
	protected String user_email;
	protected String user_role;
	
	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getUser_password() {
		return user_password;
	}

	public void setUser_password(String user_password) {
		this.user_password = user_password;
	}

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	public String getUser_role() {
		return user_role;
	}

	public void setUser_role(String user_role) {
		this.user_role = user_role;
	}

	public User() {
	}
	
	public User(int id, String name, String email,String password, String role) {
		super();
		this.user_id = id;
		this.user_name = name;
		this.user_password = name;
		this.user_email = email;
		this.user_role = role;
	}

	
}
