<%-- 
    Document   : ConfirmarCompra
    Created on : 16/10/2014, 19:55:34
    Author     : alumno
--%>

<%@page import="BD.DatosAdmin"%>
<%@page import="Modelo.Producto"%>
<%@page import="Modelo.Compra"%>
<%@page import="Modelo.DetalleCompra"%>
<%@page import="Modelo.DetalleCompra"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.util.Hashtable"%>
<%@page import="Modelo.Usuario"%>
<%@page import="BD.DatosUsuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>


<html>
    <%!
    DatosUsuario User;
    public void jspInit()
    {
        try {
            User = new DatosUsuario();
        }
        catch (Exception E)
        {
            System.out.println(E.getMessage());
        }
    }
    public void jspDestroy()
    {
        User.Desconectar();
    }
    %>
        <jsp:useBean id="detalles" class="java.util.Hashtable" scope="session" />
        <jsp:useBean id="usuario" class="Modelo.Usuario" scope="session"/>



    <!--<![endif]--><head>              
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
            function mensaje()
            {
                 alert('Su pedido ha sido enviado');
                 document.location.href='Menu.jsp';
            }


        </script>              
        <meta http-equiv="content-type" content="text/html; charset=UTF-8">              
        <meta charset="utf-8">              
        <title>FERRETERIA ANTUNEZ</title>              
        <link rel="stylesheet" type="text/css" href="css/style.css">              
        </head>
    <body>
        <h1>Detalles: </h1>
        <form name ='formulario' action='ConfirmarCompra.jsp'  method ='POST'>
            <table border= “1”>
                <tr>
                    <td>Producto</td>
                    <td>cantidad</td>
                    <td>Precio</td>
                    
                 </tr>
                 <%!
                    Enumeration e;
                    DetalleCompra aux;
                    Enumeration e1;
                    Hashtable TablaDetalles;
                    Usuario us;
                    Producto prod;
                 %>
                 
                 
                 
                <%
                    
                    
                    prod = new Producto();
                    e = detalles.elements();
                    //TablaDetalles = (Hashtable)session.getAttribute("DetallesCompra");
                    
                    
                    //e = TablaDetalles.elements();

                    while (e.hasMoreElements()) {
                        aux = (DetalleCompra) e.nextElement();
                            
                            prod = User.TraerProducto(aux.getIdProd());
                            out.println("<tr>"
                                    + "<td>" + prod.getDescripcion() + "</td>"
                                    + "<td>" + aux.getCantidad()+ "</td>"
                                    + "<td>" + aux.getPrecio()+ "</td>"
                                    + "</tr>");
                        

                    }
                %>

            </table>
                <input type ='submit'  value='Confirmar' />
        </form>  
    </body>
</html>


    <%!
         int idCompra;
  %>
        <%
            if (request.getMethod() == "POST") {
               
               idCompra= User.GrabarCompra(usuario.getId());
               e1=detalles.elements();
               while (e1.hasMoreElements()){
                   aux= (DetalleCompra) e1.nextElement();
                   User.GrabarDetalle(idCompra, aux.getPrecio(), prod, aux.getCantidad());
               }
            }
        %>
