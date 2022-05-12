<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>login_db</title>
</head>
<body>
	<c:set var="email" value="${param.email}" />
	<c:set var="pass" value="${param.pwd}" />
	
	<sql:setDataSource var="db" driver="com.mysql.jdbc.Driver" 
		 url="jdbc:mysql://localhost/hospital" user="root" password=""/>
		 
	<sql:query dataSource="${db}" var="result">
	SELECT * from login where email="${email}";
	</sql:query>
	<c:forEach var="row" items="${result.rows}">
	<c:set var="nm" value="${row.user_name}"/>
	<c:set var="uid" value="${row.uid}"/>

	<c:if test="${pass eq row.password}">
	<% 
	
	session.setAttribute("name", pageContext.getAttribute("nm"));
	session.setAttribute("uid", pageContext.getAttribute("uid"));
	%>
	<c:redirect url="welcome.html"/>
	</c:if>
	
	</c:forEach>
</body>
</html>