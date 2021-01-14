<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>

<style type="text/css">
input {
	margin: 10px;
}

table {
	width: auto;
	height: auto;
}

a {
	padding-bottom: 1px;
	padding-top: 1px;
	padding-left: 4px;
	padding-right: 4px;
	margin: 8px;
	font-size: medium;
	font-family: serif;
}
</style>

</head>

<%
	if (session.getAttribute("userId") != null) {
		request.getRequestDispatcher("home.jsp").forward(request, response);
	} else {
%>
<body>
	<script type="text/javascript" src="jQuery.js">
		
	</script>
	<script type="text/javascript">
		$(document).ready(function() {
			$("h2").css("text-align", "center");
		});
	</script>
	<h2>Timesheet</h2>
	<hr>
	<div
		style="border: 2px solid black; margin-left: 25%; text-align: center; padding: 4px; width: 50%;">
		<h3>Login</h3>
		<hr>
		<div>
			<div id="error" style="color: red; text-align: center">
				${error}</div>
			<div id="message" style="color: green; text-align: center">
				${message}</div>
			<form action="timesheet/user/login" method="POST" name="userLogin"
				onsubmit="return validate()">
				<table style="margin-left: 25%">
					<tr>
						<td>User Name :</td>
						<td><input type="text" name="userName" id="userName" /><br></td>
					</tr>
					<tr>
						<td>Password :</td>
						<td><input type="password" id="password" name="password" /><br></td>
					</tr>
					<tr>
						<td></td>
						<td><a href="forgotpassword" id="forgotPassLink">Forgot
								Password</a>
					</tr>
					<tr>
						<td></td>
						<td><input type="submit" id="login" value="Login" /></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
<%
	}
%>
<script type="text/javascript">
	function validate() {
		document.getElementById("error").style.display = "none";
		var userId = document.getElementById("userId");
		var password = document.getElementById("password");

		var re = /[a-z][0-9]/;
		var passw = /(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[!#$%&? @"]).{8,}/;
		if (userId.value.trim().length <= 0) {
			document.getElementById("error").style.display = "block";
			document.getElementById("error").innerHTML = "User Id is mandatory";
			return false;
		}

		else if (password.value.trim().length <= 0) {
			document.getElementById("error").style.display = "block";
			document.getElementById("error").innerHTML = "Password is mandatory";
			return false;
		} else
			return true;
	}
</script>

</html>