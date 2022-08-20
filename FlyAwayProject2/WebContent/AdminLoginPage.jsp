<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Page</title>
</head>
<body>

<form method="post" action="TravelHistory">
            UserName : <input type="text" name="username" /><br>
            Password : <input type="password" name="password" /><br>
            		<input type="submit" value="Login">
         </form>
        <form action="Changepass.jsp" method="post">
				<input type="submit" value="ChangePassword">
		</form>  

</body>
</html>