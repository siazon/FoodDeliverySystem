package com.dal;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.model.StaffMenuAdjust;
import com.model.User;


public class StaffMenuDAL {

	private String jdbcURL = "jdbc:mysql://localhost:3306/onlinetus?useSSL=false";
	private String jdbcUsername = "root";
	private String jdbcPassword = "$oftwareEngin33ring";
	private String jdbcDriver = "com.mysql.jdbc.Driver";



	final String INSERT_MENU_SQL = "INSERT INTO menu" + "  ( menuCategory,name,description,allergies,price) VALUES "
			+ " (?, ?, ?, ?, ?);";

	final String SELECT_NAME_BY_CATEGORY = "select * from menu where menuCategory =?";
	final String SELECT_ALL_MENU = "select * from menu";
	private static final String DELETE_FOOD_SQL = "delete from menu where menuCategory = ?;";
	private static final String UPDATE_MENU_SQL = "update menu set name = ?, description =?, where group_id = ?, where allergies = ?, where price = ?;";

	public StaffMenuDAL() {

	}

	public static Connection getConnection() {
		Connection connection = null;
		try
		{
			// Load the JConnector Driver
			Class.forName("com.mysql.jdbc.Driver");
			// Specify the DB Name
			String url="jdbc:mysql://localhost:3306/onlinetus";
			// Connect to DB using DB URL, Username and password
			Connection con = DriverManager.getConnection(url, "root", "$oftwareEngin33ring");
			//Create a generic statement which is passed to the TestInternalFrame1
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT * FROM menu");
		}
		catch(Exception e)
		{
			System.out.println("Error: Failed to connect to database\n"+e.getMessage());
		}
		return connection;
	}

	//	insert user
	public void insertMenu(StaffMenuAdjust menu) throws SQLException {
		System.out.println(INSERT_MENU_SQL);
		try(Connection connection = getConnection();

				PreparedStatement preparedStatement = connection.prepareStatement(INSERT_MENU_SQL)) {

			preparedStatement.setString(1, menu.getMenuCategory());
			preparedStatement.setString(2, menu.getItemName());
			preparedStatement.setString(3, menu.getItemDescription());
			preparedStatement.setString(4, menu.getAllergies());
			preparedStatement.setDouble(5, menu.getPrice());
			System.out.println(preparedStatement);
			preparedStatement.executeUpdate();
		}catch (SQLException e) {
			printSQLException(e);
		}
	}

	//	select menu by id

	public StaffMenuAdjust selectMenu(int id){
		StaffMenuAdjust menu = null;
		//		Step 1: Establishing a Connection
		try(Connection connection = getConnection();
				//				Step 2: Create a statement using connection object
				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_NAME_BY_CATEGORY);) {
			preparedStatement.setInt(1,  id);
			System.out.println(preparedStatement);
			//			Step 3: Execute the query or update query
			ResultSet rs = preparedStatement.executeQuery("SELECT * FROM menu");

			//				Process the ResultSet object
			while(rs.next()) {
				String itemName = rs.getString("Item Name: " );

				String itemDescription = rs.getString("Item Description: ");
				String menuCategory = rs.getString("Menu Category: ");
				String allergies = rs.getString("Allergies: ");
				double price = rs.getDouble("Enter Price: ");
				menu = new StaffMenuAdjust(itemName, itemDescription, menuCategory, allergies, price);
			}
		}catch (SQLException e) {
			printSQLException(e);
		}
		return menu;
	}

	//	select all menu
	public List<StaffMenuAdjust> selectAllMenu() {
		List<StaffMenuAdjust> menu = new ArrayList<>();

		//		Step 1: Establish the connection
		try(Connection connection = getConnection();
				//				Step 2: Create a statement using connection object
				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_MENU);) {
			System.out.println(preparedStatement);
			//					Step 3: Execute the query or update query
			ResultSet rs = preparedStatement.executeQuery();

			//					Step4:Process the ResultSet object
			while(rs.next()) {

				String itemName = rs.getString("Item Name: " );
				String menuCategory = rs.getString("Menu Category: ");
				String itemDescription = rs.getString("Item Description: ");
				String allergies = rs.getString("Allergies: ");
				double price = rs.getDouble("Enter Price: ");
				menu.add(new StaffMenuAdjust(itemName,itemDescription, menuCategory, allergies, price));
			}
		}catch (SQLException e) {
			printSQLException(e);
		}
		return menu;
	}


	//	update menu
	public boolean updateMenu(StaffMenuAdjust menu) throws SQLException {
		boolean rowUpdated;
		try (Connection connection = getConnection();
				PreparedStatement statement = connection.prepareStatement(UPDATE_MENU_SQL);) {
			System.out.println("update Menu Item: "+statement);
			statement.setString(0, menu.getMenuCategory());
			statement.setString(0, menu.getItemName());
			statement.setString(0, menu.getItemDescription());
			statement.setString(0, menu.getAllergies());
			statement.setDouble(0, menu.getPrice());

			rowUpdated = statement.executeUpdate() > 0;
		}
		return rowUpdated;
	}

	//	delete menu

	public boolean deleteMenu(int id) throws SQLException {
		boolean rowDeleted;
		try(Connection connection = getConnection();
				PreparedStatement statement = connection.prepareStatement(DELETE_FOOD_SQL);) {
			statement.setInt(1, id);
			rowDeleted = statement.executeUpdate() > 0;
		}
		return rowDeleted;
	}

	private void printSQLException(SQLException ex) {
		for(Throwable e : ex) {
			if (e instanceof SQLException) {
				e.printStackTrace(System.err);
				System.err.println("SQL State: "+ ( (SQLException) e).getSQLState());
				System.err.println("Error Code: "+ ( (SQLException) e).getErrorCode());
				System.err.println("Message: "+ e.getMessage());
				Throwable t = ex.getCause();
				while (t !=null) {
					System.out.println("Cause: " +t);
					t=t.getCause();
				}

			}

		}

	}
}

