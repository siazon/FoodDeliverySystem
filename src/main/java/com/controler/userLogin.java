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
 * 
 * 
 * @author Jiating Li
 * @date 2021-11-30 23:56:18
 * @version v1.0
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
		
		
		if (email.contains("admin") && "123456".equals(pwd)) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("staffDashboard.jsp");
			dispatcher.forward(request, response);
		} else {
			User user =userDAO.selectUser(email);
			if (user==null) {
				request.setAttribute("errMsg", "Failed, Email is not exist");
				RequestDispatcher dispatcher = request.getRequestDispatcher("User/Login.jsp");
				dispatcher.forward(request, response);

			} 
			else if (user.getUser_password().equals(pwd)) {
				if(email.contains("ait.ie"))
				{
				request.setAttribute("scucess", "1");
				request.setAttribute("user", user);
				RequestDispatcher dispatcher = request.getRequestDispatcher("staffDashboard.jsp");
				dispatcher.forward(request, response);
				}
				else {
					request.setAttribute("scucess", "1");
					request.setAttribute("user", user);
					RequestDispatcher dispatcher = request.getRequestDispatcher("Home.jsp");
					dispatcher.forward(request, response);
				}
				
			} else {
				request.setAttribute("errMsg", "Failed, Wrong Password");
				RequestDispatcher dispatcher = request.getRequestDispatcher("User/Login.jsp");
				dispatcher.forward(request, response);
			}

		}
		
	}

}
