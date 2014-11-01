<%-- 
    Document   : newjsp
    Created on : 30/10/2014, 20:02:53
    Author     : Yanina
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% 
            session.invalidate();
            response.sendRedirect("LogueoSesion.jsp");
        %>
    </body>
</html>
