<%@page import="java.util.ArrayList"%>
<%@page import="Conexiones.Usuario"%>
<%@page import="Conexiones.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="Shortcut Icon" type="image/x-icon" href="assets/icons/book.ico" />
    <script src="js/sweet-alert.min.js"></script>
    <link rel="stylesheet" href="css/sweet-alert.css">
    <link rel="stylesheet" href="css/material-design-iconic-font.min.css">
    <link rel="stylesheet" href="css/normalize.css">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/jquery.mCustomScrollbar.css">
    <link rel="stylesheet" href="css/style.css">
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script>window.jQuery || document.write("'<script src="js/jquery-1.11.2.min.js"><\/script>'")</script>
    <script src="js/modernizr.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.mCustomScrollbar.concat.min.js"></script>
    <script src="js/main.js"></script>
    </head>
    <body>
        
       /*out.print("<div class=\"container-fluid\">");
       out.print("<div class=\"container-flat-form\">");
       out.print(" <div class=\"title-flat-form title-flat-blue\">Error de Autentificacion</div>");
       out.print("<form method=\"POST\" action=\"index.jsp\"");
       out.print("<div class=\"row\">");
       out.print(" <div class=\"col-xs-12 col-sm-8 col-sm-offset-2\" align=\"center\">");
       out.print("<button  type=\"submit\" name=\"submit\" class=\"tooltips-general exit-system-button\"><i class=\"zmdi zmdi-power\"></i> &nbsp;&nbsp; Volver a Autentificación</button>");
       out.print("<span class=\"highlight\"></span>");
       out.print("<span class=\"bar\"></span>");
       out.print(" </div>");
       out.print("</div>");
       out.print("</form>");
       out.print("</div>");
       out.print("</div>");
       out.print("</div>");*/
<%
            Conexion cn = new Conexion();
            ArrayList<Usuario> users = cn.UsuarioLogin();
            String usuario = request.getParameter("txtusuario");
            String password = request.getParameter("txtpassword");
            String Perfil = request.getParameter("cmbPerfil");
            String estado = (request.getParameter("estado"));
            String estadotru = "true";
            String estadofal = "false";
            Boolean acceso = false;
            String perf = "";
            String estadomensaje = "";
            for (int x = 0; x < users.size(); x++) {
                if (usuario.equalsIgnoreCase(users.get(x).getNombre_usuario()) && password.equals(users.get(x).getPassword())
                        && Perfil.equals(users.get(x).getPerfil_idPerfil()) && estadotru.equals(users.get(x).getEstado().toString())) {
                    acceso = true;
                    perf = Perfil;
                    estadomensaje = "0";
                } else {
                    if (usuario.equalsIgnoreCase(users.get(x).getNombre_usuario()) && password.equals(users.get(x).getPassword())
                            && Perfil.equals(users.get(x).getPerfil_idPerfil()) && estadofal.equals(users.get(x).getEstado().toString())) {
                        estadomensaje = "1";
                    } else {
                        estadomensaje = "2";
                    }
                }
            }
            if (acceso == true && perf.equals("1")) {
                response.sendRedirect("Home_admin.jsp");
             HttpSession misesion = request.getSession(true); //crear sesion
                misesion.setAttribute("username", usuario); //darle nombre del usuario a la sesion
                misesion.setAttribute("password", password); //darle la clave a la sesion
                misesion.setAttribute("perfiluser", "admin");
                String usuarioSesion = (String) misesion.getAttribute("username"); //obtener el nombre de usuario de la sesion, el (string)es para parce
                
            } else {
                if (acceso == true && perf.equals("2")) {
                    response.sendRedirect("Home_user.jsp");
                    HttpSession misesion = request.getSession(true); //crear sesion
                misesion.setAttribute("username", usuario); //darle nombre del usuario a la sesion
                misesion.setAttribute("password", password); //darle la clave a la sesion
                misesion.setAttribute("perfiluser", "trabajador");
                String usuarioSesion = (String) misesion.getAttribute("username"); 

                } else {
                    if (acceso == false && estadomensaje.equals("1")) {
                        response.sendRedirect("index.jsp?acceso=2");
                    } else {
                        if (acceso == false && estadomensaje.equals("2")) {
                            response.sendRedirect("index.jsp?acceso=1");
                        }
                    }
                }
            }
            
        %>
    </body>
</html>
