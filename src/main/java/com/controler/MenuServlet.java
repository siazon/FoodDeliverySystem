package com.controler;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dal.StaffMenuDAL;
import com.model.StaffMenuAdjust;
import com.model.User;

/**
 * Servlet implementation class MenuServlet
 */
@WebServlet("/MenuServlet")
public class MenuServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private StaffMenuDAL staffMenuDAL;

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init() throws ServletException {
		staffMenuDAL = new StaffMenuDAL ();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String action = request.getParameter("action");
		if ("new".equals(action)) 
		{
			
			
		}
		else if ("edit".equals(action)) {
			Integer id =Integer.parseInt(request.getParameter("id"));
			List<StaffMenuAdjust>listMenu = staffMenuDAL.selectAllMenu();
			for(StaffMenuAdjust item:listMenu)
			{
				if(item.getProdId()==id)
				{
					request.setAttribute("menu", item);
					RequestDispatcher dispatcher = request.getRequestDispatcher("MenuAdjust.jsp");
					dispatcher.forward(request, response);
					
				}
			}
			
		}
		else {
			listMenu(request, response);
		}
	
		return;
		
	/*
		switch(action) {
		case "new":
			showNewForm(request, response);
			break;
		case "insert":
			try {
				insertMenuItem(request, response);
			} catch (ServletException | IOException | SQLException e) {

				e.printStackTrace();
			}
			break;
		case "delete":
			try {
				deleteMenuItem(request, response);
			} catch (SQLException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
		case "edit":
			try {
				showEditForm(request, response);
			} catch (SQLException | IOException | ServletException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
		case "update":
			try {
				updateMenu(request, response);
			} catch (SQLException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			break;
		default:
			listMenu(request, response);

			break;

		}*/
	}//end of do get method

	private void showNewForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("user-form.jsp");
		dispatcher.forward(request, response);

	}

	private void insertMenuItem(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
		String menuCategory = request.getParameter("menuCategory");
		String name = request.getParameter("name");
		String description = request.getParameter("description");
		String allergies = request.getParameter("allergies");
		double price = Double.parseDouble(request.getParameter("price"));
		StaffMenuAdjust menuItem = new StaffMenuAdjust(0,menuCategory, name, description, allergies, price);

		staffMenuDAL.insertMenu(menuItem);
		response.sendRedirect("list");
	}

	//	delete menu item
	public void deleteMenuItem (HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
		int id = Integer.parseInt(request.getParameter("foodId"));
		try {
			staffMenuDAL.deleteMenu(id);
		}catch (Exception e) {
			e.printStackTrace();
		}
		response.sendRedirect("list");
	}
	//	edit
	private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
		int id = Integer.parseInt(request.getParameter("foodId"));

		StaffMenuAdjust existingStaffMenu;
		try  {
			existingStaffMenu = staffMenuDAL.selectMenu(id);
			RequestDispatcher dispatcher = request.getRequestDispatcher("editMenu.jsp");
			request.setAttribute("menu", existingStaffMenu);
			dispatcher.forward(request, response);
		}catch (Exception e) {
			e.printStackTrace();
		}
	}

	//	update
	private void updateMenu(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {

		String menuCategory = request.getParameter("menuCategory");
		String name = request.getParameter("name");
		String description = request.getParameter("description");
		String allergies = request.getParameter("allergies");
		double price = Double.parseDouble(request.getParameter("price"));
		int id = Integer.parseInt(request.getParameter("price"));


		StaffMenuAdjust menuItem = new StaffMenuAdjust(id,menuCategory, name, description, allergies, price);

		staffMenuDAL.updateMenu(menuItem);
		response.sendRedirect("list");

	}

	//	default
	private void listMenu(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		List<StaffMenuAdjust>listMenu = staffMenuDAL.selectAllMenu();
		request.setAttribute("listMenu", listMenu);
		RequestDispatcher dispatcher = request.getRequestDispatcher("menu-list.jsp");
		dispatcher.forward(request, response);
	}
}
