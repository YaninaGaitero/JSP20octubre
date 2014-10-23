<%-- 
    Document   : ValidAdmin
    Created on : 18/10/2014, 17:58:41
    Author     : usuario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="Modelo.Usuario"%>
<jsp:useBean id="usuario" scope="session" class="Modelo.Usuario">
    
</jsp:useBean>
<jsp:include page="ValidComun.jsp" />
<%
    if (usuario.getNivel() !=  1)
    {
        session.setAttribute("mensaje", new String("Usted no es Administrador. Acceso restringido"));
%>
    <jsp:forward page="../LogueoSesion.jsp"></jsp:forward>
<%
    }
%>
