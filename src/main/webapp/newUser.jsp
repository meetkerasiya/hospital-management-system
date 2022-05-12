<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>registration_db</title>
</head>
<body>

	<c:set var="uname" value="${param.name}" />
	<c:set var="email" value="${param.email}" />
	<c:set var="phno" value="${param.phone}" />
	<c:set var="pass" value="${param.pwd}" />
	 <sql:setDataSource var="db" driver="com.mysql.jdbc.Driver" 
		 url="jdbc:mysql://localhost/hospital" user="root" password=""/>
	 <sql:update dataSource="${db}">
	 INSERT INTO login(user_name, email, phone, password) values(?, ?, ?, ?)
	 <sql:param value="${uname}"/>
	 <sql:param value="${email}"/>
	 <sql:param value="${phno}"/>
	 <sql:param value="${pass}"/>
	 
	 </sql:update>
	 <c:redirect url="login.html"/>
</body>
</html>