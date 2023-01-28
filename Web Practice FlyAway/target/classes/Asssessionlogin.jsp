<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<H1>Inserting Text into Text Fields</H1>
<a href="AssForgotPassword.jsp">Admin Change Password</a><br><br>
<%

        String name = request.getParameter("name");
        String pwd = request.getParameter("pwd");
        
        if (name == null || name.equals("") || pwd == null || pwd.equals("")) {
                response.sendRedirect("Asssessionhandling.jsp?error=1");
        } else {
                
                session.setAttribute("name", name);
                session.setAttribute("pwd", pwd);
                response.sendRedirect("Asssessiondashboard.jsp");
                
        }
%>		
</body>
</html>