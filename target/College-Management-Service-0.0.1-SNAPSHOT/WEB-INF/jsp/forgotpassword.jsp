<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Forgot Password</title>

<style type="text/css">
	div.dimen
	{
		border: 2px solid black; margin-left: 25%; text-align: center; padding: 4px; width: 50%;
		margin-top:5%;
	}
	input {
	margin: 10px;
}

table {
	width: auto;
	height: auto;
}
</style>
</head>
<body>
	<script type="text/javascript" src="jQuery.js">
		
	</script>
	<script type="text/javascript">
		$(document).ready(function() {
			$("table").css("margin-left", "25%");
		});
	</script>
	<script type="text/javascript">
		function validateEntries(form)
		{

			var re = /^([a-zA-Z0-9]){6,10}$/;
			var pet = /[a-z]/;
			var userId = document.getElementById("userId");
			var petName = document.getElementById("petname");
			if (userId.value.length ==0) {
				document.getElementById("error").style.display = "block";
				document.getElementById("error").innerHTML = "User Id is mandatory";
				return false;
			} else if (!re.test(userId.value)) {
				document.getElementById("error").style.display = "block";
				document.getElementById("error").innerHTML = "User Id must be alphanumeric and should contain 6 - 10 characters";
				return false;
			} else if (petName.value.trim().length <= 0) {
				document.getElementById("error").style.display = "block";
				document.getElementById("error").innerHTML = "Pet Name is mandatory";
				return false;
			} else if (petName.value.trim().length < 3 || petName.value.trim().length > 10) {
				document.getElementById("error").style.display = "block";
				document.getElementById("error").innerHTML = "Pet Name must be at least 3 - 10 characters long";
				return false;
			} else if (!pet.test(petName.value)) {
				document.getElementById("error").style.display = "block";
				document.getElementById("error").innerHTML = "Pet name should be alphabets";
				return false;
			}

			else {
				return true;
			}
		}

		function submitForm(form) {
			if (document.getElementsByName("action")[0].value == "Cancel") {
				form.action = "cancel";
				return true;
			} else if (document.getElementsByName("action")[0].value == "Validate") {
				form.action = "forgotpassword";
				form.method = "POST";
				return validateEntries(form);
			}
		}
		function validate() {
			var pwd = document.getElementById("password").value;
			var cnfPwd = document.getElementById("confirmPassword").value;
			var passw = /(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[!#$%&? @"]).{8,}/;

			if (pwd.length <= 0) {
				document.getElementById("errorMsg").style.display = "block";
				document.getElementById("errorMsg").innerHTML = "Password is mandatory";
				return false;
			} else if (cnfPwd.length <= 0) {
				document.getElementById("errorMsg").style.display = "block";
				document.getElementById("errorMsg").innerHTML = "Confirm Password is mandatory";
				return false;
			} else if (!passw.test(pwd)) {
				document.getElementById("errorMsg").style.display = "block";
				document.getElementById("errorMsg").innerHTML = "Password must contain at least one number, one uppercase, one lowercase letter, and at least 8 or more characters";
				return false;
			} else if (!passw.test(cnfPwd)) {
				document.getElementById("errorMsg").style.display = "block";
				document.getElementById("errorMsg").innerHTML = "Password must contain at least one number, one uppercase, one lowercase letter, one special char and at least 8 or more characters"
				return false;
			} else if (pwd == cnfPwd) {
				return true;
			}
			return false;
		}
	</script>
	<div class = "dimen">
	<h3>Forgot Password</h3>
	<form method="POST" onsubmit="return submitForm(this)">
		<div id = "error" style = "float: center; color: #ff0000; text-align: center;">
		${error}
		</div>
		<table>
			<tr>
				<td>User Id :</td>
				<td><input type="text" name="userId" id="userId" /><br></td>
			</tr>
			<tr>
				<td>What's your pet's name? :</td>
				<td><input type="text" id="petname" name="petname" /><br></td>
			</tr>

			<tr>
				<td></td>
				<td>
					<input type="submit" id="validate" value="Validate" name = "action" />
				</td>
			</tr>
		</table>
	</form>
	
	<c:if test ='${resetPwd.equals("true")}'>
		<script type="text/javascript">
			document.getElementById("userId").value = `${userId}`;
			document.getElementById("petname").value = `${petname}`;	
		</script>
		
		<h3>Reset Password</h3>
		<form action="resetpassword" method="POST" onsubmit = "return validate()">
		<div id = "errorMsg" style = "float: center; color: red">${errorMsg}</div>
		<table>
			<tr>
				<td>New Password: </td>
				<td><input type="password" name="password" id="password" /><br></td>
			</tr>
			<tr>
				<td>Confirmation Password:</td>
				<td><input type="password" id="confirmPassword" name="confirmPassword" /><br></td>
			</tr>

			<tr>
				<td></td>
				<td><input type="submit" id="reset" value="Reset" onsubmit="return validate()"/></td>
			</tr>
		</table>
		</form>
		</div>
	</c:if>
	
</body>
</html>