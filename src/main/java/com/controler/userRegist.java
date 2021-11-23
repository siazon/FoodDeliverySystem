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
import com.model.User;

/**
 * Servlet implementation class userRegist
 */
@WebServlet("/userRegist")
public class userRegist extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDAL userDAO = new UserDAL();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public userRegist() {
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
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action= request.getParameter("action");
		if("login".equals(action))
		{
			String email = request.getParameter("email");
			String pwd = request.getParameter("pwd");
			if (email.contains("admin")&&"123456".equals(pwd)) {
				RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
				dispatcher.forward(request, response);
			}
		}
		else {
			
		
		String name = request.getParameter("usersname");
		String email = request.getParameter("email");
		String pwd = request.getParameter("pwd");
		String phone = request.getParameter("phone");
		String status = request.getParameter("status");

		String role = email.contains("@ait.ie") ? "Staff" : "Customer";
		User newUser = new User( email,pwd, name,phone,status,role);
		try {
			String msg = userDAO.insertUser(newUser);

			request.setAttribute("role", role);
			if("succeed".equals(msg))
			{
				RequestDispatcher dispatcher = request.getRequestDispatcher("User/RegistrationSucceed.jsp");
				dispatcher.forward(request, response);
			}
			else {
				request.setAttribute("errMsg", msg);
				RequestDispatcher dispatcher = request.getRequestDispatcher("User/UserRegistration.jsp");
				dispatcher.forward(request, response);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		}
	
		doGet(request, response);
	}

}
