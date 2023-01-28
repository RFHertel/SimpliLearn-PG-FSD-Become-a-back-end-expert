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
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<select name="country">
  <c:forEach items="${countryList}" var="countryName" varStatus="loop">
    <option value="${loop.index}">
        ${countryName}
    </option>
  </c:forEach>
</select>

<!-- <form>
<input type="radio" name="id" value="first"> first<BR>
<input type="radio" name="id" value="second"> second<BR>
<input type="radio" name="id" value="third"> third<BR>
<input type="radio" name="id" value="fourth"> fourth<BR>
<input type="radio" name="id" value="five"> fifth <BR>
  
  <button>Submit</button>
</form> -->

<form>
<select name="country">
  <option value="Argentina">Argentina</option>
  <option value="Australia">Australia</option>
  <option value="Austria">Austria</option>
  <option value="Belgium">Belgium</option>
  <option value="Brazil">Brazil</option>
  <option value="Canada">Canada</option>
  <option value="China">China</option>
</select> 

<select name="address">
  <option value="1080 stuart st">1080 stuart st</option>
  <option value="1081 hamilton st">1081 hamilton st</option>
  <option value="1082 carter st">1082 carter st</option>
  <option value="1083 blue st">1083 blue st</option>
  <option value="1084 yellow st">1084 yellow st</option>
  <option value="1085 orange st">1085 orange st</option>
  <option value="1086 maven st">1086 maven st</option>
</select> 
  
  <button>Submit</button>
</form>
<%-- 
${param.country}
${param.address} --%>

<%
String s[] = request.getParameterValues("country");
String a[] = request.getParameterValues("address");
if (s != null && s.length != 0) {
/* out.println("You have selected the option is: "); */
for (int i = 0; i < s.length; i++) {
	if (s[i] != null || s[i] != "")
	{
		out.println(s[i] + "\n");
	}
}
}
if (a != null && a.length != 0) {
/* out.println("You have selected the option is: "); */
for (int i = 0; i < a.length; i++) {
out.println(a[i] + "\n");
}
}
%>

<%-- <%-- <sql:update dataSource="${db}" var="count">  
	UPDATE emp SET empname=${countryName} WHERE salary > 20000  
</sql:update>
    --%>
<%-- <select name="country">
  <option value="0">Argentina</option>
  <option value="1">Australia</option>
  <option value="2">Austria</option>
  <option value="3">Belgium</option>
  <option value="4">Brazil</option>
  <option value="5">Canada</option>
  <option value="6">China</option>
</select> 

<c:choose>
   <c:when test="${param.loop==0}">
      <c:out value="${param.loop}"/> 
      
   </c:when>
   <c:otherwise>
      <c:set var="flag" value="false" />  
   </c:otherwise>
</c:choose>

<c:forEach items="${countryList}" var="countryName" varStatus="loop">
    <option value="${loop.index}">
        ${countryName}
    </option>
  </c:forEach>

<%
/* 	String Name = request.getParameter("userNameAdmin");
	String Count = request.getParameter("loop");
	out.println(${countryName}); */
%>   --%>

<%-- <c:if test = "${count != count}">  
   <p>The type of exception is : ${catchtheException} <br />  
   There is an exception: ${catchtheException.message}</p>  
</c:if>  

<sql:update dataSource="${db}" var="count">  
	UPDATE emp SET empname=${countryName} WHERE salary > 20000  
</sql:update>

 --%>


 <%-- <%
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
     	}
		
		
     
 
      /* else {
             
             session.setAttribute("name", userNameAdmin);
             response.sendRedirect("AssForgotPassword.jsp");
             
     } */

		
	
/* }catch(Exception e){
	out.println(e);
} */
%>

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
      
%>

<TABLE BORDER="1">
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
               </TABLE>



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
			<td><c:out value="${table.salary}"/></td>  
			<td><c:out value="${table.age}"/></td>  
		</tr>  
	</c:forEach>  
</table>   --%>
<a href="Asssessionhandling.jsp">Login again</a>
</body>  
</html>  