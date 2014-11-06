<%-- 
    Document   : opcCompras
    Created on : 15/10/2014, 20:35:10
    Author     : alumno
--%>

<%@page import="Modelo.DetalleCompra"%>
<%@page import="java.util.Enumeration"%>
<html>
    <head>  
        <title>Servlet opcCompras</title>              
    </head>  
    <body>  
<jsp:useBean id="detalles" class="java.util.Hashtable" scope="session" />
        <%
            Enumeration e = detalles.elements();
            while (e.hasMoreElements())
            {
                DetalleCompra dc = (DetalleCompra)e.nextElement();
                System.out.println(dc.getIdProd());
                System.out.println(dc.getCantidad());
                System.out.println(dc.getPrecio());
            }
            %>
        <br>  
    <td align=center><a id="sub" name="sub" href='ConfirmarCompra.jsp'>Confirmar Pedido</a></td>  
    <br>  
    <td align=center><a href='SacarCarrito.jsp'>Sacar Compra</a></td>  
    <br>  
    <form name ='formulario' action='opcCompras.jsp'  method ='POST'>  
        <td align=center><input type ='submit' name='boton' value= 'Seguir agregando al pedido..'/></td>  
    </form>
</body>
</html>
<%
    if (request.getMethod() == "POST") {
        response.sendRedirect("Comprar.jsp");
    }
%>
