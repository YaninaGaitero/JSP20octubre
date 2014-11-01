<%-- 
    Document   : ModificarClienteAdmin2
    Created on : 01-nov-2014, 17:45:04
    Author     : Ezequiel
--%>
<%@page language="java" contentType="text/html"
        pageEncoding="UTF-8" session="True"%>

<%@page import="BD.DatosUsuario"%>
<%@page import="java.util.Hashtable"%>
<%@page import="BD.DatosAdmin"%>
<%@page import="java.util.logging.Logger"%>
<%@page import="java.util.logging.Level"%>
<%@page import="Modelo.Usuario"%>
<%@page import="java.util.Enumeration"%>
<html>
    <%!DatosUsuario User;%>

    <%
        session = request.getSession(true);
        if (session.getAttribute("usuario") == null) {
            session.setAttribute("mensaje", new String("Usted no esta logueado"));
            response.sendRedirect("LogueoSesion");
        }

        Usuario oUsuario = (Usuario) session.getAttribute("usuario");

        if (oUsuario.getNivel() != 1) {
            session.setAttribute("mensaje", new String("Usted no es Administrador. Acceso restringido"));
            response.sendRedirect("LogueoSesion");

        }

        Hashtable Clientes = new Hashtable();
        try {
            Clientes = User.TrearUsuariosT();
        } catch (Exception ex) {

        }%>




    <head>
        <script type="text/javascript">
            function ValidaUsr()
            {
                if (document.getElementById('Nombre').value.length < 4)
                {
                    alert('El nombre debe tener mas de 4 caracteres');
                    document.getElementById('Nombre').focus();
                    return false;
                }
                
            }
        </script> 
        <meta http-equiv=\"content-type\" content=\"text/html; charset=UTF-8\"> 
        <meta charset=\"utf-8\"> 
        <title>FERRETERIA ANTUNEZ</title> 
        <link rel="stylesheet\" type=\"text/css" href="css/style.css"> 
    </head>
    <body>
        <h1>Clientes: </h1>
        <form name ='formulario' action='ModificarClienteAdmin'  method ='POST'>
            <table border=1>
                <tr>                    
                    <td>Nombre</td>
                    <td>Apellido</td>
                    <td>Contraseña</td>
                    <td>Documento</td>                 
                    <td>Telefono</td>
                    <td>Direccion</td>
                </tr>

                <%
                    Enumeration e = Clientes.elements();
                    while (e.hasMoreElements()) {
                        Usuario aux = new Usuario();
                        aux = (Usuario) e.nextElement();
                %>
                <tr>
                    <%
                        out.println("   <td>"
                                + "         <input type='text' name='nombre" + aux.getId() + "'  value='" + aux.getNombre() + "'> </input> "
                                + "     </td>"
                                + "     <td>"
                                + "         <input type='text' name='apellido" + aux.getId() + "'  value='" + aux.getApellido() + "'> </input> "
                                + "     </td>"
                                + "     <td>"
                                + "         <input type='text' name='pass" + aux.getId() + "'  value='" + aux.getPass() + "'> </input> "
                                + "     </td>"
                                + "     <td>"
                                + "         <input type='text' name='documento" + aux.getId() + "' value='" + aux.getDocumento() + "'> </input> "
                                + "     </td>"
                                + "     <td>"
                                + "         <input type='text' name='telefono" + aux.getId() + "'  value='" + aux.getTelefono() + "'> </input> "
                                + "     </td>"
                                + "     <td>"
                                + "         <input type='text' name='direccion" + aux.getId() + "'  value='" + aux.getDireccion() + "'> </input> "
                                + "     </td>"
                                + "     <td> "
                                + "         <input type ='submit' name='boton' value='" + aux.getId() + "'> </input> "
                                + "     </td>");
                    }
                    %>
                </tr>
                <tr>
                    <td align=center><a href='MenuAdmin.jsp'>Volver</a></td>
                </tr>
            </table>
        </form>
    </body>
</html>
