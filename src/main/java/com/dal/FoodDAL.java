package com.dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.model.*;


public class FoodDAL {


	private  final String INSERT_FOOD_SQL = "INSERT INTO food" + "  (group_id,food_name,price,stock,description) VALUES "
			+ " (?,?,?,?,?);";

	private  final String SELECT_FOOD_BY_ID = "select * from food where id =?";
	private  final String SELECT_FOOD_BY_GROUP_ID = "SELECT * from food where group_id=?";
	private  final String SELECT_ALL_FOOD = "select * from food";
	private  final String DELETE_FOOD_SQL = "delete from food where id = ?;";
	private static final String UPDATE_FOOD_SQL = "update food set group_id= ?,food_name= ?,price= ?,stock= ?, description =? where id = ?;";

	public FoodDAL() {
	}

	

	public void insertFood(Food food) throws SQLException {
		System.out.println(INSERT_FOOD_SQL);
		// try-with-resource statement will auto close the connection.
		try (Connection connection =MysqlUtil. getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(INSERT_FOOD_SQL)) {
			preparedStatement.setInt(1, food.getGroup_id());
			preparedStatement.setString(2, food.getFood_name());
			preparedStatement.setDouble(3, food.getPrice());
			preparedStatement.setInt(4, food.getStock());
			preparedStatement.setString(5, food.getDescription());
			System.out.println(preparedStatement);
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			printSQLException(e);
		}
	}

	public Food selectFood(int food_id) {
		Food _food = null;
		// Step 1: Establishing a Connection
		try (Connection connection = MysqlUtil.getConnection();
				// Step 2:Create a statement using connection object
				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_FOOD_BY_ID);) {
			preparedStatement.setInt(1, food_id);
			System.out.println(preparedStatement);
			// Step 3: Execute the query or update query
			ResultSet rs = preparedStatement.executeQuery();

			// Step 4: Process the ResultSet object.
			while (rs.next()) {
				int id = rs.getInt("id");
				int group_id = rs.getInt("group_id");
				String name =rs.getString("name");
				Double price =rs.getString("price")==null?0: Double.parseDouble( rs.getString("price").toString());
				int stock =rs.getString("stock")==null?0: Integer.parseInt( rs.getString("stock"));
				String description = rs.getString("description");
				_food = new Food(id, group_id, name,price,stock, description);
			}
		} catch (SQLException e) {
			printSQLException(e);
		}
		return _food;
	}
	public List<Food> selectFoodByGroupId(int groupId) {
		List<Food> foods = new ArrayList<>();
		// Step 1: Establishing a Connection
		try (Connection connection = MysqlUtil.getConnection();
				// Step 2:Create a statement using connection object
				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_FOOD_BY_GROUP_ID);) {
			preparedStatement.setInt(1, groupId);
			System.out.println(preparedStatement);
			// Step 3: Execute the query or update query
			ResultSet rs = preparedStatement.executeQuery();

			// Step 4: Process the ResultSet object.
			while (rs.next()) {
				int id = rs.getInt("id");
				int group_id = rs.getInt("group_id");
				String name =rs.getString("name");
				Double price =rs.getString("price")==null?0: Double.parseDouble( rs.getString("price").toString());
				int stock =rs.getString("stock")==null?0: Integer.parseInt( rs.getString("stock"));
				String description = rs.getString("description");
				foods.add( new Food(id, group_id, name,price,stock, description));
			}
		} catch (SQLException e) {
			printSQLException(e);
		}
		return foods;
	}
	public List<Food> selectAllFoods() {

		// using try-with-resources to avoid closing resources (boiler plate code)
		List<Food> foods = new ArrayList<>();
		// Step 1: Establishing a Connection
		try (Connection connection = MysqlUtil.getConnection();

				// Step 2:Create a statement using connection object
			PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_FOOD);) {
			System.out.println(preparedStatement);
			// Step 3: Execute the query or update query
			ResultSet rs = preparedStatement.executeQuery();

			// Step 4: Process the ResultSet object.
			while (rs.next()) {
				int id = rs.getInt("id");
				int group_id = rs.getInt("group_id");
				String name =rs.getString("name");
				Double price =rs.getString("price")==null?0: Double.parseDouble( rs.getString("price").toString());
				int stock =rs.getString("stock")==null?0: Integer.parseInt( rs.getString("stock"));
				String description = rs.getString("description");
				foods.add( new Food(id, group_id, name,price,stock, description));
			}
		} catch (SQLException e) {
			printSQLException(e);
		}
		return foods;
	}

	public boolean deleteFood(int id) throws SQLException {
		boolean rowDeleted;
		try (Connection connection = MysqlUtil.getConnection();
				PreparedStatement statement = connection.prepareStatement(DELETE_FOOD_SQL);) {
			statement.setInt(1, id);
			rowDeleted = statement.executeUpdate() > 0;
		}
		return rowDeleted;
	}

	public boolean updateFood(Food food) throws SQLException {
		boolean rowUpdated;
		try (Connection connection = MysqlUtil.getConnection();
				PreparedStatement statement = connection.prepareStatement(UPDATE_FOOD_SQL);) {
			statement.setInt(1, food.getGroup_id());
			statement.setString(2, food.getFood_name());
			statement.setDouble(3, food.getPrice());
			statement.setInt(4, food.getStock());
			statement.setString(5, food.getDescription());
			statement.setInt(6, food.getId());

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
