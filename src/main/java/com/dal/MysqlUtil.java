package com.dal;

import java.sql.*;

public class MysqlUtil {
	private static String jdbcURL = "jdbc:mysql://localhost:3306/lab2?serverTimezone=UTC";
	private static String jdbcUsername = "root";
	private static String jdbcPassword = "root";

	public MysqlUtil() {

	}

	public static Connection getConnection() {
		Connection connection = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return connection;
	}
}
