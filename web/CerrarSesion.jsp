<%@page import="Conexiones.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sesiòn cerrada</title>
    </head>
    <body>
        <%
                        Conexion cn = new Conexion();
cn.setPerfil("");
            HttpSession misesion = request.getSession(true);
            String usuarioSesion = (String) misesion.getAttribute("username");
            if (misesion != null) {
                misesion.invalidate();
                out.print("Sesion cerrada para usuario: " + usuarioSesion);
            } else {
                out.print("Sesion cerrada");
            }
            out.print("<br/>");
            out.print("<a href='index.jsp'>Inicio</a><br/>");
            
        %>
    </body>
</html>
