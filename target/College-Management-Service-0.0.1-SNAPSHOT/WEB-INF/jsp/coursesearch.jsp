<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Course Search</title>
<style type="text/css">
table.borders {
	border: 1px solid black;
	border-collapse: collapse;
}

th.borders, td.borders {
	text-align: left;
	padding: 5px;
	border: 1px solid black;
	border-collapse: collapse;
	margin: 12px;
}
</style>
</head>
<body>
	<script type="text/javascript" src="jQuery.js">
		
	</script>
	<script type="text/javascript">
		$(document).ready(function() {
			$("table").css("margin-left", "25%");
			$("table").css("margin-t", "25%");
		});
	</script>
	<jsp:include page="sidenav.jsp"></jsp:include>
	<div style="margin-left: 25%; float: center;">

		<h3 style="margin-left: 35%;">Course Search</h3>
		<form action="coursesearch" method="POST">
			<table>

				<tr>
					<td>Department :</td>
					<td><select id="department" style="width: 180px"
						name="department">
							<option value="Computer Science">Computer Science</option>
							<option value="Information and Technology">Information
								and Technology</option>
					</select></td>
				</tr>
				<tr>
					<td>Semester :</td>
					<td><select id="semester" style="width: 180px" name="semester">
							<option value="Semester-01">Semester-01</option>
							<option value="Semester-02">Semester-02</option>
							<option value="Semester-03">Semester-03</option>
					</select></td>
				</tr>

				<tr>
					<td></td>
					<td><input type="submit" id="search" value="Search" /></td>
				</tr>
			</table>
		</form>

		<c:if test='${courses!=null}'>
			<script type="text/javascript">
				document.getElementById("department").value= '${dept}';
				document.getElementById("semester").value= '${sem}';
			</script>
			<br><hr><br>
			
			<h3 style = "margin-left: 35%" > Course Lists </h3>
			
			
			<table class="borders" style="margin-left: 25%">
				<tr class="borders">
					<th class="borders">Course Id</th>
					<th class="borders">Course Name</th>
				</tr>
				<c:forEach items='${courses}' var="course" varStatus = "count">
					<tr class="borders">
						<td class="borders" id= "courseId${count.count}">${course.courseId}</td>
						<td class="borders" id= "courseName${count.count}">${course.courseName}</td>
					</tr>
				</c:forEach>
			</table>
		</c:if>
	</div>
</body>
</html>