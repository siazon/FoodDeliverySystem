<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
    <h1 class="hdiv">Menu Adjust</h1>
</center>
<div class="dv1">
    <c:if test="${users != null}">
    <form action="<%=request.getContextPath()%>/MenuServlet?action=update" method="post">
        </c:if>
        <c:if test="${users == null}">
        <form action="<%=request.getContextPath()%>/MenuServlet?action=new" method="post">
            </c:if>

 <div class="field is-horizontal">
                <div class="field-label is-normal">
                    <label class="label">FoodID:</label>
                </div>
                <div class="field-body">
                    <div class="field is-narrow">
                        <div class="control">
                            <input class="input" name="menuCategory" type="text"
                                   value="<c:out value='${menu.prodId}' />"
                                   placeholder="">
                        </div>

                    </div>
                </div>
            </div>

            <div class="field is-horizontal">
                <div class="field-label is-normal">
                    <label class="label">Category:</label>
                </div>
                <div class="field-body">
                    <div class="field is-narrow">
                        <div class="control">
                            <input class="input" name="menuCategory" type="text"
                                   value="<c:out value='${menu.menuCategory}' />"
                                   placeholder="">
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
                            <input class="input" name="itemName" type="text"
                                   value="<c:out value='${menu.itemName}' />"
                                   placeholder="">
                        </div>
                    </div>
                </div>
            </div>

             <div class="field is-horizontal">
                <div class="field-label is-normal">
                    <label class="label">Description:</label>
                </div>
                <div class="field-body">
                    <div class="field is-narrow">
                        <div class="control">
                            <input class="input" name=itemDescription type="text"
                                   value="<c:out value='${menu.itemDescription}' />"
                                   placeholder="">
                        </div>
                    </div>
                </div>
            </div>
            <div class="field is-horizontal">
                <div class="field-label is-normal">
                    <label class="label">Allergies:</label>
                </div>
                <div class="field-body">
                    <div class="field is-narrow">
                        <div class="control">
                            <input class="input" name="allergies" type="text"
                                   value="<c:out value='${menu.allergies}' />"
                                   placeholder="">
                        </div>
                    </div>
                </div>
            </div><div class="field is-horizontal">
                <div class="field-label is-normal">
                    <label class="label">Price:</label>
                </div>
                <div class="field-body">
                    <div class="field is-narrow">
                        <div class="control">
                            <input class="input" name="price" type="text"
                                   value="<c:out value='${menu.price}' />"
                                   placeholder="Numbers">
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