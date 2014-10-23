<%-- 
    Document   : ValidComun
    Created on : 09/10/2014, 20:29:00
    Author     : alumno
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%--
Cambiar el import. Usar la clase usuario para hacer la validacion.
--%>
<%@page import="Modelo.*" %>
<% 
    if (session.getAttribute("usuario")==null)
    {
        session.setAttribute("errorlog", "Usted no se encuentra<br> logueado en el sistema");%>
        <jsp:forward page="LogIn.jsp"></jsp:forward>
<%
    }
    else 
    {
        Usuario valido = (Usuario)session.getAttribute("usuario");
        if (!valido.isDeAlta())
        {
            session.setAttribute("errorlog", "Usted no puede ingresar.<br>Comuniquese con el administrador.");
            %>
        <jsp:forward page="LogIn.jsp"></jsp:forward>
<%
        }
    }
%>
