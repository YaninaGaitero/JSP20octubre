<!DOCTYPE html>


<html>
    <head>
        <title>LogOut</title>
    </head>

    <body>
    <%    
        session.invalidate();
        response.flushBuffer();
        response.sendRedirect("LogueoSesion.jsp");

    %>

    </body>
</html>