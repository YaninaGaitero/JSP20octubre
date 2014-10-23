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
<jsp:useBean id="usuario" scope="session" class="Modelo.Usuario">
    
</jsp:useBean>
<% 
    if (usuario.getNombre()==null)
    {
        session.setAttribute("mensaje", new String("Usted no esta logueado."));
        
%>
    <jsp:forward page="../LogueoSesion.jsp"></jsp:forward>
<% 
    }
%>
