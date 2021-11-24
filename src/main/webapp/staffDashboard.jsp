<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="com.model.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Staff Home</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.3/css/bulma.min.css">
<style>
h1 {
	text-align: left;
	margin: 0 0 10px 0px;
	padding: 10px;
}

.hdiv {
	background-color: #f3f3f3;
}

.dv1 {
	width: 600px;
	position: absolute;
	top: 80px;
	left: 0px;
	right: 0px;
	bottom: 0px;
	margin: auto;
}
</style>
</head>
<body>
	<%
	User user = (User) request.getAttribute("user");
	String name = user.getUser_name();
	System.out.print(name);
	%>
	<h1 class="hdiv" >SfaffDashboard 
		[<%=name%>] is login
	</h1>
	  <input class="input" style="display:none;" name="user_email" type="text" id="user_name"
                                   value="<c:out value='<%=name%>' />">
	<div class="tabs">
	<div class="buttons">
  <a class="button is-info"  href="<%=request.getContextPath()%>/MenuServlet">Manage Menu</a>
  <a class="button is-success">Order List</a>
  <a class="button is-warning">Manage Drivers</a>
  <% if("admin".equals(name)) {%>
  <a class="button is-danger" href="<%=request.getContextPath()%>/EmployeeManager">Manage Staff</a>
    <%} %>
</div>
</div>
</body>
<script>
	window.onload = function() {
		var name = document.getElementById('user_name').value;
		 console.log(name);
		var autoMessage = {
			"name" : name
		};

		window.parent.postMessage(autoMessage, '*');
	}
</script>
</html>