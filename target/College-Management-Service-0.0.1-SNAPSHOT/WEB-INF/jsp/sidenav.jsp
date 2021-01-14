<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>body, html {
	height: 100%;
}

li {
	font-size: 20px;
	font-family: cursive;
	list-style-type: none;
	width: 80%;
	margin: 0px;
	padding: 0px;
}

a.buttonLink:link, a.buttonLink:visited {
	width: 100%;
	background-color: #d3d3d3;
	color: black;
	padding: 14px 25px;
	text-align: left;
	text-decoration: none;
	border-bottom: 1px solid black;
	display: inline-block;
}

a.buttonLink:hover, a.buttonLink:active {
	background-color: #afa8a8;
}
</style>
</head>
<body>
	<script type="text/javascript" src="jQuery.js">
		
	</script>
	<script type="text/javascript">
		$(document).ready(function() {
			$("div").css("background-color", "#d3d3d3");
		});
	</script>
	<div style = "float: left; width: 20%; border-right: 1px solid black;height: 100%;">
	
		<li><a href="home" class = "buttonLink" id = "homeLink">Home</a></li>
		<li><a href="coursesearch" class = "buttonLink" id = "courseSearchLink">Course Search</a></li>
		<c:if test='${userAdmin==true}'>
			<li><a href="studentlist" class ="buttonLink" id = "studentListLink">Student List</a></li>
		</c:if>
		<li><a href="logout" class ="buttonLink" id = "logoutLink">Logout</a></li>
	
	</div>
</body>
</html>