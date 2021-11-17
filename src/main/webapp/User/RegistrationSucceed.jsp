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
	margin: 180px;
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
	<img src="<%=request.getContextPath()%>/Images/ok.png" width="100" height="100">
	<h1>You have signed up</h1>
	<h1>successfully</h1>
	<b style="color: #808080">Thank you for choosing us.</b>
	<br>
	<b style="color: #808080">your email is </b>
	<b style="font-family:"Garamond", Georgia, Serif"><%=request.getParameter("email")%></b>
	<br>
	<input type="button" class="button-success pure-button" style="margin: 20px 0 20px 0; width: auto; color: white" value="OK" />
	</div>
	<br>
	<%
	//only customer show add address
	if (request.getAttribute("role") != null && "Customer".equals(request.getAttribute("role"))) {
	%>
	<a href="<%=request.getContextPath()%>/AddressManager?user_email=<%=request.getParameter("email")%>">Add a Address Now</a>
	<%
	}
	%>
</body>
</html>