<%@page import="Modelo.DetalleCompra"%>
<%@page import="Modelo.Producto"%>
<%@page import="java.util.Enumeration"%>
<%@page import="BD.DatosUsuario"%>
<%@page import="Modelo.Usuario"%>
<%@page import="com.sun.org.apache.xalan.internal.xsltc.runtime.Hashtable"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%! DatosUsuario User;
    Usuario oUsuario;
    Hashtable tablaProds;
%>

<jsp:useBean id="detalles" class="java.util.Hashtable" scope="session" />
<jsp:useBean id="aggdetalles" class="Modelo.DetalleCompra" scope="request" />

<%

    session = request.getSession(true);
    User = new DatosUsuario();
    if (session.getAttribute("usuario") == null) {
        session.setAttribute("mensaje", new String("Usted no esta logueado"));
        response.sendRedirect("LogueoSesion.jsp");
    }
    oUsuario = (Usuario) session.getAttribute("usuario");
    if (oUsuario.getNivel() != 2) {
        session.setAttribute("mensaje", new String("Usted no es Cliente"));
        response.sendRedirect("LogueoSesion.jsp");

    }

    /* TODO output your page here. You may use following sample code. */
    tablaProds = new Hashtable();
    
        tablaProds = User.TraerProductos();
%>
"<!--[if lt IE 7 ]> <html lang=\"en\" class=\"ie6 ielt8\"> <![endif]-->  
<!--[if IE 7 ]>    <html lang=\"en\" class=\"ie7 ielt8\"> <![endif]-->  
<!--[if IE 8 ]>    <html lang=\"en\" class=\"ie8\"> <![endif]-->  
<!--[if (gte IE 9)|!(IE)]><!-->  
<html lang="es">
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
                ;
            }
        </script>  
        <meta http-equiv="content-type" content="text/html; charset=UTF-8">  
        <meta charset="utf-8">  
        <title>FERRETERIA ANTUNEZ</title>  
        <link rel="stylesheet" type="text/css" href="css/style.css">  
        
    </head>
    <body>

        <h1>Productos: </h1>
        <form name ='formulario' action='Comprar.jsp'  method ='POST'>
            <table >
                <tr>
                    <td>Nombre</td>
                    <td>Precio</td>
                    <td>Cantidad</td>
                </tr>
                <%!
                    Enumeration e;
                    Producto aux;
                
                %>
                <%
                    /*RequestDispatcher rd = request.getRequestDispatcher("Menu");
                     rd.include(request, response);*/
                    e = tablaProds.elements();
                    while (e.hasMoreElements()) 
                    
                    {
                        aux = new Producto();
                        aux = (Producto) e.nextElement();
                        out.println("<tr>"
                                + "<td>" + aux.getNombre() + "</td>"
                                + "<td>" + aux.getPrecio() + "</td>"
                                + "<td><label>"
                                + "<input type='text' id='cantidad' name='cantidad" + aux.getId() + "'/>"
                                + "  </label></td>"
                                + "<td>"
                                + "<input type='hidden' name='ProductoId" + aux.getId() + "' value=" + aux.getId() + " >"
                                + "</td>"
                                + "<td>"
                                + "<input type ='submit' name='boton' value='" + aux.getId() + "'>"
                                + "</td>"
                                + "</tr>");

                    }

                    /*Hashtable Detalles = (Hashtable) session.getAttribute("DetallesCompra");
                     if (!Detalles.isEmpty()) {
                     out.println("<td ><a href='ConfirmarCompra.jsp'>Confirmar Compra</a></td>");
                     }*/ /// ESTO NO LO REALIZA MAS EL USER COMUN, EL ADMIN SE ENCARGAR DE CONFIRMAR LAS COMPRAS 
                    //  CON LOS PIQUEOS
                %>
            </table>
        </form>
    </body>
</html>

