<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@include file="Header.jsp" %>
<div class="staff_container">
		<div class="header">
				<a href="index.jsp"><img src="./images/logo.png"></img></a>
				<ul class="nav">
						<li>
								<a href="./UserRegistion.jsp">Registration</a>
						</li>
						<li>
								<a href="#">Check-in</a>
						</li>
						<li>
								<a href="#">Check-out</a>
						</li>
						<li>
								<a href="./allRooms.xhtml">Room Check</a>
						</li>
						<li>
								<a class="adjust" target="_self" href="./roomPriceAdjustment.xhtml">Adjust room price</a>
						</li>
						<li>
								<a href="#">Logout</a>
						</li>
				</ul>
		</div>

		<div class="left_nav">
			<ul class="nav">
					<li>
							<a href="./staffDashboard.jsp">Staff Dashboard</a>
					</li>
			</ul>
	</div>
		<div class="container">
			<h:form>
				<p:messages/>
				<p:outputLabel value="Name: " />
				<p:inputText value="#{roomBookingBean.roomNo}" />        
				<p:outputLabel value="Decription: " />
				<p:inputText value="#{roomBookingBean.roomNo}" />
				<p:outputLabel value="Allergies: " />
				<p:inputText value="#{roomBookingBean.roomNo}" />
				
				
				<p:outputLabel value="Price: " />
				<p:inputText value="#{roomBookingBean.price}" />
				<p:commandButton value="Update" action="#{roomBookingBean.adjustRoomPrice}" ajax="false" />
			</h:form>
		</div>

<%@include file ="Footer.jsp" %>
		<div class="footer">
				<a href="index.jsp"><img src="./images/logo.png"></img></a>
				<div class="logo">
						<p>Copyright©TUS</p>
				</div>
		</div>
</div>

</body>
</html>