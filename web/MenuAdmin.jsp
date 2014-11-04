<%-- 
   Document   : MenuAdmin
   Created on : 09/10/2014, 20:44:05
   Author     : alumno
--%>



<%@page import="Modelo.Usuario"%>


<%--><%
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
%></--%>
<jsp:useBean id="usuario" class="Modelo.Usuario" scope="session" />
<jsp:include page="Validaciones/ValidAdmin.jsp" />
<html>
    <head> 
        <meta name="viewport" content="width=device-width, initial-scale=1"> 
        <title>BIENVENIDO A NUESTRA FERRETERIA</title> 
        <!-- All Stylesheets --> 
        <link rel="stylesheet"  href="css/All-Stylesheets.css"> 
        <!-- Add 2 Home --> 

        <script type="text/javascript" src="js/add2home.js" charset="utf-8"></script> 
        <!-- Javascript File --> 
        <script src="js/jquery.js"></script> 
        <script type="text/javascript" src="js/jquery-1.7.1.min.js"></script> 
        <!-- Donut Chart --> 
        <script type="text/javascript" src="js/jquery.donutchart.js"></script> 
        <!-- jQuery Mobile --> 
        <script src="js/jquery.mobile-1.3.2.min.js"></script> 
        <!-- Glyphicons --> 
        <script type="text/javascript" async src="js/glyphicons/ga.js"></script> 
    </head>
    <body> 
        <div data-role="page" id="page" data-theme="a"> 
            <!-- header Starts --> 
            <div data-role="header" data-theme="f" class="header"> 
                <h1><a href="index.html" rel="external">FERRETERIA ANTUNEZ</a></h1> 
                <a href="#left-panel" data-shadow="false" ><i class="fa fa-indent fa-2x"></i></a> 
                <a href="#right-panel" data-shadow="false" ><i class="fa fa-bars fa-2x"></i></a> 
            </div> 
            <!-- header Ends --> 
            <div data-role="content"> 
                <!-- Welcome Text Starts --> 
            </div> 
            <div data-role="panel" id="left-panel" data-theme="g"> 
                <div id="accordion"> 
                    <ul id="items"> 
                        <li> 
                            <a href="index.html" rel="external" class="activated">INICIO</a> 
                        </li> 
                        <li> 
                            <a href="#">General</a> 
                            <ul class="sub-items"> 
                                <li> 
                                    <a href='VerVentasAdmin.jsp'>Ver Ventas</a> 
                                </li> 
                                <li> 
                                    <a href='DarDeBaja.jsp'>Cambiar estado de Cliente</a> 
                                </li> 
                                <li> 
                                    <a href='ModificarClienteAdmin.jsp'>Modificar Cliente</a> 
                                </li>    
                                <li> 
                                    <a href='OrdenPiqueo.jsp'>Ver Piqueo</a> 
                                </li>                               
                                <li> 
                                    <a href='ConfirmarCompra.jsp'> Confirmar Pedidos </a> 
                                </li> 
                                <li> 
                                    <a href="index.html" rel="external" class="activated">Salir</a> 
                                </li> 
                            </ul> 
                        </li> 
                    </ul> 
                </div> 
            </div> 
            <div data-role="panel" id="right-panel" data-position="right" data-theme="g"> </div>
            <script src="owl-carousel/owl-carousel/owl.carousel.js"></script>  
            <!-- Custom JS File --> 
            <script src="js/custom.js"></script>  
            <script src="menu/js/main.js"></script>
            </div>

    </body> 
</html>