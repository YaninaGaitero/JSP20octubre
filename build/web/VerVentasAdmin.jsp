<%-- 
    Document   : VerVentasAdmin
    Created on : 15/10/2014, 20:42:22
    Author     : alumno
--%>
<%@page language="java" contentType="text/html"
        pageEncoding="UTF-8" session="True"%>
<%@page import="java.util.Hashtable"%>
<%@page import="Modelo.Usuario"%>
<%@page import="BD.DatosAdmin"%>
<%@page import="java.util.Enumeration"%>
<%@page import="Modelo.Compra"%>


<html>
    
    <%!DatosAdmin User;%>
    
    <%
        User = new DatosAdmin();
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
        Hashtable Compras = new Hashtable();
        try {
            Compras = User.TraerCompras();
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
            //Logger.getLogger(VerVentasAdmin.class.getName()).log(Level.SEVERE, null, ex);
        }%>


  

    <head>    
        <meta charset= "utf-8">    
        <meta name= "viewport" content= "width=device-width, initial-scale=1">    
        <title>BIENVENIDA A NUESTRA FERRETERIA</title>    
        <!-- All Stylesheets -->    
        <link rel= "stylesheet"  href= "css/All-Stylesheets.css">    
        <!-- Add 2 Home -->    
        <script type= "text/javascript" src= "js/add2home.js" charset= "utf-8"></script>    
        <!-- Javascript File -->    
        <script src= "js/jquery.js "></script>    
        <script type= "text/javascript" src= "js/jquery-1.7.1.min.js"></script>    
        <!-- Donut Chart -->    
        <script type= "text/javascript" src= "js/jquery.donutchart.js"></script>    
        <!-- jQuery Mobile -->    
        <script src= "js/jquery.mobile-1.3.2.min.js "></script>    
        <!-- Glyphicons -->    
        <script type= "text/javascript" async src= "js/glyphicons/ga.js"></script>    
    </head>
    <body>
        <jsp:useBean id="Compra" scope="session" class="Controladora.ControladoraCompra"/>
        <h1>Historial de ventas: </h1>
        <div class="container">
            <section id="content">
                <form name ='formulario' action='VerVentasAdmin'  method ='POST'>
                    <table border= “1”>
                        <tr>
                            <td>Id Compra</td>
                            <td>User</td>
                            <td>Fecha</td>
                            <td>total</td>
                        </tr>
                        <%
                            /*RequestDispatcher rd = request.getRequestDispatcher("MenuAdmin");
                             rd.include(request, response);*/
                            Enumeration e = Compras.elements();
                            Compra aux = new Compra();
                            while (e.hasMoreElements()) {
                                
                                
                                aux = (Compra) e.nextElement();
                                try {
                                    out.println("<tr>"
                                            + "<td>" + aux.getIdCompra() + "</td>"
                                            + "<td>" + User.TraerUserNombre(aux.getIdUsuario()) + "</td>"
                                             + "<td>" + aux.getFecha() + "</td>"
                                            + "<td>" + Compra.GetTotal(aux.getIdCompra()) + "</td>"
                                            + "<td> <input type ='submit' name='boton' value='" + aux.getIdCompra() + "'> </td>"
                                            + "</tr>");
                                } catch (Exception ex) {
                                    System.out.println(ex.getMessage());
                                }
                            }


                        %>
                    </table>
                </form>
            </section>
        </div>
    </body>
</html >


