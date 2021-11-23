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
        h1 {
            text-align: left;
            margin: 0 0 10px 0px;
            padding: 10px;
        }

        .hdiv {
            background-color: #f3f3f3;
        }

        .dv1 {
            width: 600px;
            position: absolute;
            top: 80px;
            left: 0px;
            right: 0px;
            bottom: 0px;
            margin: auto;
        }

    </style>
</head>
<body>
<center>
    <h1 class="hdiv">User Management</h1>
</center>
<div class="dv1">
    <c:if test="${users != null}">
    <form action="<%=request.getContextPath()%>/EmployeeManager?action=update" method="post">
        </c:if>
        <c:if test="${users == null}">
        <form action="<%=request.getContextPath()%>/EmployeeManager?action=new" method="post">
            </c:if>

            <div class="field is-horizontal">
                <div class="field-label is-normal">
                    <label class="label">Email:</label>
                </div>
                <div class="field-body">
                    <div class="field is-narrow">
                        <div class="control">
                            <input class="input" name="user_email" type="text"
                                   value="<c:out value='<%=request.getParameter("user_email")%>' />"
                                   placeholder="e.g. Partnership opportunity">
                        </div>

                    </div>
                </div>
            </div>

            <div class="field is-horizontal">
                <div class="field-label is-normal">
                    <label class="label">Name:</label>
                </div>
                <div class="field-body">
                    <div class="field is-narrow">
                        <div class="control">
                            <input class="input" name="user_name" type="text"
                                   value="<c:out value='${users.user_name}' />"
                                   placeholder="e.g. Partnership opportunity">
                        </div>
                    </div>
                </div>
            </div>

            <div class="field is-horizontal">
                <div class="field-label is-normal">
                    <label class="label">Phone:</label>
                </div>
                <div class="field-body">
                    <div class="field is-narrow">
                        <div class="control">
                            <input class="input" name="user_phone" type="text"
                                   value="<c:out value='${users.user_phone}' />"
                                   placeholder="e.g. Partnership opportunity">
                        </div>
                    </div>
                </div>
            </div>

            <div class="field is-horizontal">
                <div class="field-label is-normal">
                    <label class="label">Status:</label>
                </div>
                <div class="field-body">
                    <div class="field is-narrow">
                        <div class="control">
                            <div class="select is-fullwidth">
                                <select name="user_status">
                                    <%
                                        List list = new ArrayList();
                                        list.add("Working");
                                        list.add("Holiday");
                                        list.add("Business");
                                        User user = (User) request.getAttribute("users");
                                        for (int i = 0; i < list.size(); i++) {
                                            if (list.get(i).equals(user.getUser_status())) {
                                    %>
                                    <option selected="selected" value="<%=list.get(i) %>"><%=list.get(i) %>
                                    </option>
                                    <%
                                    } else {
                                    %>
                                    <option value="<%=list.get(i) %>"><%=list.get(i) %>
                                    </option>
                                    <%
                                            }
                                        }
                                    %>

                                </select>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="field is-horizontal">
                <div class="field-label is-normal">
                    <label class="label">Role:</label>
                </div>
                <div class="field-body">
                    <div class="field is-narrow">
                        <div class="control">
                            <div class="select is-fullwidth">
                                <select name="user_role">
                                    <%
                                        List rolelist = new ArrayList();
                                        rolelist.add("Customer");
                                        rolelist.add("Staff");
                                        for (int i = 0; i < rolelist.size(); i++) {
                                            if (rolelist.get(i).equals(user.getUser_role())) {
                                    %>
                                    <option selected="selected" value="<%=rolelist.get(i) %>"><%=rolelist.get(i) %>
                                    </option>
                                    <%
                                    } else {
                                    %>
                                    <option value="<%=rolelist.get(i) %>"><%=rolelist.get(i) %>
                                    </option>
                                    <%
                                            }
                                        }
                                    %>

                                </select>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <input type="submit" value="Save" style="margin:0 0 0 20%" class="button is-link"/>
            <input onclick="cancelEdit()" type="button"  value="Cancel" class="button is-link is-light"/>
        </form>
</div>
</body>
<script>
    function cancelEdit() {
        //alert("displayLogin is click");
        history.back(-1)
    }
</script>
</html>