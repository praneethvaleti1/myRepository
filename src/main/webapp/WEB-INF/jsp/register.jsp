<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register</title>

<style type="text/css">
input, select {
	margin: 10px;
}

table {
	width: 75%;
	height: auto;
	text-align: center;
}

div.dimen {
	border: 2px solid black;
	margin-left: 25%;
	text-align: center;
	padding: 4px;
	width: 50%;
}

tr, td {
	margin: 4px;
}
</style>
</head>
<body>
	<script type="text/javascript" src="jQuery.js">
		
	</script>
	<script type="text/javascript">
		$(document).ready(function() {
			$("div#error").css("float", "enter");
			$("div#error").css("color", "red");
		});
	</script>
	<div class="dimen">
		<h3 id="heading">User Registration</h3>

		<hr>
		<form action="register" method="POST" onsubmit="return validate()">
			<div id="error">${error}</div>
			<div>
				<table style="text-align: center;">
					<tr>
						<td><label>User Id</label></td>
						<td><input type="text" id="userId" name="userId"></td>
					</tr>
					<tr>
						<td><label>Name</label></td>
						<td><input type="text" id="name" name="name"></td>
					</tr>
					<tr>
						<td><label>Age</label></td>
						<td><input type="number" id="age" name="age"></td>
					</tr>
					<tr>
						<td><label>Password</label></td>
						<td><input type="password" id="password" name="password"></td>
					</tr>
					<tr>
						<td><label>Pet Name</label></td>
						<td><input type="text" id="petname" name="petname"></td>
					</tr>
					<tr>
						<td><label>Gender</label></td>
						<td><select id="gender" style="width: 180px" name="gender">
								<option value="Male">Male</option>
								<option value="Female">Female</option>
						</select></td>
					</tr>
					<tr>
						<td><label>Department</label></td>
						<td><select id="department" style="width: 180px"
							name="department">
								<option value="Computer Science">Computer Science</option>
								<option value="Information and technology">Information
									and technology</option>
						</select></td>
					</tr>

					<tr>
						<td><label>Semester</label></td>
						<td><select id="semester" style="width: 180px"
							name="semester">
								<option value="Semester-01">Semester-01</option>
								<option value="Semester-02">Semester-02</option>
								<option value="Semester-03">Semester-03</option>
						</select></td>
					</tr>
					<tr>
						<td></td>
						<td><input type="submit" id="register" name="submit"
							value="Register"></td>
					</tr>
				</table>
			</div>
		</form>
	</div>
	<script type="text/javascript">
		function validate()
		{
			document.getElementById("error").style.display = "none";
			var userId = document.getElementById("userId");
			var firstName = document.getElementById("name");
			var password = document.getElementById("password");
			var age = document.getElementById("age");
			var petName = document.getElementById("petname");

			var re = /^([a-zA-Z0-9]){6,10}$/;
			var name = /^[a-zA-Z]+$/;
			var passw = /(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[!#$%&? @"]).{8,16}/;
			
			if (userId.value.trim().length <= 0) {
				document.getElementById("error").style.display = "block";
				document.getElementById("error").innerHTML = "User Id is mandatory";
				return false;
			}
			
			else if (!re.test(userId.value)) {
				document.getElementById("error").style.display = "block";
				document.getElementById("error").innerHTML = "User Id must be alphanumeric and should contain 6 - 10 characters";
				return false;
			} else if (firstName.value.trim().length <= 0) {
				document.getElementById("error").style.display = "block";
				document.getElementById("error").innerHTML = "Name is mandatory";
				return false;
			}
			else if(firstName.value.length<3 || firstName.value.length>20 ) {
				document.getElementById("error").style.display = "block";
				document.getElementById("error").innerHTML = "Name must be at least 3 - 20 characters long";
				return false;
			}	
			else if(!name.test(firstName.value)) {
				document.getElementById("error").style.display = "block";
				document.getElementById("error").innerHTML = "Name must contain letters only";
				return false;
			}
			else if (age.value.trim().length <= 0) {
				document.getElementById("error").style.display = "block";
				document.getElementById("error").innerHTML = "Age is mandatory";
				return false;
			}
			else if(parseInt(age.value) < 18 || parseInt(age.value) > 120)
			{
				document.getElementById("error").style.display = "block";
				document.getElementById("error").innerHTML = "Age should be greater than 18 and less than 120";
				return false;
			}
			else if (password.value.trim().length <= 0) {
				document.getElementById("error").style.display = "block";
				document.getElementById("error").innerHTML = "Password is mandatory";
				return false;
			} else if (!passw.test(password.value)) {
				document.getElementById("error").style.display = "block";
				document.getElementById("error").innerHTML = "Password must contain at least one number, one special character, one uppercase, one lowercase letter, one special char and should contain 8 - 16 characters"
					return false;
			} 
			else if (petName.value.trim().length <= 0) {
				document.getElementById("error").style.display = "block";
				document.getElementById("error").innerHTML = "Pet Name is mandatory";
				return false;
			}
			else if(!name.test(petName.value)) {
				document.getElementById("error").style.display = "block";
				document.getElementById("error").innerHTML = "Pet Name must contain letters only";
				return false;
			}
			else if(petName.value.trim().length < 3 || petName.value.trim().length> 10){
				document.getElementById("error").style.display = "block";
				document.getElementById("error").innerHTML = "Pet Name must be at least 3 - 10 characters long";
				return false;
			}
			else{
				return true;
			}
			return false;	
		}
	</script>
</body>
</html>