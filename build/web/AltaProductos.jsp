<%-- 
    Document   : AltaProductos
    Created on : 01/11/2014, 18:06:31
    Author     : usuario
--%>

<%@page import="Modelo.Producto"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.util.Hashtable"%>
<%@page import="BD.DatosProductos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:include page="Validaciones/ValidAdmin.jsp" />
<jsp:useBean id="aggProd" class="Modelo.Producto" scope="request" />
<%!
    DatosProductos ConexionProductos;
    public void jspInit()
    {
        try 
        {
            ConexionProductos = new DatosProductos();
        }
        catch (Exception E)
        {
            System.out.println(E.getMessage());
        }
    }
    
    public void jspDestroy()
    {
        ConexionProductos.Desconectar();
    }
%>
<%
    if (request.getMethod()=="POST")
    {
        %>
        <jsp:setProperty name="aggProd" property="*" />
        <%
        //System.out.println(aggProd.getNombre());
        //System.out.println(aggProd.getPrecio());
        ConexionProductos.altaProducto(aggProd);
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alta Productos</title>
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <script>
            function Validar()
            {
                if (nombre.value=='')
                {
                    alert('El nombre no tiene que estar vacio');
                    exit();
                }
                var num1=stock.value;
                if (isNaN(num1) || num1<0)
                {
                    alert('Numero de stock no valido');
                    exit();
                }
                var num2=precio.value;
                if (isNaN(num2) || num2<0)
                {
                    alert('Numero de precio no valido');
                    exit();
                }
                if (estado.value=='')
                {
                    alert('Elige un estado de Producto');
                    exit();
                }
                altaform.submit();
            }
        </script>
    </head>
    <body>
        <a href='MenuAdmin.jsp' >Volver al Menu</a>
        <br>
        <div>
            <form id="altaform" action="" method="POST">
                <h1>Alta de Productos</h1>
                <br>
                <br>
            <table border="1">
            <tr>
                <td>ID</td>
                <td>Nombre</td>
                <td>Descripcion</td>
                <td>Stock</td>
                <td>Precio</td>
                <td>Estado</td>
            </tr>
            <%
                Hashtable ListaP = ConexionProductos.ListaProductos();
                Enumeration P = ListaP.elements();
                while (P.hasMoreElements())
                {
                    Producto list = (Producto)P.nextElement();
                    %>
                    <tr>
                        <td><%= list.getId() %></td>
                        <td><%= list.getNombre() %></td>
                        <td><%= list.getDescripcion() %></td>
                        <td><%= list.getStock() %></td>
                        <td><%= list.getPrecio() %></td>
                        <%
                        if (list.getEstado()==1)
                        {
                            %>
                            <td>ACTIVO</td>
                            <%
                        }
                        else
                        {
                            %>
                            <td>NO ACTIVO</td>
                            <%
                        }
                        %>
                    </tr>
                    <%
                }
            %>
        </table>
                <br>
                <br>
                <table>
                    <tr><td>Nombre:</td><td><input type="text" id="nombre" name="nombre"></td></tr>
                    <tr><td>Descripcion:</td><td><input type="text" id="descripcion" name="descripcion"></td></tr>
                    <tr><td>Stock:</td><td><input type="text" id="stock" name="stock"></td></tr>
                    <tr><td>Precio:</td><td><input type="text" id="precio" name="precio"></td></tr>
                    <tr><td>Estado:</td><td><select id="estado" name="estado" >
                    <option value=''>Elije un Estado</option>
                    <option value='1'>De Alta</option>
                    <option value='2'>De Baja</option>
                </select></td></tr>
                </table>
                <br>
                <br>
                <input type="button" value="Agregar" onclick="Validar()">
            </form>
        </div>
    </body>
</html>
