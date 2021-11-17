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
	
		<h1>Employee Management</h1>
		<h2>
			<a href="<%=request.getContextPath()%>/User/UserForm.jsp">Add New Employee</a> &nbsp;&nbsp;&nbsp; <a
				href="<%=request.getContextPath()%>/AddressManager?action=list"
			>List All Employee</a>
		</h2>
	</center>
	<div align="center">
		<table border="1" cellpadding="5">
			<caption>
				<h2>List of Employee</h2>
			</caption>
			<tr>
				<th>Email</th>
				<th>Name</th>
				<th>Phone</th>
				<th>Role</th>
				<th>Operate</th>
			</tr>
			<c:forEach var="address" items="${listUser}">
				<tr>
					<td><c:out value="${address.user_email}" /></td>
					<td><c:out value="${address.user_name}" /></td>
					<td><c:out value="${address.user_phone}" /></td>
					<td><c:out value="${address.user_role}" /></td>
					<td><a
						href="<%= request.getContextPath() %>/AddressManager?action=edit&user_email=<c:out value='${address.user_email}' />"
					>Edit</a> &nbsp;&nbsp;&nbsp;&nbsp; <a
						href="<%= request.getContextPath() %>/AddressManager?action=delete&user_email=<c:out value='${address.user_email}' />"
					>Delete</a></td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>