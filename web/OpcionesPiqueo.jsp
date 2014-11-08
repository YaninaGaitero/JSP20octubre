<%-- 
    Document   : OpcionesPiqueo
    Created on : 05/11/2014, 19:13:22
    Author     : Yanina
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Opciones Piqueo</title>
        <link rel="stylesheet" type="text/css" href="css/style.css">       
    </head>


    <body>

        <br><a id="sub" name="sub" href='ConfirmarPiqueo.jsp'>Confirmar Piqueo</a> 
        
        <br>

        <a href='SacarCarrito.jsp'>Sacar Piqueo</a>  

        <form name ='formulario' action='OpcionesPiqueo.jsp'  method ='POST'> s 
            <tr>
            <td align=center><input type ='submit' name='boton' value= 'Seguir agregando al Piqueo..'/></td>  
            <tr>
        </form>
    </body>
</html>
