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
   
<%--  <%
 Statement statement = null;
 ResultSet resultset = null;
/*  try{ */
 	Class.forName("com.mysql.jdbc.Driver");
 	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_world","root","root");
 	
 	statement = conn.createStatement() ;
     resultset =
     statement.executeQuery("SELECT fullName, address, Age, mobile, SSN, email, country, airlineName, price, sourceCity, destinationCity, departureTime, arrivalTime, totalSeats, bookedSeats, seatAvailibility, dateOfTravel FROM FlightDetails INNER JOIN RegisterDetails ON FlightDetails.flightNumber = RegisterDetails.flightNumber;") ;
     
     String userNameAdmin = request.getParameter("userNameAdmin");
     String passwordAdmin = request.getParameter("passwordAdmin");
     
     Boolean oldPasswordMatch = false;

		while(resultset.next())
		{
			out.println(resultset.getString(1));
			
			if (resultset.getString(1).toString().equals(passwordAdmin)){
				out.println("match2");
				out.println(resultset.getString(1).toString());
				oldPasswordMatch = true;
			}
		}

 		if (userNameAdmin == null || userNameAdmin.equals("") || passwordAdmin == null || passwordAdmin.equals("") || (oldPasswordMatch == false)) {
 			out.println(userNameAdmin);
 			out.println(passwordAdmin);
 			out.println(oldPasswordMatch.toString());
 			out.println(oldPasswordMatch);
 			response.sendRedirect("AssForgotPassword.jsp?error=1");
     	} --%>
		
		
<!--      
 
      /* else {
             
             session.setAttribute("name", userNameAdmin);
             response.sendRedirect("AssForgotPassword.jsp");
             
     } */

		
	
/* }catch(Exception e){
	out.println(e);
} */ -->
<%-- <%-- %>

/*  <form>
  Name <input name="userName" id="userName" maxlength=40><br>
  New Password <input type="password" name="password" id="password" maxlength="10"><br>
  <button>Submit</button>
</form> */
<%
		String QueryPassword = null;

		String userName = request.getParameter("userName");
        String password = request.getParameter("password");
        out.println(userName);
        out.println(password); 
        //String oldPasswordAdmin = request.getParameter("oldPasswordAdmin");
        
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
      
%> --%> 

<%-- <TABLE BORDER="1">
           <TR>
                 <TH>ID</TH>
                 <TH>Name</TH>
                 <TH>City</TH>
                 <TH>State</TH>
                 <TH>Country</TH>
          </TR>
           <% while(resultset.next()){ %>
           <TR>
                <TD> <%= resultset.getString(1) %></td>

          </TR>
           <% } %>
               </TABLE> --%>



<!-- sql:query  tag --> 
<sql:query dataSource="${db}" var="rs">  
	SELECT fullName, address, Age, mobile, SSN, email, country, airlineName, price, sourceCity, destinationCity, departureTime, arrivalTime, totalSeats, bookedSeats, seatAvailibility, dateOfTravel FROM FlightDetails INNER JOIN RegisterDetails ON FlightDetails.flightNumber = RegisterDetails.flightNumber;
</sql:query>  
   
<table border="2" width="100%">  
<tr>  
<th>fullName</th>  
<th>address</th>  
<th>Age</th>   
<th>mobile</th>  
<th>SSN</th>  
<th>email</th>  
<th>country</th>  
<th>airlineName</th>  
<th>price</th>  
<th>sourceCity</th>  
<th>destinationCity</th>
<th>departureTime</th>
<th>arrivalTime</th>
<th>totalSeats</th>
<th>bookedSeats</th>
<th>seatAvailibility</th>
<th>dateOfTravel</th>

<!-- <th>Salary</th>  
<th>Age</th>   -->
</tr>  
	<c:forEach var="table" items="${rs.rows}">  
		<tr>  
			<td><c:out value="${table.fullName}"/></td>  
			<td><c:out value="${table.address}"/></td>
			<td><c:out value="${table.Age}"/></td>  
			<td><c:out value="${table.mobile}"/></td>  
			<td><c:out value="${table.SSN}"/></td>  
			<td><c:out value="${table.email}"/></td>  
			<td><c:out value="${table.country}"/></td>  
			<td><c:out value="${table.airlineName}"/></td>  
			<td><c:out value="${table.price}"/></td>  
			<td><c:out value="${table.sourceCity}"/></td>  
			<td><c:out value="${table.destinationCity}"/></td>  
			<td><c:out value="${table.departureTime}"/></td>  
			<td><c:out value="${table.arrivalTime}"/></td>
			<td><c:out value="${table.totalSeats}"/></td>
			<td><c:out value="${table.bookedSeats}"/></td>
			<td><c:out value="${table.seatAvailibility}"/></td>
			<td><c:out value="${table.dateOfTravel}"/></td>
			  
<%-- 			<td><c:out value="${table.salary}"/></td>  
			<td><c:out value="${table.age}"/></td>   --%>
		</tr>  
	</c:forEach>  
</table>  
<a href="Asssessionhandling.jsp">Login again</a>
<a href="AssFinalAcceptance.jsp">The booking information is correct</a>
</body>  
</html>  