<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@include file="../common/init.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
* {
	margin: 0;
	padding: 0;
}

html, body {
	height: 100%;
}

body {
	display: flex;
	flex-direction: column;
}

header {
	height: 80px;
	border-style: solid;
	border-width: 0px 0px 1px 0px;
	border-color: #FB6100;
}

header a {
	width: 100px;
	background-color: white;
	float: right;
	margin-top: 30px;
}

section {
	flex: 1;
	height: auto;
}

footer {
	height: 50px;
	/*background-color: #FB6100;*/
}
</style>
</head>
<body>
	<header id="tabTit">
		<img src="Images/logo.png" width="160" height="80"> 
		<a onclick="displayLogin()" style="cursor:pointer;">Login</a>
		 <a  onclick="displayHome()" style="cursor:pointer;">Home</a>
	</header>
	<section>
	  <iframe id="centerFrame" name="centerFrame" class="page-iframe" width="100%" height="100%" src="Home.jsp"
            frameborder="0"></iframe>
	</section>
	<footer><%@ include file="Footer.jsp"%></footer>
</body>
<script>
    var btns = document.getElementById('tabTit').getElementsByTagName('a');
    var tabCon = document.getElementById('centerFrame');
    function displayLogin(){
    	 tabCon.src = 'User/Login.jsp';
    }
    function displayHome(){
   	 tabCon.src = 'Home.jsp';
   }
</script>
</html>