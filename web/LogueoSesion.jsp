<%-- 
    Document   : LogueoSesion
    Created on : 09/10/2014, 18:49:40
    Author     : alumno
--%>
<%@page import="BD.DatosUsuario"%>
<%@page import="Modelo.Usuario"%>



    <!DOCTYPE html>


<html lang="es"><!--<![endif]-->
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
            }
            function Validar() {
                if (formulario.usuario.value == '')
                {
                    alert('El nombre de usuario no puede estar vacio');
                    exit();
                }
                if (formulario.password.value == '')
                {
                    alert('La contraseña no puede estar vacia');
                    exit();
                }
                formulario.submit();
            }
        </script>
        
        
         
        <title>FERRETERIA ANTUNEZ</title>
       
  </head>
    <body>
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <%!String mensaje;%>
        <%if (session.getAttribute("mensaje") != null) {
                mensaje = session.getAttribute("mensaje").toString();
                out.println("<br><center>" + mensaje + "  </center>/>");
                }%>

        <div class="container">
            <section id="content">
                <form name ='formulario' action='LogueoSesion.jsp'  method ='POST'>
                    <h1>FERRETERIA ANTUNEZ</h1> 
                    <div>
                        <input placeholder="Usuario" required="" name ="usuario" id="usuario" type="text"/>
                    </div>
                    <div>
                        <input placeholder="Contraseña" required="" name ="password" id="password" type="password"/>
                    </div>
                    <div>
                        <input type ='button' onClick='javascript:Validar();' value ='Login' />

                        <a href='RegistrarUsuario.jsp'>Registrarme</a>
                    </div>
                </form><!-- form -->
            </section><!-- content -->
        </div><!-- container -->

    </body>
</html>




    
<%!

           DatosUsuario User;
%>
<% 
   if (request.getMethod()=="POST")
   {

       
    

        try 
        {
            User = new DatosUsuario();
            User.Conectar();
        }
        catch (Exception E)
        {
            System.out.println(E.getMessage());
        }

           
            String nomb = request.getParameter("usuario");            
            String pass = request.getParameter("password");
            Usuario oUsuario = User.Logueo(nomb, pass);
            if (oUsuario != null) {
                //session.setAttribute("usuario", oUsuario);
                //session.setAttribute("logeado", new String("true"));
            %>
            <jsp:useBean id="usuario" class="Modelo.Usuario" scope="session"></jsp:useBean>
            <jsp:setProperty name="usuario" property="nombre" value="<%= oUsuario.getNombre() %>" />
            <jsp:setProperty name="usuario" property="apellido" value="<%= oUsuario.getApellido() %>" />
            <jsp:setProperty name="usuario" property="direccion" value="<%= oUsuario.getDireccion() %>" />
            <jsp:setProperty name="usuario" property="documento" value="<%= oUsuario.getDocumento() %>" />
            <jsp:setProperty name="usuario" property="estado" value="<%= oUsuario.getEstado() %>" />
            <jsp:setProperty name="usuario" property="id" value="<%= oUsuario.getId() %>" />
            <jsp:setProperty name="usuario" property="telefono" value="<%= oUsuario.getTelefono() %>" />
            <jsp:setProperty name="usuario" property="pass" value="XXXXXXXX" />
            <jsp:setProperty name="usuario" property="nivel" value="<%= oUsuario.getNivel() %>" />
            <%
            

                if (oUsuario.getNivel() == 1) {
                    response.sendRedirect("MenuAdmin.jsp");
                }
                if (oUsuario.getNivel() == 2) {
                    response.sendRedirect("Menu.jsp");
                }
            } else {
                session.setAttribute("mensaje", new String("Usuario incorrecto"));
                response.sendRedirect("LogueoSesion.jsp");
            }
         
       
}%>