<%if (request.getMethod() == "POST") {
        
        
        String[] BotonID = request.getParameterValues("boton");
        String cantidad = request.getParameter("cantidad" + BotonID[0] + "");
        String ProductoId = request.getParameter("ProductoId" + BotonID[0] + "");

        int idCompra = 0;
        
        try {
            idCompra = User.GrabarCompra(oUsuario.getId());
        } catch (Exception ex) {
            //Logger.getLogger(Comprar.class.getName()).log(Level.SEVERE, null, ex);
        }
        idCompra++;
        
        Producto oProd = new Producto();
        try {
            String prod = ProductoId;
            oProd = User.TraerProducto(Integer.parseInt(ProductoId));

        } catch (Exception ex) {
            //Logger.getLogger(Comprar.class.getName()).log(Level.SEVERE, null, ex);
        }

        float total = Float.parseFloat(cantidad) * (oProd.getPrecio());
        
        
        %>
        <jsp:setProperty name="aggdetalles" property="idCompra" value="0" />
        <jsp:setProperty name="aggdetalles" property="precio" value="<%= total %>" />
        <jsp:setProperty name="aggdetalles" property="idProd" value="<%= oProd.getId() %>" />
        <jsp:setProperty name="aggdetalles" property="cantidad" value="<%= Integer.parseInt(cantidad) %>" />
        
        <%
        detalles.put(aggdetalles.getIdProd(), aggdetalles);
        /*
        if (session.getAttribute("DetallesCompra") == null) {
            Hashtable DetallesCompra = new Hashtable();
            DetalleCompra auxDet = new DetalleCompra(idCompra, total, oProd.getId(), Integer.parseInt(cantidad));
            DetallesCompra.put(auxDet.getIdProd(), auxDet);
            session.setAttribute("DetallesCompra", DetallesCompra);
        } else {
            Hashtable DetallesCompra = (Hashtable) session.getAttribute("DetallesCompra");
            DetalleCompra auxDet = new DetalleCompra(idCompra, total, oProd.getId(), Integer.parseInt(cantidad));
            DetallesCompra.put(auxDet.getIdProd(), auxDet);
            session.setAttribute("DetallesCompra", DetallesCompra);

        }
                */
        response.sendRedirect("opcCompras.jsp");
        

    }%>



<%--!
     Usuario oUsuarios;
        String BotonID;
        String cantidad;
        String ProductoId;
        int idCompra = 0;
        Producto oProd;
        String prod;
        Hashtable DetallesCompra;
        DetalleCompra auxDet;
        int btn, cant;
--%>






<%--if (request.getMethod() == "POST") {
        session = request.getSession(true);

        oUsuarios = (Usuario) session.getAttribute("usuario");
        BotonID = request.getParameter("boton");
        btn = Integer.parseInt(BotonID);
        cantidad = request.getParameter("cantidad"+btn+"");
        cant = Integer.parseInt(cantidad);
        

        try {
            idCompra = User.GrabarCompra(oUsuarios.getId());
        } catch (Exception ex) {
            //Logger.getLogger(Comprar.class.getName()).log(Level.SEVERE, null, ex);
        }
        idCompra++;

        oProd = new Producto();
        try {
            prod = ProductoId;
            oProd = User.TraerProducto(Integer.parseInt(ProductoId));

        } catch (Exception ex) {
            //Logger.getLogger(Comprar.class.getName()).log(Level.SEVERE, null, ex);
        }

        float total = Float.parseFloat(cantidad) * (oProd.getPrecio());

        if (session.getAttribute("DetallesCompra") == null) {
            DetallesCompra = new Hashtable();
            auxDet = new DetalleCompra(idCompra, total, oProd.getId(), Integer.parseInt(cantidad));
            DetallesCompra.put(auxDet.getIdProd(), auxDet);
            session.setAttribute("DetallesCompra", DetallesCompra);
        } else {
            DetallesCompra = (Hashtable) session.getAttribute("DetallesCompra");
            auxDet = new DetalleCompra(idCompra, total, oProd.getId(), Integer.parseInt(cantidad));
            DetallesCompra.put(auxDet.getIdProd(), auxDet);
            session.setAttribute("DetallesCompra", DetallesCompra);
            
        }
        response.sendRedirect("opcCompras.jsp");
        

    }--%>



