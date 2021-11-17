<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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

.pure-button {
	font-family: inherit;
	font-size: 100%;
	padding: .5em 1em;
	color: #444;
	color: rgba(0, 0, 0, .8);
	border: 1px solid #999;
	border: none transparent;
	background-color: #e6e6e6;
	text-decoration: none;
	border-radius: 2px;
	margin: 20px;
	cursor: pointer;
}

.button-success {
	background: rgb(28, 184, 65); /* this is a green */
}
</style>
</head>
<body>
	<center>
		<h1>User Management</h1>
	</center>
	<div align="center">
		<c:if test="${users != null}">
			<form action="<%=request.getContextPath()%>/AddressManager?action=update" method="post">
		</c:if>
		<c:if test="${users == null}">
			<form action="<%=request.getContextPath()%>/AddressManager?action=new" method="post">
		</c:if>
		<table border="1" cellpadding="5">
			<caption>
				<h2>
					<c:if test="${users != null}">
            			Edit User
            		</c:if>
					<c:if test="${address == null}">
            			Add New User
            		</c:if>
				</h2>
			</caption>
			<tr>
				<th>Email:</th>
				<td><input type="text" name="user_email" size="45" readonly="readonly" value="<c:out value='<%=request.getParameter("user_email")%>' />" /></td>
			</tr>
			<tr>
				<th>Name:</th>
				<td><input type="text" name="county" size="45" value="<c:out value='${users.user_name}' />" /></td>
			</tr>
			<tr>
				<th>Phone:</th>
				<td><input type="text" name="street" size="45" value="<c:out value='${users.user_phone}' />" /></td>
			</tr>
			<tr>
				<th>Status:</th>
				<td><input type="text" name="address" size="45" list="statuslists"  value="<c:out value='${users.user_status}' />" />
				 <datalist id="statuslists">
						<option value="working">
						<option value="on holiday">
						<option value="on business trip">
					</datalist>
				</td>
			</tr>
			<tr>
			<tr>
				<th>role:</th>
				<td><input type="text" name="phone" size="45" list="rolelists"  value="<c:out value='${users.user_role}' />" />
				 <datalist id="rolelists">
						<option value="Staff">
						<option value="Driver">
					</datalist></td>
			</tr>
		</table>
		<input type="submit" value="Save" class="button-success pure-button" /> <input onclick="cancelEdit()" type="button" value="Cancel" class="button-success pure-button" />
		</form>
	</div>
</body>
<script>
	function cancelEdit() {
		//alert("displayLogin is click");
		history.back(-1)
	}
</script>
</html>