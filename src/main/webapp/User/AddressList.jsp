<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="com.model.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Insert title here</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.3/css/bulma.min.css">
    <style>
        .maindiv {
            height: 100%; margin: 10px 0 0 0;
        }
 table {
            height: 100%;
            width: 100%;
        }
        h1 {
            text-align: left;
            margin: 0 0 10px 10px;
            padding: 10px;
        }
 .menudiv {
            margin: 0 0 10px 10px;
        }
        .hdiv {
            background-color: #f3f3f3;
        }
    </style>
</head>
<body>
<center>
    <%
        String email = request.getParameter("user_email");
        if (email == null) {
            List<UserAddress> addresss = (List<UserAddress>) request.getAttribute("listAddress");
            for (int i = 0; i < addresss.size(); i++) {
                email = addresss.get(i).getUser_email();
            }
        }
    %>
    <div class="hdiv">
        <h1>Address Management</h1>
    </div>
    <div class="menudiv">
        <div class="field is-grouped">
            <p class="control">
                <input class="input" type="text" placeholder="Type Email or Name">
            </p>
            <p class="control">
                <a class="button is-info"
                   href="<%=request.getContextPath()%>/AddressManager?action=list&user_email=<%=email%>">
                    Search
                </a>
            </p>
            <p class="control">
                <a class="button is-info"
                   href="<%=request.getContextPath()%>/User/AddressForm.jsp?user_email=<%=email%>">
                    Add
                </a>
            </p>
        </div>
</center>
<div class="maindiv" align="center">
    <table class="table" border="1" cellpadding="5">
        <caption>
        </caption>
        <tr>
            <th>ID</th>
            <th>Email</th>
            <th>County</th>
            <th>Street</th>
            <th>Address</th>
            <th>Phone</th>
            <th>Operate</th>
        </tr>
        <c:forEach var="address" items="${listAddress}">
            <tr>
                <td><c:out value="${address.address_id}"/></td>
                <td><c:out value="${address.user_email}"/></td>
                <td><c:out value="${address.county}"/></td>
                <td><c:out value="${address.street}"/></td>
                <td><c:out value="${address.address}"/></td>
                <td><c:out value="${address.phone}"/></td>
                <td><a
                        href="<%= request.getContextPath() %>/AddressManager?action=edit&user_email=<c:out value='${address.user_email}' />&address_id=<c:out value='${address.address_id}' />"
                >Edit</a> &nbsp;&nbsp;&nbsp;&nbsp; <a
                        href="<%= request.getContextPath() %>/AddressManager?action=delete&user_email=<c:out value='${address.user_email}' />&address_id=<c:out value='${address.address_id}' />"
                >Delete</a></td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>