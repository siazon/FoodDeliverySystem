<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	cursor:pointer;
}

.button-success {
	background: rgb(28, 184, 65); /* this is a green */
}
</style>
</head>
<body>

	<center>
		<h1>Food Management</h1>
       
	</center>
    <div align="center">
		<c:if test="${address != null}">
			<form action="<%= request.getContextPath() %>/FoodManager?action=update" method="post">
        </c:if>
        <c:if test="${address == null}">
			<form action="<%= request.getContextPath() %>/FoodManager?action=new" method="post">
        </c:if>
        <table border="1" cellpadding="5">
            <caption>
            	<h2>
            		<c:if test="${address != null}">
            			Edit Food
            		</c:if>
            		<c:if test="${address == null}">
            			Add New Food
            		</c:if>
            	</h2>
            </caption>
        		<c:if test="${address != null}">
        			<input type="hidden" name="id" value="<c:out value='${address.id}' />" />
        		</c:if>   
        		 <tr>
                <th>Name: </th>
                <td>
                	<input type="text" name="food_name" size="45" readonly="readonly"
                			value="<c:out value='<%= request.getParameter("food_name")%>' />"
                		/>
                </td>
            </tr>         
            <tr>
                <th>Price: </th>
                <td>
                	<input type="text" name="price" size="45"
                			value="<c:out value='${address.county}' />"
                		/>
                </td>
            </tr>
            <tr>
                <th>Stock: </th>
                <td>
                	<input type="text" name="stock" size="45"
                			value="<c:out value='${address.street}' />"
                	/>
                </td>
            </tr>
            <tr>
                <th>description: </th>
                <td>
                	<input type="text" name="description" size="45"
                			value="<c:out value='${address.address}' />"
                	/>
                </td>
            </tr>
            <tr>
            <tr>
                <th>Phone: </th>
                <td>
                	<input type="text" name="phone" size="45"
                			value="<c:out value='${address.phone}' />"
                	/>
                </td>
            </tr>
            
        </table>
            		<input type="submit" value="Save" class="button-success pure-button"/>
            		<input onclick="cancelEdit()" type="button" value="Cancel" class="button-success pure-button" />
        </form>
    </div>
</body><script>
    function cancelEdit(){
    	//alert("displayLogin is click");
    	history.back(-1) }
</script>
</html>