<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<center>
		<h1>Address Management</h1>
       
	</center>
    <div align="center">
		<c:if test="${address != null}">
			<form action="<%= request.getContextPath() %>/AddressManager?action=update" method="post">
        </c:if>
        <c:if test="${address == null}">
			<form action="<%= request.getContextPath() %>/AddressManager?action=new" method="post">
        </c:if>
        <table border="1" cellpadding="5">
            <caption>
            	<h2>
            		<c:if test="${address != null}">
            			Edit Address
            		</c:if>
            		<c:if test="${address == null}">
            			Add New Address
            		</c:if>
            	</h2>
            </caption>
        		<c:if test="${address != null}">
        			<input type="hidden" name="address_id" value="<c:out value='${address.address_id}' />" />
        		</c:if>   
        		 <tr>
                <th>User Email: </th>
                <td>
                	<input type="text" name="user_email" size="45" readonly="readonly"
                			value="<c:out value='<%= request.getParameter("user_email")%>' />"
                		/>
                </td>
            </tr>         
            <tr>
                <th>County: </th>
                <td>
                	<input type="text" name="county" size="45"
                			value="<c:out value='${address.county}' />"
                		/>
                </td>
            </tr>
            <tr>
                <th>Street: </th>
                <td>
                	<input type="text" name="street" size="45"
                			value="<c:out value='${address.street}' />"
                	/>
                </td>
            </tr>
            <tr>
                <th>Address: </th>
                <td>
                	<input type="text" name="address" size="45"
                			value="<c:out value='${address.address}' />"
                	/>
                </td>
            </tr>
            <tr>
            <tr>
                <th>Address: </th>
                <td>
                	<input type="text" name="phone" size="45"
                			value="<c:out value='${address.phone}' />"
                	/>
                </td>
            </tr>
            <tr>
            	<td colspan="2" align="center">
            		<input type="submit" value="Save" />
            	</td>
            </tr>
        </table>
        </form>
    </div>
</body>
</html>