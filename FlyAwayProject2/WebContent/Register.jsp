<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register</title>
</head>
<body>


<sql:setDataSource var="db" driver="com.mysql.jdbc.Driver"  
     url="jdbc:mysql://localhost:3306/flightreservation"  
     user="root"  
     password="root"/>

<form action="Confirmation.jsp" method="post">

Total Amount : <%=request.getParameter("TotalPrice") %><br>
Total Passenger : <%=request.getParameter("Totalpassengers") %><br>
Flight Number : <%=request.getParameter("FlightNumber") %><br>
Passenger Email: <%=request.getParameter("passengerEmail") %><br>

<input type="submit" value="Proceed For Payment">

<c:set var="booked" value='<%=request.getParameter("TotalBookedSeats") %>'></c:set>
<c:set var="current" value='<%=request.getParameter("Totalpassengers") %>'></c:set>

<input type="hidden" value='<%=request.getParameter("Totalpassengers") %>' name="totalpassengers">
<input type="hidden" value='<%=request.getParameter("TotalPrice") %>' name="totalPrice">
<input type="hidden" value='<%=request.getParameter("FlightNumber") %>' name="flightNumber">
<input type="hidden" value='<%=request.getParameter("passengerEmail") %>' name="PassengerEmail">
<input type="hidden" value='<%=request.getParameter("bookedSeats") %>' name="TotalBookedSeats">
 

</form>

<c:set var="passName" value='<%=request.getParameter("name") %>'></c:set>
<c:set var="passAddress" value='<%=request.getParameter("address") %>'></c:set>
<c:set var="passAge" value='<%=request.getParameter("Age") %>'></c:set>
<c:set var="passMobile" value='<%=request.getParameter("Mobile") %>'></c:set>

<c:set var="passEmail" value='<%=request.getParameter("passengerEmail") %>'></c:set>
<c:set var="passDocType" value='<%=request.getParameter("doctype") %>'></c:set>
<c:set var="passDocNumber" value='<%=request.getParameter("docnumber")%>'></c:set>
<c:set var="passCountry" value='<%=request.getParameter("country")%>'></c:set> 

<c:set var="cardNumber" value='<%=request.getParameter("CardNumber")%>'></c:set>
<c:set var="expirydate" value='<%=request.getParameter("ExpiryDate")%>'></c:set>


<c:if test="${passEmail != null}">

<sql:update dataSource="${db}" var="count">  
	 INSERT INTO register_details(Full_Name,Address,Birth_Date,mobile,email_id,Document_Type,Document_number,country)Values(?,?,?,?,?,?,?,?)
	<sql:param value="${passName}" />
	<sql:param value="${passAddress}" />
	<sql:param value="${passAge}" /> 
	<sql:param value="${passMobile}" />
	<sql:param value="${passEmail}" />  
	<sql:param value="${passDocType}" />
	<sql:param value="${passDocNumber}" />
	<sql:param value="${passCountry}" />  
</sql:update>

</c:if>

<c:if test="${count >= 1}">
<font size="5" color='green'> Registration done Successfully Proceed for payment please.</font>
</c:if>


</body>
</html>