<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Review Register Details</title>
</head>
<body>
<sql:setDataSource var="db" driver="com.mysql.jdbc.Driver"  
     url="jdbc:mysql://localhost:3306/flightreservation"  
     user="root"  
     password="root"/>

<form action="Register.jsp" method="post">
Full Name: <%=request.getParameter("FullName") %><br>
Address: <%=request.getParameter("Address") %><br>
Age:<%=request.getParameter("age") %><br>
mobile:<%=request.getParameter("mobile")%><br> 
Passenger Email: <%=request.getParameter("PassengerEmail") %><br>
Document Type: <%=request.getParameter("DocType") %><br>
Document Number: <%=request.getParameter("DocNumber") %><br>
Country: <%=request.getParameter("Country") %><br>
Total Guests: <%=request.getParameter("totalPassengers") %><br>
Total Price: <%=request.getParameter("totalPrice") %><br>
Flight Number: <%=request.getParameter("flightNumber") %><br>

<input type="hidden" value='<%=request.getParameter("FullName") %>' name="name">
<input type="hidden" value='<%=request.getParameter("Address") %>' name="address">
<input type="hidden" value='<%=request.getParameter("age") %>' name="Age">
<input type="hidden" value='<%=request.getParameter("mobile") %>' name="Mobile">
<input type="hidden" value='<%=request.getParameter("PassengerEmail") %>' name="passengerEmail">
<input type="hidden" value='<%=request.getParameter("DocType") %>' name="doctype">
<input type="hidden" value='<%=request.getParameter("DocNumber") %>' name="docnumber">
<input type="hidden" value='<%=request.getParameter("Country") %>' name="country">
<input type="hidden" value='<%=request.getParameter("totalPassengers") %>' name="Totalpassengers">
<input type="hidden" value='<%=request.getParameter("totalPrice") %>' name="TotalPrice">
<input type="hidden" value='<%=request.getParameter("flightNumber") %>' name="FlightNumber">
<input type="hidden" value='<%=request.getParameter("bookedSeats") %>' name="TotalBookedSeats">


<input type="submit" value="Register">

 
</form>


</body>
</html>