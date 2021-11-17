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

import com.dal.UserDAL;
import com.model.*;

/**
 * Servlet implementation class EmployeeManager
 */
@WebServlet("/EmployeeManager")
public class EmployeeManager extends HttpServlet {
	private static final long serialVersionUID = 1L;
	UserDAL userDal=new UserDAL();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EmployeeManager() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action = request.getParameter("action");
		 if ("list".equals(action)) {
			ListAddEmployee(request, response);
		}else if ("delete".equals(action)) {
			String email = request.getParameter("user_email");
			try {
				Boolean result = userDal.deleteUser(email);
				if (result) {
					ListAddEmployee(request, response);
				}

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else if ("edit".equals(action)) {
			String email = request.getParameter("user_email");
			User existingUser = userDal.selectUser(email);
			request.setAttribute("users", existingUser);
			RequestDispatcher dispatcher = request.getRequestDispatcher("User/UserForm.jsp");
			dispatcher.forward(request, response);
		}else if ("update".equals(action)) {
			String user_email = request.getParameter("user_email");
			String user_password = request.getParameter("user_password");
			String user_name = request.getParameter("user_name");
			String user_phone = request.getParameter("user_phone");
			String user_status = request.getParameter("user_status");
			String user_role = request.getParameter("user_role");
			User newAddress = new User(user_email,user_password, user_name, user_phone, user_status, user_role);
			try {
				Boolean resultBoolean = userDal.updateUser(newAddress);
				if (resultBoolean) {
					ListAddEmployee(request, response);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		 else {
			 ListAddEmployee(request, response);
		}
		
		
	}
	private void ListAddEmployee(HttpServletRequest request, HttpServletResponse response) {
		
		List<User> listAddress = userDal.selectAllEmployee();
		request.setAttribute("listUser", listAddress);
		RequestDispatcher dispatcher = request.getRequestDispatcher("User/UserList.jsp");
		try {
			dispatcher.forward(request, response);
			response.getWriter().append("Served at: ").append(request.getContextPath());
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
