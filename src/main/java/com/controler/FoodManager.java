package com.controler;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dal.*;
import com.model.*;

/**
 * 
 * 
 * @author Xiasong Chen
 * @date 2021-11-30 23:56:18
 * @version v1.0
 */
@WebServlet("/FoodManager")
public class FoodManager extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private FoodDAL foodDAL = new FoodDAL();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public FoodManager() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		String action = request.getParameter("action");
		//insert to database
		if ("new".equals(action)) {
			int  groupId =Integer.parseInt( request.getParameter("groud_id"));
			int id = Integer.parseInt(request.getParameter("id"));
			String name = request.getParameter("food_name");
			Double price =Double.parseDouble(request.getParameter("price"));
			int stock =Integer.parseInt( request.getParameter("stock"));
			String description = request.getParameter("description");
			Food food = new Food(id,groupId,name,price,stock,description);
			try {
				foodDAL.insertFood(food);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			//ListAllAddress(request, response, email);
		}
		// list all the address
		else if ("list".equals(action)) {

			Integer  groupId =Integer.parseInt( request.getParameter("groud_id"));
			ListAllFoods(request, response, groupId);
		}
		// navigatt to the edit page
		else if ("edit".equals(action)) {
			int  groupId =Integer.parseInt( request.getParameter("groud_id"));
			ListAllFoods(request, response, groupId);
		}
		// update datas to database
		else if ("update".equals(action)) {
			int  groupId =Integer.parseInt( request.getParameter("groud_id"));
			int id = Integer.parseInt(request.getParameter("id"));
			String name = request.getParameter("food_name");
			Double price =Double.parseDouble(request.getParameter("price"));
			int stock =Integer.parseInt( request.getParameter("stock"));
			String description = request.getParameter("description");
			Food food = new Food(id,groupId,name,price,stock,description);
			try {
				Boolean resultBoolean = foodDAL.updateFood(food);
				if (resultBoolean) {
					ListAllFoods(request, response, groupId);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		//delete from database
		else if ("delete".equals(action)) {
			Integer  groupId =Integer.parseInt( request.getParameter("groud_id"));
			int address_id = Integer.parseInt(request.getParameter("address_id"));
			try {
				Boolean result = foodDAL.deleteFood(address_id);
				if (result) {
					ListAllFoods(request, response, groupId);
				}

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else {
			System.out.println(action);
			Integer  groupId =Integer.parseInt( request.getParameter("user_email"));
			System.out.println(groupId);
			List<Food> listAddress = foodDAL.selectFoodByGroupId(groupId);
			request.setAttribute("listAddress", listAddress);
			request.setAttribute("user_email", groupId);
			RequestDispatcher dispatcher = request.getRequestDispatcher("User/AddressList.jsp");
			dispatcher.forward(request, response);
			response.getWriter().append("Served at: ").append(request.getContextPath());
		}
	}

	private void ListAllFoods(HttpServletRequest request, HttpServletResponse response, int group_id) {
		List<Food> listAddress = foodDAL.selectFoodByGroupId(group_id);
		request.setAttribute("user_email", group_id);
		request.setAttribute("listAddress", listAddress);
		RequestDispatcher dispatcher = request.getRequestDispatcher("User/FoodList.jsp");
		try {
			dispatcher.forward(request, response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		doGet(request, response);
	}

}
