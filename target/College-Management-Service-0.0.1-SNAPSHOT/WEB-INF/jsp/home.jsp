<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>
</head>

<body >
	<script type="text/javascript" src="jQuery.js">
		
	</script>
	<script type="text/javascript">
		$(document).ready(function() {
			$("div").css("margin-left", "25%");
			$("div").css("float", "center");
		});
	</script>
	<jsp:include page="sidenav.jsp"></jsp:include>
	<div>
		<h2 id = "welcomeMesage">Welcome to College Management Services</h2>
		<hr>
		<p id = "content">The college management services provides a platform for both the faculty/admin and students to get in touch with the offered services. A student can register on the platform and then search or view courses offered in different branches and semesters. An admin can view courses, and manage registered students, i.e. can delete any registered student from the portal.</p>
	</div>
</body>
</html>