<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html>
<html>
<head>
<title> Menu Items</title>
</head>
<body>
<header>
<%@include file="Header.jsp" %>
<nav class="staff_container">
		<div class="header">
				<a href="staffDashboard.jsp"><img src="./images/logo.png"></img></a>
				<ul class="nav">
					<li><a href="<%=request.getContextPath() %>/list"
						class="nav-link">Menu List</a></li>
				</ul>
				</nav>
				</header>
				<br>
				
				<div class ="row">
					<!-- <div class="alert alert-success" "ngIf='message'> {{message}}</div> -->
					
					<div class= "container">
						<h3 class=text-center">List of Menu Items</h3>
						<hr>
						<div class="container text-left">
							
							<a href="<%=request.getContextPath() %>/new" class="btn btn-success">Add New Menu Item</a>
						</div>
						<br>
						<table class="table table-bordered">
							<thead>
								<tr>
									<th>ProdId</th>
									<th>Menu Category</th>
									<th>Item Name</th>
									<th>Item Description</th>
									<th>Allergies</th>
									<th>Price</th>
									<th>Actions</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="MenuItem" items=$(listMenu)">
								
									<tr>
									<td><c:out value="${menu.foodId}"/></td>
									<td><c:out value="${menu.name}"/></td>
									<td><c:out value="${menu.description}"/></td>
									<td><c:out value="${menu.allergies}"/></td>
									<td><c:out value="${menu.price}"/></td>
									<td><a href=edit?id=<c:out value='${staffMenuAdjust.foodId}' />">Edit</a>
										&nbsp;&nbsp;&nbsp;&nbsp; 
										<ahref="delete?id=<c:out value='${staffMenuAdjust.foodId}' />">Delete</a></td>
									</tr>
									</c:forEach>
							</tbody>	
							
						</table>
					</div>
				
				</div>
				
				
			
				
				
				
				
				
				
				
				
				
</div>				
</body>
</html>