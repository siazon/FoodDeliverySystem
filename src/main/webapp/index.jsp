<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@include file="../common/init.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html style="overflow-y: hidden;">
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.3/css/bulma.min.css">
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
	height: 90px;
	border-style: solid;
	border-width: 0px 0px 1px 0px;
	border-color: #FB6100;
}

section {
	flex: 1;
	height: auto;
}
</style>
</head>
<body>
	<header id="tabTit">
		<nav class="navbar" role="navigation" aria-label="main navigation" style="height: 80px;">
			<div class="navbar-brand">
				<img src="Images/logo.png" style="height: 80px;width:160px;"> 
				<a role="button" class="navbar-burger" aria-label="menu" aria-expanded="false" data-target="navbarBasicExample"> <span
					aria-hidden="true"
				></span> <span aria-hidden="true"></span> <span aria-hidden="true"></span>
				</a>
			</div>
			<div id="navbarBasicExample" class="navbar-menu">
				<div class="navbar-start"></div>
				<div class="navbar-end">
					<div class="navbar-item">
						<div class="buttons">
							<a onclick="displayHome()" class="button is-warning"> <strong>Home</strong>
							</a> 
							<div id="btnNotlogin" >
							<a onclick="displaySignUp()" class="button is-primary"> <strong>Sign up</strong>
							</a> 
							<a onclick="displayLogin()" class="button is-light">Login</a>
							</div>
							<a id="btnloginOut" onclick="displayLogOut()" class="button is-light">LogOut</a>
						</div>
					</div>
				</div>
			</div>
		</nav>
		<!-- 	<img src="Images/logo.png" onclick="displayHome()" width="160" height="80"> 
		<a onclick="displayLogin()" style="cursor:pointer;">Login</a>
		 <a  onclick="displayHome()" style="cursor:pointer;">Home</a> -->
	</header>
	<section>
		<iframe id="centerFrame" name="centerFrame" class="page-iframe" width="100%" height="100%" src="Home.jsp" frameborder="0"></iframe>
	</section>
</body>
<script>
init();
function init(){
	document.getElementById('btnloginOut').style.display = "none";
window.addEventListener('message',function(e){
    let data = e;
    //console.log('Msg: ',data.data);
    if(data.data.name!=undefined&&data.data.name.length>0)
    { console.log('Msg: ',data.data.name);
    document.getElementById('btnloginOut').style.display = "block";
    document.getElementById('btnloginOut').value = "Logout("+data.data.name+")";
    document.getElementById('btnNotlogin').style.display = "none";
    }
    
    },false);
}
function displayLogOut(){
    document.getElementById('btnNotlogin').style.display = "block";
    document.getElementById('btnloginOut').style.display = "none";
    tabCon.src  = 'Home.jsp';
}
    var btns = document.getElementById('tabTit').getElementsByTagName('a');
    var tabCon = document.getElementById('centerFrame');
   
    function displayHome(){
   	 tabCon.src  = 'Home.jsp';
   }
    function displayLogin(){
  	 tabCon.src = 'User/Login.jsp';
   } 
    function displaySignUp(){
	  	 tabCon.src =  'User/UserRegistration.jsp';
    	// tabCon.src = '<%=request.getContextPath()%>/AddressManager';
	}
   function displayAdmin(){
  	 tabCon.src = '<%=request.getContextPath()%>/EmployeeManager';
	}
</script>
</html>