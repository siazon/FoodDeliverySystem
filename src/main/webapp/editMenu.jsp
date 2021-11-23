<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Menu</title>
</head>
<body>

	<header>
		<nav class="navbar navebar-expand-md navbar-dark"
			style="background-color: blue">
			<div>
				<ahref="https://www.xadmin.net" class="navbar-brand"> Edit Menu</ahref> 
			</div>
			
			<ul class="navbar-nav">
				<li><ahref="<%=request.getContextPath()%>/list"
					class="nav-link">Edit Menu</ahref></li>
			</ul>
		</nav>
	</header>
	<br>
	<div class="container col-md-5">
		<div class="card">
			<c:if test="${menu-list != null }">
					<form action="update" method="post">
				</c:if>
				<c:if test="${menu-list == null}">
					<form action= "insert" method="post">
				</c:if>
				
				<caption>
					<h2>
						<c:if test="${menu-list != null}">
						Edit Menu
						</c:if>
							<c:if test="=${menu-list == null}">
							Add New Item
							</c:if>
					</h2>
				</caption>
				
				<c:if test="${menu-list != null}">
					<input type="hidden" name="id" value="<c:out value='${staffMenuAdjust.foodId}' />"/>
					</c:if>
					
					<fieldset class="form-group">
						<label>Menu Category</label><input type="value="<c:out value='${staffMenuAdjust.menuCategory}'/>"/>
					</fieldset>
					
					<fieldset class="form-group">
						<label>Item Name</label><input type="value="<c:out value='${staffMenuAdjust.itemName}'/>"/>
					</fieldset>
					
					<fieldset class="form-group">
						<label>Item Description</label><input type="value="<c:out value='${staffMenuAdjust.itemDescription}'/>"/>
					</fieldset>
					
					<fieldset class="form-group">
						<label>Allergies</label><input type="value="<c:out value='${staffMenuAdjust.allergies}'/>"/>
					</fieldset>
					
					<fieldset class="form-group">
						<label>Price</label><input type="value="<c:out value='${staffMenuAdjust.price}'/>"/>
					</fieldset>
					
					<button type="submit" class="btn btn-success">Save</button>
					</form>
			</div>
		</div>
	</div>
</body>
</html>