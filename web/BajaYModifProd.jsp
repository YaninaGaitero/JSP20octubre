<%-- 
    Document   : BajaYModifProd
    Created on : 06/11/2014, 18:25:18
    Author     : alumno
--%>

<%@page import="java.util.Hashtable"%>
<%@page import="Modelo.Producto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="BD.*" %>
<%@page import="java.util.Enumeration" %>
<jsp:include page="Validaciones/ValidAdmin.jsp" />
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
        System.out.println("Entro al POST");
        Producto modif = null;
        String cod = request.getParameter("idProd");
        int id = Integer.parseInt(cod);
        Enumeration m = ConexionProductos.ListaProductos().elements();
        while (m.hasMoreElements())
        {
            Producto p = (Producto)m.nextElement();
            if(p.getId() == id)
            {
                modif = p;
            }
        }
        if (request.getParameter("nombre")!="")
        {
            String nom = request.getParameter("nombre");
            modif.setNombre(nom);
        }
        if (request.getParameter("descripcion")!="")
        {
            String des = request.getParameter("descripcion");
            modif.setDescripcion(des);
        }
        if (request.getParameter("stock")!="")
        {
            String stk = request.getParameter("stock");
            int stock = Integer.parseInt(stk);
            modif.setStock(stock);
        }
        if (request.getParameter("precio")!="")
        {
            String prc = request.getParameter("precio");
            float price = Float.parseFloat(prc);
            modif.setPrecio(price);
        }
        if (request.getParameter("estado")!="")
        {       
            String est = request.getParameter("estado");
            int state = Integer.parseInt(est);
            modif.setEstado(state);
        }
        ConexionProductos.modificarProducto(modif);
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Baja y Modificacion de Productos</title>
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <script type="text/javascript">
            function Validar()
            {
                var id = parseInt(idProd.value);
                if (id==0)
                {
                    alert('Elije un producto a Modificar');
                    exit();
                }
                if (stock.value!='')
                {
                    var nums = parseInt(stock.value);
                    if(isNaN(nums) || nums<0)
                    {
                        alert('El numero ingresado no es valido');
                        exit();
                    }                        
                }
                if (precio.value!='')
                {
                    var nump = parseFloat(precio.value);
                    if(isNaN(nump) || nump<0)
                    {
                        alert('El numero de precio ingresado no es valido');
                        exit();
                    }                        
                }
                modificacion.submit();
            }
        </script>
    </head>
    <body>
        <a href='MenuAdmin.jsp' >Volver al Menu</a>
        <br>
        <h1>Baja y Modificacion de Productos</h1>
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
        <form id="modificacion" action="BajaYModifProd.jsp" method="POST">
            <select id="idProd" name="idProd" size="1">
                <option selected value="0">Elige un producto</option>
                <%
                Enumeration Opt = ListaP.elements();
                while (Opt.hasMoreElements())
                {
                    Producto op = (Producto)Opt.nextElement();
                    %>
                    <option value="<%= op.getId() %>"><%= op.getNombre() %></option>
                    <%
                }
                %>
            </select>
            <br>
            <br>
            <table>
                <tr><td>Nombre:</td><td><input type="text" id="nombre" name="nombre"></td></tr>
                <tr><td>Descripcion:</td><td><input type="text" id="descripcion" name="descripcion"></td></tr>
                <tr><td>Stock:</td><td><input type="text" id="stock" name="stock"></td></tr>
                <tr><td>Precio:</td><td><input type="text" id="precio" name="precio"></td></tr>
                <tr><td>Cambiar Estado: </td><td><select size='1' id='estado' name='estado'>
                <option value=''>Elige un estado</option>
                <option value='1'>De Alta</option>
                <option value='0'>De Baja</option>
            </select></td></tr>
            </table>
             <br>
             <br>
            <input type='button' value="Modificar" onclick='javascript:Validar()'>            
        </form>
    </body>
</html>
