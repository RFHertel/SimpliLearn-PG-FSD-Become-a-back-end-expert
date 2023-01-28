<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*, com.mysql.jdbc.Driver"%>  
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>  
<head>  
<title>sql:query Tag</title>  
</head>  
<body>  
   
<!-- sql:setDataSource tag -->
<sql:setDataSource var="db" driver="com.mysql.jdbc.Driver"  
     url="jdbc:mysql://localhost:3306/db_world"  
     user="root"  password="root"/>
     
<%-- <sql:query dataSource="${db}" var="rs">  
	SELECT * from emp where empid > 100 AND empid <105;  
</sql:query>  --%>  
 
<!-- sql:update tag to INSERT -->    
<%-- <sql:update dataSource="${db}" var="count">  
INSERT INTO emp VALUES (124,'Rob',10000);  
</sql:update>
<sql:update dataSource="${db}" var="count">  
INSERT INTO emp VALUES (125,'Tim',15000); 
</sql:update>
<sql:update dataSource="${db}" var="count">  
INSERT INTO emp VALUES (126,'Joe',20000);   
</sql:update>
<sql:update dataSource="${db}" var="count">  
INSERT INTO emp VALUES (127,'Frank',20001);  
</sql:update>
<sql:update dataSource="${db}" var="count">  
INSERT INTO emp VALUES (128,'Jim',30000);  
</sql:update> --%>

<%-- <sql:update dataSource="${db}" var="count">  
INSERT INTO emp VALUES (120,'Viren2', 44000);  
</sql:update> --%>

<!-- sql:update with sq:param tag to DELETE -->  
<%-- <c:set var="empid" value="105"/>  
	<sql:update dataSource="${db}" var="count">  
		DELETE FROM emp WHERE empid = ?  
	 <sql:param value="${empid}" />  
</sql:update>  --%>

<!-- sql:update with sq:param tag to DELETE -->  
<%-- <c:set var="empid" value="123"/>  
	<sql:update dataSource="${db}" var="count">  
		DELETE FROM emp WHERE empid = ?  
	 <sql:param value="${empid}" />  
</sql:update>

<sql:update dataSource="${db}" var="count">  
	UPDATE emp SET empname="Manager" WHERE salary > 20000  
</sql:update> --%>

<form action="AssForgotPassword4.jsp" method="post">
  Name <input name="userNameAdmin" id="userNameAdmin" maxlength=40><br>
  New Password <input type="password" name="passwordAdmin" id="passwordAdmin" maxlength="10"><br>
  <button>Change Password</button>
</form>

<a href="Asssessionhandling.jsp">Login again</a>
  
<%-- <!-- sql:update with sq:param tag to Update for new Project -->  
<c:set var="userName" value="JennyCraig@gmail.com"/>  
	<sql:update dataSource="${db}" var="count">  
		UPDATE login SET password="pass345" WHERE userName = ?  
	 <sql:param value="${userName}" />  
</sql:update> --%>

<%-- <!-- sql:update with sq:param tag to DELETE -->  
<c:set var="userName" value="JennyCraig@gmail.com"/>  
	<sql:update dataSource="${db}" var="count">  
		UPDATE login SET password="pass345" WHERE userName = ?  
	 <sql:param value="${userName}" />  
</sql:update> --%>

<%-- <sql:update dataSource="${db}" var="rs">  
	UPDATE login SET empname="Manager" WHERE salary = 20000  
</sql:update> --%> 
  
<!-- sql:query  tag --> 
<sql:query dataSource="${db}" var="rs">  
	SELECT * from login;  
</sql:query>  

<%-- <sql:query dataSource="${db}" var="rs">  
	SELECT * from emp where empid > 100 AND empid <105;  
</sql:query>   --%>   
   
<table border="2" width="100%">  
<tr>  
<th>userName</th>  
<th>password</th>  
<!-- <th>Salary</th>  
<th>Age</th>   -->
</tr>  
	<c:forEach var="table" items="${rs.rows}">  
		<tr>  
			<td><c:out value="${table.userName}"/></td>  
			<td><c:out value="${table.password}"/></td>  
<%-- 			<td><c:out value="${table.salary}"/></td>  
			<td><c:out value="${table.age}"/></td>   --%>
		</tr>  
	</c:forEach>  
</table>  
<a href="Asssessionlogin.jsp">Login</a><br><br>
</body>  
</html>  