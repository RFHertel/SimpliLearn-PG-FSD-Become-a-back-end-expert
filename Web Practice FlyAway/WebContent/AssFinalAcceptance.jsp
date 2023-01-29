<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*, com.mysql.jdbc.Driver"%>  
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ page import = "java.sql.*" %>
<%-- <%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %> --%>
<%-- <%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %> --%>
<%-- <%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %> --%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>  
<head>  
<title>sql:query Tag</title>  
</head>  
<body>  

<%-- <%@page contentType="image/png" %><%
    OutputStream o = response.getOutputStream();
    InputStream is = new FileInputStream(new File("C:\\images\\QR_code_for_mobile_English_Wikipedia.png"));
    byte[] buf = new byte[32 * 1024]; 
    int nRead = 0;
    while( (nRead=is.read(buf)) != -1 ) {
        o.write(buf, 0, nRead);
    }
    o.flush();
    o.close();
    return; 
%> --%> 
Congratulations the flight is booked!
<img src="qrproduct_image.jpg">
<a href="Asssessionhandling.jsp">Login again</a>
</body>
</html>