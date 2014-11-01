
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>LogOut</title>
    </head>


    <%
        
        session.invalidate();
        response.sendRedirect("LogueoSesion.jsp");
    %>

    <body>
    </body>
</html>