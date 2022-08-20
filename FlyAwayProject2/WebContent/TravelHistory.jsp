<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>  
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Travel History</title>
</head>
<body>
Welcome: <%=request.getParameter("username")%>
<br><br>
<form action="TravelHistory.jsp" method="post">
<fieldset>
Passenger Name:  <input type="text" name="Passenger">
<input type="submit" value="SearchPassenger">
</fieldset>
</form>

<!-- sql:setDataSource tag -->
<sql:setDataSource var="db" driver="com.mysql.jdbc.Driver"  
     url="jdbc:mysql://localhost:3306/flightreservation"
     password="root"/>  

<% String data=request.getParameter("Passenger");
%>

<!--   test_123@gmail.com  --> 
<!-- sql:query  tag --> 

<sql:query dataSource="${db}" var="rs">  
	SELECT booking_id, email_id,flight_no from booking
	where email_id = ?
	<sql:param value="${param.Passenger}" />   
</sql:query>  
 <br><br>
<table border="2" width="100%">  
<tr>  
<th>Booking Id</th>  
<th>Passenger Name</th>  
<th>Flight No</th>  
</tr>  
	<c:forEach var="table" items="${rs.rows}">  
		<tr>  
			<td><c:out value="${table.booking_id}"/></td>  
			<td><c:out value="${table.email_id}"/></td>  
			<td><c:out value="${table.flight_no}"/></td>  
	   </tr>  
	</c:forEach>  
</table>  

</body>
</html>