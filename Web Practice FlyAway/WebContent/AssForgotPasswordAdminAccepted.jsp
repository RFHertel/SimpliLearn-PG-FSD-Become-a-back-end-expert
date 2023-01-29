<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*, com.mysql.jdbc.Driver"%>  
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ page import = "java.sql.*" %>

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
   
 <%
 Statement statement = null;
 ResultSet resultset = null;
/*  try{ */
 	Class.forName("com.mysql.jdbc.Driver");
 	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_world","root","root");
 	
 	statement = conn.createStatement() ;
     resultset =
     statement.executeQuery("select login.password from login where login.userName = 'admin'") ;
     
     String userNameAdmin = request.getParameter("userNameAdmin");
     String passwordAdmin = request.getParameter("passwordAdmin");
     
     Boolean oldPasswordMatch = false;

		while(resultset.next())
		{	
			if (resultset.getString(1).toString().equals(passwordAdmin)){
				out.println("Welcome Admin");
				oldPasswordMatch = true;
			}
		}

 		if (userNameAdmin == null || userNameAdmin.equals("") || passwordAdmin == null || passwordAdmin.equals("") || (oldPasswordMatch == false)) {
 			response.sendRedirect("AssForgotPassword.jsp?error=1");
     	}
%>

<form>
  Name <input name="userName" id="userName" maxlength=40><br>
  New Password <input type="password" name="password" id="password" maxlength="10"><br>
  <button>Submit</button>
</form> 
<%
		String QueryPassword = null;

		String userName = request.getParameter("userName");
        String password = request.getParameter("password");
        
        try{
 	        	Class.forName("com.mysql.jdbc.Driver");
	        	conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_world","root","root"); 
	        		        	
	        	String sqlUpdate = "UPDATE login " + "SET password = ? " + "WHERE userName = ?";
	        	
	        	PreparedStatement ps = conn.prepareStatement(sqlUpdate);
	        	ps.setString(1, password);
	        	ps.setString(2, userName);
	        	int x = ps.executeUpdate();  
        	
        }catch(Exception e){
        	out.println(e);
        }
      
%>

<!-- sql:query  tag --> 
<sql:query dataSource="${db}" var="rs">  
	SELECT * from login;  
</sql:query>  
   
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
		</tr>  
	</c:forEach>  
</table>  
<a href="Asssessionhandling.jsp">Login again</a>
</body>  
</html>  