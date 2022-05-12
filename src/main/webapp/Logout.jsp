<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Logout</title>
</head>
<body>	
<%
		session.removeAttribute("name");
		session.removeAttribute("uid");
		session.invalidate();
%>
You have logout successfully.
<c:redirect url="index.html"/>
</body>
</html>