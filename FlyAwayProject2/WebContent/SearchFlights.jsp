<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Search Flights</title>
</head>
<body>
<sql:setDataSource var="db" driver="com.mysql.jdbc.Driver"  
     url="jdbc:mysql://localhost:3306/flightreservation"  
     user="root"  
     password="root"/>
     
<form action="SearchFlights.jsp" method="post">

	<fieldset>
	<caption>Date of Travel</caption>
	<input type="date" name="TravelDate" required><br>
	</fieldset>
	<fieldset>
	<caption>Source City</caption>
	
<select name="SourceCity">
	<option value="Select">Select</option>
	<option value="Dehli">Dehli</option>
	<option value="Bombay">Bombay</option>
	<option value="Chennai">Chennai</option>
	<option value="Lahore">Lahore</option>
	</select><br> 
	<!-- <input type="text" name="SourceCity" required><br> -->
	</fieldset>
	<fieldset>
	<caption>Destination City</caption>
	
	 <select name="DestCity">
	<option value="Select">Select</option>
	<option value="Dehli">Dehli</option>
	<option value="Bombay">Bombay</option>
	<option value="Chennai">Chennai</option>
	<option value="Lahore">Lahore</option>
	</select><br>
	
	<!-- <input type="text" name="DestCity" required><br> -->
	</fieldset>
	<fieldset>
	<caption>No. Of Persons</caption>
	<input type="text" name="NoOfPersons" value="1"><br>
	<input type="submit" value="Search"><br>
	</fieldset>
	</form>
	
<sql:query dataSource="${db}" var="rs">  
	select airline_name, price,flight_no,source_city,destination_city,departure_time,arrival_time,
	total_seats,booked_seats,seat_availability,date_of_travel,travel_class
	From flight_details
	where date(departure_time) = ?
	and source_city = ? 
	and destination_city = ?
	<sql:param value="${param.TravelDate}" />    
	<sql:param value="${param.SourceCity}" />  
	<sql:param value="${param.DestCity}" /> 
	
</sql:query>  

 <br><br>
 
 <form>
 No of Passenger<c:out value='<%=request.getParameter("NoOfPersons")%>'></c:out>
 
 <c:set var="NoGuests" value='<%=request.getParameter("NoOfPersons")%>'/>  
 
<table border="2" width="100%">  

<tr>  
<th>Airline Name</th>  
<th>Price</th>  
<th>Source City</th>  
<th>Destination City</th>  
<th>Departure Time</th> 
<th>Arrival Time</th>  
<th>Total Seats</th> 
<th>Booked Seats</th> 
<th>Seat Availability</th>  
<th>Date of Travel</th>  
<th>Travel Class</th> 
<th>Reservation</th>
</tr>  

	<c:forEach var="table" items="${rs.rows}">  
	<tr>  
			<td>
			<c:out value="${table.airline_name}"/></td>  
			<td><c:out value="${table.price}"/></td>  
					
			<td><c:out value="${table.source_city}"/></td>  
			<td><c:out value="${table.destination_city}"/></td>  
			<td><c:out value="${table.departure_time}"/></td>  
			
			<td><c:out value="${table.arrival_time}"/></td> 
			<td><c:out value="${table.total_seats}"/></td>
			<td><c:out value="${table.booked_seats}"/></td>  
		
			<td><c:out value="${table.total_seats-table.booked_seats}"/></td>  
			 
			<td><c:out value="${table.date_of_travel}"/></td>  
			<td><c:out value="${table.travel_class}"/></td>
			<td><a href="RegisterDetails.jsp?flight=${table.flight_no}&price=${table.price}&guest=${NoGuests}&totalBookedSeats=${table.booked_seats}"><c:out value="${table.flight_no}"/></a></td>
			
		</tr>
	</c:forEach>  
</table>  
</form>
</body>
</html>
