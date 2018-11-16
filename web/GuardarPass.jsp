<%@page import="Conexiones.Conexion"%> <%-- aqui va la clase conexion.java --%>
<%@page import="Conexiones.Usuario"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Guardar contraseña</title>
    </head>
    <body>

        <%
             HttpSession misesion = request.getSession(true);
            String usuarioSesion = (String) misesion.getAttribute("username");
            out.print("Usuario conectado: " + usuarioSesion + "<br/>");
            
            String id = request.getParameter("hdnrut");
            String pass1 = request.getParameter("txtpass");
            String pass2 = request.getParameter("txtpass2");
            if (pass1.equals(pass2)) {
                Conexion cn = new Conexion();
                String[] parts = id.split("-");
                String rut = parts[0];
                cn.contraseñas(pass1, rut);
               response.sendRedirect("Verusuarios_admin.jsp");    
               }
                 else {
                response.sendRedirect("CambioPassword.jsp?pas=1&id=" + id + "");
            }
        %> 
    </body>
</html>
