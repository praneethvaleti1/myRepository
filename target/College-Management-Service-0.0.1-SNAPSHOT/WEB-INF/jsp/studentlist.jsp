<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Student List</title>
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
}
</style>
</head>
<body>
	<script type="text/javascript" src="jQuery.js">
		
	</script>
	<script type="text/javascript">
		$(document).ready(function() {
			$("div").css("margin-left", "25%");
		});
	</script>
	<jsp:include page="sidenav.jsp"></jsp:include>
	<div>

		<h3>Student List</h3>

		<%
		if(session.getAttribute("isStudentListEmpty")!=null && session.getAttribute("isStudentListEmpty").toString().equals("true"))
		{
			%>
		<h2 style="color: red">No Users registered yet</h2>
		<%
		}
		else
		{
			%>
			<table class="borders">
			<tr class="borders">
				<th class="borders">Name</th>
				<th class="borders">Department</th>
				<th class="borders">Semester</th>
				<th class="borders">Action</th>
			</tr>
			<c:forEach items='${users}' var="user" varStatus="count">
				<tr class="borders">
					<td class="borders" id="userName${count.count}">${user.name}</td>
					<td class="borders" id="department${count.count}">${user.department}</td>
					<td class="borders" id="semester${count.count}">${user.semester}</td>
					<td class="borders">
						<button id="deleteUser${count.count}"
							onclick="window.location.href = 'deleteuser?userId=${user.userId}';">Delete</button>
					</td>
				</tr>
			</c:forEach>
			</table>

		<%
		}
	%>
	</div>
</body>
</html>