package com.controler;

import java.io.IOException;
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
		
		List<User> listAddress = userDal.selectAllEmployee();
		request.setAttribute("listUser", listAddress);
		RequestDispatcher dispatcher = request.getRequestDispatcher("User/UserList.jsp");
		dispatcher.forward(request, response);
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
