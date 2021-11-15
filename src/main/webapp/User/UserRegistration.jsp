<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
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

div {
	border: 1px solid #e0e0e0;
	border-radius: 10px;
	display: inline-block;
	width: 400px;
	margin: 50px;
	padding:30px 0;
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
		<img src="<%=request.getContextPath()%>/Images/logo.png" width="280" height="125">
		<form action="<%=request.getContextPath()%>/userRegist" method="post" onsubmit="return check()" style="margin: 5px">
			<label style="color: #808080" for="lname">e-mail:</label><br> <input type="email" id="email" name="email" value=""></input><br> <label style="color: #808080"
				for="lname"
			>Password:</label><br> <input type="password" id="pwd" name="pwd" value=""></input><br> <br> <input type="submit" value="Sign Up"
				class="button-success pure-button" style="margin: 20px 0 20px 0"
			></input><br>
				<label style="color: red" >
			<%
			if (request.getAttribute("errMsg") != null)
				out.println(request.getAttribute("errMsg"));
			%></label>
		</form>
	</div>
</body>
<script>
	function check() {
		var email = document.getElementById("email").value;
		var pwd = document.getElementById("pwd").value;
		if (email == null || email == "") {
			alert("Email is null");
			return false;
		} else if (pwd == null || pwd == "") {
			alert("pwd is null");
			return false;
		}
		return true;
	}
</script>
</html>