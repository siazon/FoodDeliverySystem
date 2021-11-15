<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="com.model.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<center>
		<%
		String email = request.getParameter("user_email");
		if (email == null) {
			List<UserAddress> addresss = (List<UserAddress>) request.getAttribute("listAddress");
			for (int i = 0; i < addresss.size(); i++) {
				email = addresss.get(i).getUser_email();
			}
		}
		%>
		<h1>Address Management</h1>
		<h2>
			<a href="<%=request.getContextPath()%>/User/AddressForm.jsp?user_email=<%=email%>">Add New address</a> &nbsp;&nbsp;&nbsp; <a
				href="<%=request.getContextPath()%>/AddressManager?action=list&user_email=<%=email%>"
			>List All address</a>
		</h2>
	</center>
	<div align="center">
		<table border="1" cellpadding="5">
			<caption>
				<h2>List of address</h2>
			</caption>
			<tr>
				<th>ID</th>
				<th>Email</th>
				<th>County</th>
				<th>Street</th>
				<th>Address</th>
				<th>Phone</th>
			</tr>
			<c:forEach var="address" items="${listAddress}">
				<tr>
					<td><c:out value="${address.address_id}" /></td>
					<td><c:out value="${address.user_email}" /></td>
					<td><c:out value="${address.county}" /></td>
					<td><c:out value="${address.street}" /></td>
					<td><c:out value="${address.address}" /></td>
					<td><c:out value="${address.phone}" /></td>
					<td><a
						href="<%= request.getContextPath() %>/AddressManager?action=edit&user_email=<c:out value='${address.user_email}' />&address_id=<c:out value='${address.address_id}' />"
					>Edit</a> &nbsp;&nbsp;&nbsp;&nbsp; <a
						href="<%= request.getContextPath() %>/AddressManager?action=delete&user_email=<c:out value='${address.user_email}' />&address_id=<c:out value='${address.address_id}' />"
					>Delete</a></td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>