package com.model;

public class User {
	protected String user_password;
	protected String user_email;
	protected String user_role;
	

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
	
	public User( String email,String password, String role) {
		super();
		this.user_password = password;
		this.user_email = email;
		this.user_role = role;
	}

	
}
