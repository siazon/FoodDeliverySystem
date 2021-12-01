package com.dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.model.*;
/**
 * 
 * 
 * @author Xiasong Chen
 * @date 2021-11-30 23:56:18
 * @version v1.0
 */
public class AddressDAL {

	private final String INSERT_ADDRESS_SQL = "INSERT INTO tb_user_address"
			+ "  (user_email,county,street,address,phone) VALUES " + " (?,?, ?, ?,?);";

	private final String SELECT_ADDRESS_BY_ID = "select * from tb_user_address where address_id =?";
	private final String SELECT_ADDRESS_BY_email = "SELECT * from tb_user_address where user_email=?";
	private final String SELECT_ALL_ADDRESS = "select * from tb_user_address";
	private final String DELETE_ADDRESS_SQL = "delete from tb_user_address where address_id = ?;";
	private static final String UPDATE_ADDRESS_SQL = "update tb_user_address set user_email= ?,county= ?,street= ?,address= ?, phone =? where address_id = ?;";

	public AddressDAL() {
	}

	/**
	 * 
	 * 
	 * @param address
	 * @throws SQLException
	 */
	public void insertAddress(UserAddress address) throws SQLException {
		System.out.println(INSERT_ADDRESS_SQL);
		// try-with-resource statement will auto close the connection.
		try (Connection connection = MysqlUtil.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(INSERT_ADDRESS_SQL)) {
			preparedStatement.setString(1, address.getUser_email());
			preparedStatement.setString(2, address.getCounty());
			preparedStatement.setString(3, address.getStreet());
			preparedStatement.setString(4, address.getAddress());
			preparedStatement.setString(5, address.getPhone());
			System.out.println(preparedStatement);
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			printSQLException(e);
		}
	}

	/**
	 * 
	 * @param address_id
	 * @return address
	 */
	public UserAddress selectAddress(int address_id) {
		UserAddress _address = null;
		// Step 1: Establishing a Connection
		try (Connection connection = MysqlUtil.getConnection();
				// Step 2:Create a statement using connection object
				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ADDRESS_BY_ID);) {
			preparedStatement.setInt(1, address_id);
			System.out.println(preparedStatement);
			// Step 3: Execute the query or update query
			ResultSet rs = preparedStatement.executeQuery();

			// Step 4: Process the ResultSet object.
			while (rs.next()) {
				int id = rs.getInt("address_id");
				String email = rs.getString("user_email");
				String county = rs.getString("county");
				String street = rs.getString("street");
				String address = rs.getString("address");
				String phone = rs.getString("phone");
				_address = new UserAddress(id, email, county, street, address, phone);
			}
		} catch (SQLException e) {
			printSQLException(e);
		}
		return _address;
	}

	/**
	 * 
	 * @param user_email
	 * @return address list
	 */
	public List<UserAddress> selectAdderss(String user_email) {
		List<UserAddress> addresss = new ArrayList<>();
		// Step 1: Establishing a Connection
		try (Connection connection = MysqlUtil.getConnection();
				// Step 2:Create a statement using connection object
				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ADDRESS_BY_email);) {
			preparedStatement.setString(1, user_email);
			System.out.println(preparedStatement);
			// Step 3: Execute the query or update query
			ResultSet rs = preparedStatement.executeQuery();

			// Step 4: Process the ResultSet object.
			while (rs.next()) {
				int id = rs.getInt("address_id");
				String email = rs.getString("user_email");
				String county = rs.getString("county");
				String street = rs.getString("street");
				String address = rs.getString("address");
				String phone = rs.getString("phone");
				addresss.add(new UserAddress(id, email, county, street, address, phone));
			}
		} catch (SQLException e) {
			printSQLException(e);
		}
		return addresss;
	}

	/**
	 * 
	 * @return address list
	 */
	public List<UserAddress> selectAllAddress() {

		// using try-with-resources to avoid closing resources (boiler plate code)
		List<UserAddress> addresss = new ArrayList<>();
		// Step 1: Establishing a Connection
		try (Connection connection = MysqlUtil.getConnection();

				// Step 2:Create a statement using connection object
				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_ADDRESS);) {
			System.out.println(preparedStatement);
			// Step 3: Execute the query or update query
			ResultSet rs = preparedStatement.executeQuery();

			// Step 4: Process the ResultSet object.
			while (rs.next()) {
				int id = rs.getInt("address_id");
				String user_email = rs.getString("user_email");
				String county = rs.getString("county");
				String street = rs.getString("street");
				String address = rs.getString("address");
				String phone = rs.getString("phone");
				addresss.add(new UserAddress(id, user_email, county, street, address, phone));
			}
		} catch (SQLException e) {
			printSQLException(e);
		}
		return addresss;
	}

	/**
	 * 
	 * @param id
	 * @return
	 * @throws SQLException
	 */
	public boolean deleteAddress(int id) throws SQLException {
		boolean rowDeleted;
		try (Connection connection = MysqlUtil.getConnection();
				PreparedStatement statement = connection.prepareStatement(DELETE_ADDRESS_SQL);) {
			statement.setInt(1, id);
			rowDeleted = statement.executeUpdate() > 0;
		}
		return rowDeleted;
	}

	/**
	 * 
	 * 
	 * @param address
	 * @return
	 * @throws SQLException
	 */
	public boolean updateAddress(UserAddress address) throws SQLException {
		boolean rowUpdated;
		try (Connection connection = MysqlUtil.getConnection();
				PreparedStatement statement = connection.prepareStatement(UPDATE_ADDRESS_SQL);) {
			statement.setString(1, address.getUser_email());
			statement.setString(2, address.getCounty());
			statement.setString(3, address.getStreet());
			statement.setString(4, address.getAddress());
			statement.setString(5, address.getPhone());
			statement.setInt(6, address.getAddress_id());

			rowUpdated = statement.executeUpdate() > 0;
		}
		return rowUpdated;
	}

	/**
	 * 
	 * @param ex
	 */
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
