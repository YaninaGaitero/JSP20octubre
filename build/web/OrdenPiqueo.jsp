<%-- 
    Document   : OrdenPiqueo
    Created on : 01-nov-2014, 17:13:01
    Author     : Ezequiel
--%>

<%@page import="com.sun.org.apache.xalan.internal.xsltc.runtime.Hashtable"%>
<%@page import="BD.DatosUsuario"%>
<%@page import="Modelo.Usuario"%>
<%@page import="Modelo.Compra"%>
<%@page import="Modelo.Piqueo"%>
<%@page import="java.util.Enumeration"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es"><!--<![endif]--><head>
        <script type="text/javascript">
            function ValidaUsr()
            {
                if (document.getElementById('Nombre').value.length < 4)
                {
                    alert('El nombre debe tener mas de 4 caracteres');
                    document.getElementById('Nombre').focus();
                    return false;
                }
                ;
            }
            var Menu = "MenuAdmin.jsp"
            function redireccionar()
            {
                location.href = Menu
            }
        </script>
        <jsp:useBean id="cabeceras" class="java.util.Hashtable" scope="session" />
        <jsp:useBean id="cabecerapiqueo" class="Modelo.Compra" scope="request" />

        <%!
            Enumeration e;
            Compra aux;
            DatosUsuario daoUser;
            Hashtable tablaCompras;

        %>
        
        
        <% aux =  new Compra();
        
        tablaCompras = new Hashtable();%>
        
       
        

        <jsp:setProperty name="cabecerapiqueo" property="idCompra" value="0" />
        <jsp:setProperty name="cabecerapiqueo" property="idUsuario" value="<%= aux.getIdUsuario()%>" />
        <jsp:setProperty name="cabecerapiqueo" property="fecha" value="<%= aux.getFecha()%>" />
        <jsp:setProperty name="cabecerapiqueo" property="estado" value="<%= aux.getEstado()%>" />

        <meta http-equiv="content-type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <title>FERRETERIA ANTUNEZ</title>
        <link rel="stylesheet" type="text/css" href="css/style.css">
    </head>
    <body>
        <div class="container">
            <section id="content">
                <form action="OrdenPiqueo.jsp" name="OrdenPiqueo" method="POST">
                    <div>
                        <center>
                            <table border="1" >
                                <tr >
                                    <td >
                                        IdPiqueo
                                    </td>
                                    <td>
                                        Fecha
                                    </td>
                                    <td>
                                        Autorizar
                                    </td>
                                </tr>  

                                <%

                                    daoUser = new DatosUsuario();
                                    tablaCompras = daoUser.traerComprasPendientes();
                                    e = tablaCompras.elements();
                                    while (e.hasMoreElements()) {
                                        aux = new Compra();
                                        aux = (Compra) e.nextElement();
                                        if (cabeceras.get(aux.getIdCompra()) == null) {
                                            out.println("<tr>"
                                                    + "<td>" + aux.getIdCompra() + "</td>"
                                                    + "<td>" + aux.getFecha() + "</td>"
                                                    + "<td>"
                                                    + "<input type ='submit' name='boton' value='" + aux.getIdCompra() + "'>"
                                                    + "</td>"
                                                    + "</tr>");
                                        }

                                    }

                                %>
                            </table>
                            <input value="VOLVER" name ="DetallePiqueo" type="button" onclick= "location = 'MenuAdmin.jsp'">
                            </div>
                        </center>
                </form><!-- form -->
            </section><!-- content -->
        </div><!-- container -->
    </body>
</html>





<%if (request.getMethod() == "POST") {

        cabeceras.put(cabecerapiqueo.getIdCompra(), cabecerapiqueo);
        response.sendRedirect("OpcionesPiqueo.jsp");

    }

%>


