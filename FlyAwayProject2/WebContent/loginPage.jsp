<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link href="StyleSheet.css" rel="stylesheet" type="text/css">
</head>
<body>


<sql:setDataSource var="db" driver="com.mysql.jdbc.Driver"  
     url="jdbc:mysql://localhost:3306/flightreservation"  
     user="root"  
     password="root"/>
     
<form action="loginPage.jsp" method="post">
	
	<fieldset>
  <caption>User Email</caption> 	   
   <input type="text" name="UserEmail" required><br><br>
   <caption>Password</caption>
   <input type="password" name="pwd" maxlength="10" required><br><br>
  </fieldset>
  
  <fieldset>
  <input type="submit" value="Login">
  </fieldset>
  
  <c:if test="${param.UserEmail != null}">
	<sql:query dataSource="${db}" var="rs">  
		Select count(1) from UserLogin where UserName=? and Password=?
		<sql:param value="${param.UserEmail}" />   
		<sql:param value="${param.pwd}" />   
	</sql:query>
			<c:if test="${rs.rowsByIndex[0][0]==1}">
				<c:redirect url="SearchFlights.jsp"> </c:redirect>
			</c:if>
		<c:if test="${rs.rowsByIndex[0][0]==0}">
		<fieldset>
			<caption> Error:</caption>
			<font color="red">Invalid Credentials</font>
		</fieldset>
		</c:if>
	</c:if>
	
 </form>

</body>
</html>