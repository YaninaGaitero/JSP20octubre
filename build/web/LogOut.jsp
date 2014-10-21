<%-- 
    Document   : LogOut
    Created on : 14/10/2014, 21:04:14
    Author     : alumno
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>LogOut</title>
    </head>


    <%
        session = request.getSession(true);
        session.invalidate();
        RequestDispatcher req = getServletContext().getRequestDispatcher("LogueoSesion");
        req.forward(request, response);
    %>

    <body>
    </body>
</html>
