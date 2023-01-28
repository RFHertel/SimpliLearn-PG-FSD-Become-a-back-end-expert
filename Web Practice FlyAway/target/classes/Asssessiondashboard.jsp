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
   ResultSet rs = null;
%>
<%

Statement statement = null;
String Name = session.getAttribute("name").toString();
String Password = session.getAttribute("pwd").toString();
try{ 
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_world","root","root");
	
	statement = conn.createStatement() ;
	
	PreparedStatement ps = conn.prepareStatement("select login.password from login where login.userName = ?");
	ps.setString(1, Name);
	rs = ps.executeQuery();
	
    Boolean oldPasswordMatch = false;

		while(rs.next())
		{
			
			if (rs.getString(1).toString().equals(Password)){

				oldPasswordMatch = true;
			}
		}

        if (Name == null || Name == "" || Password == null 
        || Password == "" || oldPasswordMatch == false) {

			response.sendRedirect("Asssessionhandling.jsp?error=1");
        }
}
catch(Exception e){
        	out.println(e);
        }
                

%>
<b>Hello <%= session.getAttribute("name") %></b><br>
<a href="Asssessionlogout.jsp">Click here to logout</a>

   
<%-- TABLE  --%>


<!-- sql:query  tag --> 
<sql:query dataSource="${db}" var="rs">  
	SELECT * from FlightDetails;  
</sql:query>  

<table border="2" width="100%">  
<tr>  
<th>airlineName</th>  
<th>price</th>  
<th>flightNumber</th>
<th>sourceCity</th>
<th>destinationCity</th>
<th>departureTime</th>
<th>arrivalTime</th>
<th>totalSeats</th>
<th>bookedSeats</th>
<th>seatAvailibility</th>
<th>dateOfTravel</th>


</tr>  
	<c:forEach var="table" items="${rs.rows}">  
		<tr>  
			<td><c:out value="${table.airlineName}"/></td>  
			<td><c:out value="${table.price}"/></td> 
			<td><c:out value="${table.flightNumber}"/></td>  
			<td><c:out value="${table.sourceCity}"/></td>  
			<td><c:out value="${table.destinationCity}"/></td>  
			<td><c:out value="${table.departureTime}"/></td>  
			<td><c:out value="${table.arrivalTime}"/></td>  
			<td><c:out value="${table.totalSeats}"/></td>  
			<td><c:out value="${table.bookedSeats}"/></td>
			<td><c:out value="${table.seatAvailibility}"/></td>   
			<td><c:out value="${table.dateOfTravel}"/></td>   
   
		</tr>  
	</c:forEach>  
</table>  

<form>
<input type="checkbox" name="id" id="id" value="1"> first<BR>
<input type="checkbox" name="id" id="id" value="2"> second<BR>
<input type="checkbox" name="id" id="id" value="3"> third<BR>
<input type="checkbox" name="id" id="id" value="4"> fourth<BR>

<input type="submit" value="Submit">
</form>

<%
	String id = request.getParameter("id");
	session.setAttribute("id", id);
%>

<a href="AssRegisterDetails.jsp">Register Personal Details</a>

</body>  
</html>  