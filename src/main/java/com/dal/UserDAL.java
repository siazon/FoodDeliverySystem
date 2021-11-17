package com.dal;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.model.User;

public class UserDAL {

	private final String INSERT_USERS_SQL = "INSERT INTO tb_user" + "  ( user_email,user_password,user_role) VALUES "
			+ " (?, ?, ?);";

	private final String SELECT_UER_BY_EMAIL = "select * from tb_user where user_email =?";
	private final String SELECT_ALL_EMPLOYEES = "select * from tb_user where user_role <> 'Customer'";
	private final String SELECT_ALL_USERS = "select * from tb_user";
	private final String DELETE_USERS_SQL = "delete from tb_user where user_email = ?;";
	private static final String UPDATE_USERS_SQL = "update tb_user set user_name = ?,user_phone = ?,user_status = ?, user_role =? where user_email = ?;";

	public String insertUser(User user) throws SQLException {
		System.out.println(INSERT_USERS_SQL);
		User user2 = selectUser(user.getUser_email());
		if (user2 != null) {
			return "Eamil is exist";
		}
		// try-with-resource statement will auto close the connection.
		try (Connection connection = MysqlUtil.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USERS_SQL)) {
			preparedStatement.setString(1, user.getUser_email());
			preparedStatement.setString(2, user.getUser_password());
			preparedStatement.setString(3, user.getUser_role());
			System.out.println(preparedStatement);
			int a = preparedStatement.executeUpdate();
			if (a > 0)
				return "succeed";
		} catch (SQLException e) {
			printSQLException(e);
		}
		return "unknown error ";
	}

	public User selectUser(String eamil) {
		User user = null;
		// Step 1: Establishing a Connection
		try (Connection connection = MysqlUtil.getConnection();
				// Step 2:Create a statement using connection object
				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_UER_BY_EMAIL);) {
			preparedStatement.setString(1, eamil);
			System.out.println(preparedStatement);
			// Step 3: Execute the query or update query
			ResultSet rs = preparedStatement.executeQuery();

			// Step 4: Process the ResultSet object.
			while (rs.next()) {
				String email = rs.getString("user_email");
				String pwd = rs.getString("user_password");
				String name = rs.getString("user_name");
				String phone = rs.getString("user_phone");
				String status = rs.getString("user_status");
				String role = rs.getString("user_role");
				user = new User( email,pwd, name,phone,status,role);
			}
		} catch (SQLException e) {
			printSQLException(e);
		}
		return user;
	}

	public List<User> selectAllUsers() {

		// using try-with-resources to avoid closing resources (boiler plate code)
		List<User> users = new ArrayList<>();
		// Step 1: Establishing a Connection
		try (Connection connection = MysqlUtil.getConnection();

				// Step 2:Create a statement using connection object
				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_USERS);) {
			System.out.println(preparedStatement);
			// Step 3: Execute the query or update query
			ResultSet rs = preparedStatement.executeQuery();

			// Step 4: Process the ResultSet object.
			while (rs.next()) {
				int id = rs.getInt("id");
				String name = rs.getString("name");
				String email = rs.getString("email");
				String country = rs.getString("country");
				// users.add(new User(id, name, email, country));
			}
		} catch (SQLException e) {
			printSQLException(e);
		}
		return users;
	}
	
	public List<User> selectAllEmployee() {

		// using try-with-resources to avoid closing resources (boiler plate code)
		List<User> users = new ArrayList<>();
		// Step 1: Establishing a Connection
		try (Connection connection = MysqlUtil.getConnection();

				// Step 2:Create a statement using connection object
				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_EMPLOYEES);) {
			System.out.println(preparedStatement);
			// Step 3: Execute the query or update query
			ResultSet rs = preparedStatement.executeQuery();

			// Step 4: Process the ResultSet object.
			while (rs.next()) {
				String email = rs.getString("user_email");
				String user_password = rs.getString("user_password");
				String name = rs.getString("user_name");
				String phone = rs.getString("user_phone");
				String status = rs.getString("user_status");
				String role = rs.getString("user_role");
				 users.add(new User( email,user_password, name,phone,status,role));
			}
		} catch (SQLException e) {
			printSQLException(e);
		}
		return users;
	}

	public boolean deleteUser(String email) throws SQLException {
		boolean rowDeleted;
		try (Connection connection = MysqlUtil.getConnection();
				PreparedStatement statement = connection.prepareStatement(DELETE_USERS_SQL);) {
			statement.setString(1, email);
			rowDeleted = statement.executeUpdate() > 0;
		}
		return rowDeleted;
	}
//can not update password, create a separate method to change password
	public boolean updateUser(User user) throws SQLException {
		boolean rowUpdated;
		try (Connection connection = MysqlUtil.getConnection();
				PreparedStatement statement = connection.prepareStatement(UPDATE_USERS_SQL);) {
			statement.setString(1, user.getUser_name());
			statement.setString(2, user.getUser_phone());
			statement.setString(3, user.getUser_status());
			statement.setString(4, user.getUser_role());
			statement.setString(5, user.getUser_email());

			rowUpdated = statement.executeUpdate() > 0;
		}
		return rowUpdated;
	}

	private void printSQLException(SQLException ex) {
		for (Throwable e : ex) {
			if (e instanceof SQLException) {
				e.printStackTrace(System.err);
				System.err.println("SQLState: " + ((SQLException) e).getSQLState());
				System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
				System.err.println("Message: " + e.getMessage());
				Throwable t = ex.getCause();
				while (t != null) {
					System.out.println("Cause: " + t);
					t = t.getCause();
				}
			}
		}
	}
}