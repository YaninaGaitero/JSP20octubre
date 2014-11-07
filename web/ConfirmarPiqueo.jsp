<%-- 
    Document   : ConfirmarPiqueo
    Created on : 06/11/2014, 18:42:03
    Author     : Yanina
--%>

<%@page import="BD.DatosPiqueo"%>
<%@page import="java.util.Hashtable"%>
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
            DatosPiqueo Daopiqueo;
            Enumeration e1;
            DatosUsuario Daouser;
            int i;
            int  arreglo[];
            int idPiqueo;
                                            %>


        <% aux = new Compra();
            Daouser = new DatosUsuario();

            Daopiqueo = new DatosPiqueo();
        %>




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
                <form action="ConfirmarPiqueo.jsp" name="OrdenPiqueo" method="POST">
                    <div>
                        <center>
                            <table border="1" >
                                <tr >
                                    <td >
                                        IdCompra
                                    </td>
                                    <td>
                                        Fecha
                                    </td>
                                    <td>
                                        Autorizar
                                    </td>
                                </tr>  

                                <%

                                    e = cabeceras.elements();
                                    e1 = cabeceras.elements();
                                    while (e.hasMoreElements()) {
                                        aux = new Compra();
                                        aux = (Compra) e.nextElement();

                                        out.println("<tr>"
                                                + "<td>" + aux.getIdCompra() + "</td>"
                                                + "<td>" + aux.getFecha() + "</td>"
                                                + "</tr>");

                                    }

                                %>
                            </table>
                            <input value="CONFIRMAR" name ="ConfirmaPiqueo" type="button">
                            </div>
                        </center>
                </form><!-- form -->
            </section><!-- content -->
        </div><!-- container -->
    </body>
</html>

<%if (request.getMethod() == "POST") {
    int i=0;
        while (e1.hasMoreElements()) {
            aux = (Compra) e1.nextElement();
            if(i==0){
                arreglo=Daopiqueo.agregarCompraTopiqueo(Daouser.TraerDetallesCliente(aux.getIdCompra()),-1);
                idPiqueo= arreglo[1];
            }else{
                Daopiqueo.agregarCompraTopiqueo(Daouser.TraerDetallesCliente(aux.getIdCompra()),idPiqueo);
            }
            i++;
        }
    }
%>