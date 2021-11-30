package com.controler;

import java.io.IOException;
import java.util.List;
import org.junit.Test;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dal.UserDAL;
import com.model.User;

/**
 * Servlet implementation class userLogin
 */
@WebServlet("/userLogin")
public class userLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDAL userDAO = new UserDAL();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public userLogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		String email = request.getParameter("email");
		String pwd = request.getParameter("pwd");
//		List usersList=userDAO.selectAllUsers();
//		for (Object u : usersList) {
//			System.out.println((User)u);
//		};
		User user =userDAO.selectUser(email);
		String up= user.getUser_password();
		
		System.out.println(up);
		if (up.equals(pwd)) {
			request.setAttribute("User", user);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/index.jsp");
			dispatcher.forward(request, response);
		}
		else {
			request.setAttribute("msg", "Email or Password wrong");
			RequestDispatcher dispatcher = request.getRequestDispatcher("User/Login.jsp");
			dispatcher.forward(request, response);
		}
		System.out.println(user);
		
		System.out.println(email);
		System.out.println(pwd);
		
		
	}

}
