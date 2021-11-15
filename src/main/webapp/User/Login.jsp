<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
.center {
	
}

body {
	background-repeat: no-repeat;
}

* {
	font-family: "Helvetica", Georgia, Serif;
	text-align: center;
	background-color: white;
	color: #2f2f2f;
}

.divd {
	border: 1px solid #e0e0e0;
	border-radius: 10px;
	display: inline-block;
	width: 400px;
	margin: 50px;
}

input {
	margin: 5px;
	width: 200px;
}

.ititle {
	style ="color: red";
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
}

.button-success {
	background: rgb(28, 184, 65); /* this is a green */
}

.itext {
	outline-style: none;
	border: 1px solid, red;
}
</style>
</head>
<body>
<div>
		<img src="../Images/logo.png" width="280" height="125">
		<form action="<%= request.getContextPath() %>/userRegist" method="post" style="margin: 5px">
			<label style="color: #808080" for="lname">e-mail:</label><br>
			<input type="email" id="email" name="email" value=""></input><br> 
			<label style="color: #808080" for="lname">Password:</label><br> 
			<input type="password" id="pwd" name="pwd" value="" ></input><br> <br> 
			<input type="submit" value="Login" class="button-success pure-button" style="margin: 20px 0 20px 0"></input>
			<br> <a style="margin:20px" href="<%= request.getContextPath() %>/User/UserRegistration.jsp">Create a account</a>
		</form>
	</div>
</body>
</html>