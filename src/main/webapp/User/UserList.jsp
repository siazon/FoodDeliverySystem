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
            background-color: red;
            height: 100%;
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

        .hdiv {
            background-color: #f3f3f3;
        }

        .menudiv {
            margin: 0 0 10px 10px;
        }

    </style>
</head>
<body>
<center>
    <div class="hdiv">
        <h1>Employee Management</h1>
    </div>
    <div class="menudiv">
        <div class="field is-grouped">
            <p class="control">
                <input class="input" type="text" placeholder="Type Email or Name">
            </p>
            <p class="control">
                <a class="button is-info">
                    Search
                </a>
            </p>
        </div>
    </div>
</center>
<div class="maindiv" align="center">
    <table class="table" border="1" cellpadding="5">
        <caption>
        </caption>
        <tr>
            <th>Email</th>
            <th>Name</th>
            <th>Phone</th>
            <th>Role</th>
            <th>Operate</th>
        </tr>
        <c:forEach var="address" items="${listUser}">
            <tr>
                <td><c:out value="${address.user_email}"/></td>
                <td><c:out value="${address.user_name}"/></td>
                <td><c:out value="${address.user_phone}"/></td>
                <td><c:out value="${address.user_role}"/></td>
                <td><a
                        href="<%= request.getContextPath() %>/EmployeeManager?action=edit&user_email=<c:out value='${address.user_email}' />"
                >Edit</a> &nbsp;&nbsp;&nbsp;&nbsp; <a
                        href="<%= request.getContextPath() %>/EmployeeManager?action=delete&user_email=<c:out value='${address.user_email}' />"
                >Delete</a></td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>