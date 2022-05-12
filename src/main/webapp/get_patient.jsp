<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<html>

<head>
	<meta charset="ISO-8859-1">
	<title>SHOW PATIENT</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
	<style>
		* {
		margin: 0;
		padding: 0;
		box-sizing: border-box;
		outline: none;
	}
	.container{
		width: 760px;
		border-radius: 4px;
		position: absolute;
		left: 30%;
		top: 15%;
		display: flex;
		flex-direction: column;
		align-items: center;
		justify-content: center;
		border: 1px solid black;
		margin: 80px 0px;
	}
		table {
			font-family: arial, sans-serif;
			border-collapse: collapse;
			width: 100%;
		}

		button {
			width: 150px;
			margin: 0 auto;
			padding: 5px;
			background-color: #28a745;
			border: 1px solid white;
			border-radius: 2px;
			color: white;
		}

		button:hover{
			transition: 0.5s;
			background-color: rgb(41, 160, 41);
		}

		#add input {
			padding: 25px 10px;
			margin: 3px;
			width: 40%;
			font-size: 22px;
		}

		td,
		th {
			border: 1px solid #dddddd;
			text-align: left;
			padding: 8px;
		}

		tr:nth-child(even) {
			background-color: #dddddd;
		}
	</style>
</head>

<body>
	<div class="container">
		<h1>Patients information</h1><br><br>
		<sql:setDataSource var="db" driver="com.mysql.jdbc.Driver"  
     url="jdbc:mysql://localhost/hospital"  
     user="root"  password=""/>  
  
	<sql:query dataSource="${db}" var="rs">  
	SELECT * from patient;  
	</sql:query>  
   
	<table border="5" width="100%">  
	<tr>  
	<th>patient id</th>  
	<th>Name</th>
	<th>email</th>  
	<th>phone</th>  
	<th>age</th>  
	<th>gender</th>   
	<th>blood</th>  
	<th>symptoms</th>   
	<th>disease</th>  
	<th></th>  
	</tr>  
	<c:forEach var="table" items="${rs.rows}">  
	<tr>  
	<td><c:out value="${table.id}"/></td>  
	<td><c:out value="${table.name}"/></td>  
	<td><c:out value="${table.email}"/></td>  
	<td><c:out value="${table.phone}"/></td>  
	<td><c:out value="${table.age}"/></td>  
	<td><c:out value="${table.gender}"/></td>  
	<td><c:out value="${table.blood}"/></td> 
	<td><c:out value="${table.symptoms}"/></td>  
	<td><c:out value="${table.disease}"/></td>  
	</tr>  
	</c:forEach>  
	</table>  
  	</div>
	</div>
	
</body>

</html>