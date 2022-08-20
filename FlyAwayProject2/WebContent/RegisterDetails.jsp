<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>     
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register Details</title>
</head>
<body>

Price: <%=request.getParameter("price") %> 
FlightNo: <%=request.getParameter("flight") %>
Guest : <c:out value='${param["guest"]}'></c:out>
BookedSeats : <c:out value='${param["totalBookedSeats"]}'></c:out>

<c:set var="totalAmount"  value='${param["guest"]*param["price"]}'/>

<form action="ReviewDeatails.jsp" method="post">
<fieldset>Full Name: 		<input type="text" name="FullName"></fieldset>
<fieldset>Address: 			<input type="text" name="Address"></fieldset>
<fieldset>Age: 				<input type="date" name="age"></fieldset>
<fieldset>Mobile: 			<input type="text" name="mobile"></fieldset>
<fieldset>Email: 			<input type="email" name="PassengerEmail"></fieldset>
<fieldset>Document Type: 	<input type="text" name="DocType"></fieldset>
<fieldset>Document Number:  <input type="text" name="DocNumber"></fieldset>
<fieldset>Country:<input type="text" name="Country"></fieldset>

<input type="hidden" value='${param["price"]}' name="seatPrice">
<input type="hidden" value='${param["flight"]}' name="flightNumber">
<input type="hidden" value='${param["guest"]}' name="totalPassengers">
<input type="hidden" value='${totalAmount}' name="totalPrice">
<input type="hidden" value='${param["guest"]+param["totalBookedSeats"]}' name="bookedSeats"> 


Total Amount: <input type="text" value='${param["guest"]*param["price"]}' name="totalAmount">

<fieldset><input type="submit" value="Review"></fieldset> 

</form>

</body>
</html>