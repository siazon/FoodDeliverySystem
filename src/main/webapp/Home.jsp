<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.model.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.3/css/bulma.min.css">
<style>
* {
	margin: 0;
	padding: 0;
}
.menucard{width:100px;  
display: float;}

.card {
  &.is-horizontal {
    display: flex;

    .card-image {
      width: 100%;
      height: 100%;
    }

    .card-stacked {
      flex-direction: column;
      flex: 1 1 auto;
      display: flex;
      position: relative;

      .card-content {
        flex-grow: 1;
      }
    }
</style>
</head>
<body>
<%
String name ="";
	User user = (User) request.getAttribute("user");
if(user!=null) {
	 name = user.getUser_name();
	System.out.print(name);}
	%>
<div>
<div class="tabs is-medium">
  <ul>
    <li class="is-active"><a>Meal</a></li>
    <li><a>Chiken</a>
    </li>
    <li><a>Hamburger</a></li>
    <li><a>Pizza</a></li>
  </ul>
</div>
</div>
  <input class="input" style="display:none;" name="user_email" type="text" id="user_name"
                                   value="<c:out value='<%=name%>' />">
<div class="columns">
  <div class="column">
   <div class="card">
  <div class="card-image">
    <figure class="image is-2by2">
      <img src="<%=request.getContextPath()%>/Images/1.jpg" alt="Placeholder image">
    </figure>
  </div>
  <div class="card-content">
    <div class="media">
     
      <div class="media-content">
        <p class="title is-4">Fish meal</p>
        <p class="subtitle is-6">$8.99</p>
      </div>
      
       <div class="media-right" >
        <figure class="image is-48x48">
          <img class="is-rounded" src="<%=request.getContextPath()%>/Images/cart.jpg" alt="Placeholder image">
        </figure>
      </div>
      
    </div>

    <div class="content">
      Abyssal fish & avocado & cucumber
      <br>
    </div>
  </div>
</div>
  </div>
  <div class="column">
    <div class="card">
  <div class="card-image">
    <figure class="image is-2by2">
      <img src="<%=request.getContextPath()%>/Images/2.jpg" alt="Placeholder image">
    </figure>
  </div>
  <div class="card-content">
    <div class="media">
     
      <div class="media-content">
        <p class="title is-4">meal</p>
        <p class="subtitle is-6">$8.99</p>
      </div>
      
       <div class="media-right" >
        <figure class="image is-48x48">
          <img class="is-rounded" src="<%=request.getContextPath()%>/Images/cart.jpg" alt="Placeholder image">
        </figure>
      </div>
      
    </div>

    <div class="content">
      Abyssal fish & avocado & cucumber
      <br>
    </div>
  </div>
</div>
  </div>
  <div class="column">
    <div class="card">
  <div class="card-image">
    <figure class="image is-2by2">
      <img src="<%=request.getContextPath()%>/Images/3.jpg" alt="Placeholder image">
    </figure>
  </div>
  <div class="card-content">
    <div class="media">
     
      <div class="media-content">
        <p class="title is-4">Fish meal</p>
        <p class="subtitle is-6">$8.99</p>
      </div>
      
       <div class="media-right" >
        <figure class="image is-48x48">
          <img class="is-rounded" src="<%=request.getContextPath()%>/Images/cart.jpg" alt="Placeholder image">
        </figure>
      </div>
      
    </div>

    <div class="content">
      Abyssal fish & avocado & cucumber
      <br>
    </div>
  </div>
</div>
  </div>
  <div class="column">
    <div class="card">
  <div class="card-image">
    <figure class="image is-2by2">
      <img src="<%=request.getContextPath()%>/Images/4.jpg" alt="Placeholder image">
    </figure>
  </div>
  <div class="card-content">
    <div class="media">
     
      <div class="media-content">
        <p class="title is-4">Fish meal</p>
        <p class="subtitle is-6">$8.99</p>
      </div>
      
       <div class="media-right" >
        <figure class="image is-48x48">
          <img class="is-rounded" src="<%=request.getContextPath()%>/Images/cart.jpg" alt="Placeholder image">
        </figure>
      </div>
      
    </div>

    <div class="content">
      Abyssal fish & avocado & cucumber
      <br>
    </div>
  </div>
</div>
  </div>
  <div class="column">
    <div class="card">
  <div class="card-image">
    <figure class="image is-2by2">
      <img src="<%=request.getContextPath()%>/Images/5.jpg" alt="Placeholder image">
    </figure>
  </div>
  <div class="card-content">
    <div class="media">
     
      <div class="media-content">
        <p class="title is-4">Meal meal</p>
        <p class="subtitle is-6">$8.99</p>
      </div>
      
       <div class="media-right" >
        <figure class="image is-48x48">
          <img class="is-rounded" src="<%=request.getContextPath()%>/Images/cart.jpg" alt="Placeholder image">
        </figure>
      </div>
      
    </div>

    <div class="content">
      Abyssal fish & avocado & cucumber
      <br>
    </div>
  </div>
</div>
  </div>
  <div class="column">
    <div class="card">
 
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
</script>
</html>