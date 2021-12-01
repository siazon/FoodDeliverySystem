package com.dal;

import java.sql.*;
/**
 * 
 * 
 * @author Xiasong Chen
 * @date 2021-11-30 23:56:18
 * @version v1.0
 */
public class MysqlUtil {
	private static String jdbcURL = "jdbc:mysql://localhost:3306/lab2?serverTimezone=UTC";
	private static String jdbcUsername = "root";
	private static String jdbcPassword = "root";

	public MysqlUtil() {

	}
	/**
	 * 
	 * @return
	 */
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
