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
<style>
table, td, th {
  border: 1px solid black;
}

table {
  width: auto;
  border-collapse: collapse;
}
</style>
</head>
<body>
	<center>
		<h1>Food Management</h1>
		<h2>
			<a href="<%=request.getContextPath()%>/Food/FoodForm.jsp">Add New Food</a> &nbsp;&nbsp;&nbsp; <a
				href="<%=request.getContextPath()%>/AddressManager?action=list"
			>List All Food</a>
		</h2>
	</center>
	<div align="center">
		<table border="1" cellpadding="5">
			<caption>
				<h2>List of Food</h2>
			</caption>
			<tr>
				<th>Food_ID</th>
				<th>Name</th>
				<th>Price</th>
				<th>Stock</th>
				<th>Address</th>
				<th>Phone</th>
				<th>Operate</th>
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
						href="<%= request.getContextPath() %>/FoodManager?action=edit&user_email=<c:out value='${address.user_email}' />&address_id=<c:out value='${address.address_id}' />"
					>Edit</a> &nbsp;&nbsp;&nbsp;&nbsp; <a
						href="<%= request.getContextPath() %>/FoodManager?action=delete&user_email=<c:out value='${address.user_email}' />&address_id=<c:out value='${address.address_id}' />"
					>Delete</a></td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>