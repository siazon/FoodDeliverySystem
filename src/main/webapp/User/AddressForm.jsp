<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.3/css/bulma.min.css">
<style>

 .hdiv {
            background-color: #f3f3f3;
        }  h1 {
            text-align: left;
            margin: 0 0 10px 10px;
            padding: 10px;
        }
</style>
</head>
<body>

	<center>
		<h1 class="hdiv">Address Management</h1>
       
	</center>
    <div align="center">
		<c:if test="${address != null}">
			<form action="<%= request.getContextPath() %>/AddressManager?action=update" method="post">
        </c:if>
        <c:if test="${address == null}">
			<form action="<%= request.getContextPath() %>/AddressManager?action=new" method="post">
        </c:if>
        
         <c:if test="${address != null}">
        			<input type="hidden" name="address_id" value="<c:out value='${address.address_id}' />" />
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
                    <label class="label">County:</label>
                </div>
                <div class="field-body">
                    <div class="field is-narrow">
                        <div class="control">
                            <input class="input" name="county" type="text"
                                   value="<c:out value='${address.county}' />"
                                   placeholder="e.g. Partnership opportunity">
                        </div>

                    </div>
                </div>
            </div>
        		
        		 <div class="field is-horizontal">
                <div class="field-label is-normal">
                    <label class="label">Street:</label>
                </div>
                <div class="field-body">
                    <div class="field is-narrow">
                        <div class="control">
                            <input class="input" name="street" type="text"
                                   value="<c:out value='${address.street}' />"
                                   placeholder="e.g. Partnership opportunity">
                        </div>

                    </div>
                </div>
            </div>
        		
        		 <div class="field is-horizontal">
                <div class="field-label is-normal">
                    <label class="label">Address:</label>
                </div>
                <div class="field-body">
                    <div class="field is-narrow">
                        <div class="control">
                            <input class="input" name="address" type="text"
                                   value="<c:out value='${address.address}' />"
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
                            <input class="input" name="phone" type="text"
                                   value="<c:out value='${address.phone}' />"
                                   placeholder="e.g. Partnership opportunity">
                        </div>

                    </div>
                </div>
            </div>
            
        <!-- 
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
                <th>Phone: </th>
                <td>
                	<input type="text" name="phone" size="45"
                			value="<c:out value='${address.phone}' />"
                	/>
                </td>
            </tr>
            
        </table> -->
            		<input class="button  is-link" type="submit" value="Save" class="button-success pure-button"/>
            		<input class="button  is-link is-light" onclick="cancelEdit()" type="button" value="Cancel" class="button-success pure-button" />
        </form>
    </div>
</body><script>
    function cancelEdit(){
    	//alert("displayLogin is click");
    	history.back(-1) }
</script>
</html>