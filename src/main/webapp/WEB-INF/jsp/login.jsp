<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
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
<body>
	<script type="text/javascript" src="jQuery.js">
		
	</script>
	<script type="text/javascript">
		$(document).ready(function() {
			$("h2").css("text-align", "center");
		});
	</script>
	<h2>College Management Services</h2>
	<hr>
	<div
		style="border: 2px solid black; margin-left: 25%; text-align: center; padding: 4px; width: 50%;">
		<h3>Login</h3>
		<hr>
		<div>


			<div id="error" style="color: red; text-align: center">
				<%
				if(session.getAttribute("error")!=null)
				{
				%>
					<%= session.getAttribute("error") %>
				<%
				}
			%>
			</div>


			<div id="message" style="color: green; text-align: center">
				<%
				if(session.getAttribute("message")!=null)
				{
				%>
					<%= session.getAttribute("message") %>
				<%
				}
			%>
			</div>



			<form action="login" method="POST" name="userLogin"
				onsubmit="return validate()">
				<table style="margin-left: 25%">
					<tr>
						<td>User Name :</td>
						<td><input type="text" name="userId" id="userId" /><br></td>
					</tr>
					<tr>
						<td>Password :</td>
						<td><input type="password" id="password" name="password" /><br></td>
					</tr>
					<tr>
						<td></td>
						<td><a href="forgotpassword" id="forgotPassLink">Forgot
								Password</a> <a href="register" id="registerLink"> Register </a></td>
					</tr>
					<tr>
						<td></td>
						<td><input type="submit" id="login" value="Login" /></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	<script type="text/javascript">
		function validate() {
			document.getElementById("error").style.display = "none";
			var userId = document.getElementById("userId");
			var password = document.getElementById("password");

			var re = /^([a-zA-Z0-9]){6,10}$/;
			var passw = /(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[!#$%&? @"]).{8,16}/;
			if (userId.value.trim().length <= 0) {
				document.getElementById("error").style.display = "block";
				document.getElementById("error").innerHTML = "User Id is mandatory";
				return false;
			}

			else if (password.value.trim().length <= 0) {
				document.getElementById("error").style.display = "block";
				document.getElementById("error").innerHTML = "Password is mandatory";
				return false;
			} else if (!re.test(userId.value)) {
				document.getElementById("error").style.display = "block";
				document.getElementById("error").innerHTML = "User Id must be alphanumeric and should contain 6 - 10 characters";
				return false;
			} else if (!passw.test(password.value)) {
				document.getElementById("error").style.display = "block";
				document.getElementById("error").innerHTML = "Password must contain at least one number, one special character, one uppercase, one lowercase letter, one special char and should contain 8 - 16 characters"
				return false;
			} else
				return true;
		}
	</script>

</body>



</html>