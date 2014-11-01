<%-- 
    Document   : AltaProductos
    Created on : 01/11/2014, 18:06:31
    Author     : usuario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:include page="Validaciones/ValidAdmin.jsp" />
<jsp:useBean id="aggProd" class="Modelo.Producto" scope="request" />
<%!

%>
<%
    if (request.getMethod()=="POST")
    {
        %>
        <jsp:setProperty name="aggProd" property="*" />
        <%
        System.out.println(aggProd.getNombre());
        System.out.println(aggProd.getPrecio());
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alta Productos</title>
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
                altaform.submit();
            }
        </script>
    </head>
    <body>
        <div>
            <form id="altaform" action="" method="POST">
                <h1>Alta de Productos</h1>
                <br>
                <br>
                Nombre: <input type="text" id="nombre" name="nombre">
                <br>
                Descripcion: <input type="text" id="descripcion" name="descripcion">
                <br>
                Stock: <input type="text" id="stock" name="stock">
                <br>
                Precio: <input type="text" id="precio" name="precio">
                <br>
                Estado: <input type="text" id="estado" name="estado">
                <br>
                <br>
                <input type="button" value="Agregar" onclick="Validar()">
            </form>
        </div>
    </body>
</html>
