<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add User</title>

</head>
<body>
	<script type="text/javascript" src="jQuery.js">
		
	</script>
	<script type="text/javascript">
		$(document).ready(function() {
			$("table").css("margin-left", "25%");
		});
	</script>
	<div>
		<form action="addUser">
		<table>
					<tr>
						<td>User Name :</td>
						<td><input type = "text" id="username" name = "username"></td>
					</tr>
					<tr>
						<td>Password :</td>
						<td><input type = "password" id="password" name = "password"></td>
					</tr>
					<tr>
						<td>Password :</td>
						<td><input type = "password" id="confirmPassword" name = "confirmPassword"></td>
					</tr>
					<tr>
						<td></td>
						<td><input type = "submit" id="submit" value = "Add User"></td>
					</tr>
			</table>
		</form>
	</div>
</body>
</html>