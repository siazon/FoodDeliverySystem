<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html>
<html>
<head>
<title> Menu Items</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.3/css/bulma.min.css">
    <style>
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
<header>

				</header>
				
				<div >
					
					<div >
					
					
					   <div class="hdiv">
        <h1>Menu Management</h1>
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
             <p class="control">
                <a class="button is-info" href="<%=request.getContextPath() %>/MenuAdjust.jsp">
                    Add
                </a>
            </p>
        </div>
    </div>
						<table class="table">
							<thead>
								<tr>
									<th>ProdId</th>
									<th>Menu Category</th>
									<th>Item Name</th>
									<th>Item Description</th>
									<th>Allergies</th>
									<th>Price</th>
									<th>Actions</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="MenuItem" items="${listMenu}">
								
									<tr>
									<td><c:out value="${MenuItem.prodId}"/></td>
									<td><c:out value="${MenuItem.menuCategory}"/></td>
									<td><c:out value="${MenuItem.itemName}"/></td>
									<td><c:out value="${MenuItem.itemDescription}"/></td>
									<td><c:out value="${MenuItem.allergies}"/></td>
									<td><c:out value="${MenuItem.price}"/></td>
									<td><a href="<%= request.getContextPath() %>/MenuServlet?action=edit&id=<c:out value='${MenuItem.prodId}' />">Edit</a>
										&nbsp;&nbsp;&nbsp;&nbsp; 
										<a href="delete?id=<c:out value='${staffMenuAdjust.foodId}' />">Delete</a></td>
									</tr>
									</c:forEach>
							</tbody>	
							
						</table>
					</div>
				
				</div>
				
</div>				
</body>
</html>