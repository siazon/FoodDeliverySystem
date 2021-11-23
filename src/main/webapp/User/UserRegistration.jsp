<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.3/css/bulma.min.css">
<style>
</style>
</head>
<body>
	<div>
		<form class="box" action="<%=request.getContextPath()%>/userRegist" method="post" onsubmit="return check()" style="width:300px; margin: 100px auto">
			
	<img src="<%=request.getContextPath()%>/Images/logo.png" width="280" height="125"> <div class="field">
    <label class="label">Email</label>
    <div class="control">
      <input class="input" name="email" type="email" placeholder="e.g. alex@example.com">
    </div>
  </div>

  <div class="field">
    <label class="label">Password</label>
    <div class="control">
      <input class="input" name="pwd" type="password" placeholder="********">
    </div>
  </div>	
			<button type="submit" class="button is-primary">Sign up</button>
			<br>
			<br>
			
			
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