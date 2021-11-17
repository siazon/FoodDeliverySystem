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

import com.dal.AddressDAL;
import com.model.*;

/**
 * Servlet implementation class AddressManager
 */
@WebServlet("/AddressManager")
public class AddressManager extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private AddressDAL addressDAL = new AddressDAL();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddressManager() {
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
			String email = request.getParameter("user_email");
			String county = request.getParameter("county");
			String street = request.getParameter("street");
			String address = request.getParameter("address");
			String phone = request.getParameter("phone");
			UserAddress newUser = new UserAddress(0, email, county, street, address, phone);
			try {
				addressDAL.insertAddress(newUser);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			ListAllAddress(request, response, email);
		}
		// list all the address
		else if ("list".equals(action)) {
			String email = request.getParameter("user_email");
			ListAllAddress(request, response, email);
		}
		// navigatt to the edit page
		else if ("edit".equals(action)) {
			String email = request.getParameter("user_email");
			int address_id = Integer.parseInt(request.getParameter("address_id"));
			UserAddress existingAddress = addressDAL.selectAddress(address_id);
			request.setAttribute("user_email", email);
			request.setAttribute("address", existingAddress);
			RequestDispatcher dispatcher = request.getRequestDispatcher("User/AddressForm.jsp");
			dispatcher.forward(request, response);
		}
		// update datas to database
		else if ("update".equals(action)) {
			int address_id = Integer.parseInt(request.getParameter("address_id"));
			String email = request.getParameter("user_email");
			String county = request.getParameter("county");
			String street = request.getParameter("street");
			String address = request.getParameter("address");
			String phone = request.getParameter("phone");
			UserAddress newAddress = new UserAddress(address_id, email, county, street, address, phone);
			try {
				Boolean resultBoolean = addressDAL.updateAddress(newAddress);
				if (resultBoolean) {
					ListAllAddress(request, response, email);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		//delete from database
		else if ("delete".equals(action)) {
			String email = request.getParameter("user_email");
			int address_id = Integer.parseInt(request.getParameter("address_id"));
			try {
				Boolean result = addressDAL.deleteAddress(address_id);
				if (result) {
					ListAllAddress(request, response, email);
				}

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else {
			System.out.println(action);
			String user_email = request.getParameter("user_email");
			System.out.println(user_email);
			List<UserAddress> listAddress = addressDAL.selectAdderss(user_email);
			request.setAttribute("listAddress", listAddress);
			request.setAttribute("user_email", user_email);
			RequestDispatcher dispatcher = request.getRequestDispatcher("User/AddressList.jsp");
			dispatcher.forward(request, response);
			response.getWriter().append("Served at: ").append(request.getContextPath());
		}
	}

	private void ListAllAddress(HttpServletRequest request, HttpServletResponse response, String email) {
		List<UserAddress> listAddress = addressDAL.selectAdderss(email);
		request.setAttribute("user_email", email);
		request.setAttribute("listAddress", listAddress);
		RequestDispatcher dispatcher = request.getRequestDispatcher("User/AddressList.jsp");
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
