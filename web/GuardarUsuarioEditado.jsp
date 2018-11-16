<%@page import="Conexiones.Conexion"%> <%-- aqui va la clase conexion.java --%>
<%@page import="Conexiones.Usuario"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Guardar edicion de usuario</title>
    </head>
    <body>
        <%HttpSession misesion = request.getSession(true);
            String usuarioSesion = (String) misesion.getAttribute("username");
            out.print("Usuario conectado: " + usuarioSesion + "<br/>");
            Conexion cn = new Conexion();
            String txtNombre = request.getParameter("txtNombre");
            String txtApellido = request.getParameter("txtApellido");
            String txtDireccion = request.getParameter("txtDireccion");
            String txtFec_Nac = request.getParameter("txtFec_Nac");
            Integer txtTelefono = Integer.parseInt(request.getParameter("txtTelefono"));
            Integer cmbPerfil = Integer.parseInt(request.getParameter("cmbPerfil"));
            Boolean cmbEstado = Boolean.parseBoolean(request.getParameter("cmbEstado"));
            String txtArea = request.getParameter("txtArea");
            String hdnrut = request.getParameter("hdnrut");
            String[] parts = hdnrut.split("-");
            String id = parts[0];
            cn.editarUser(id, txtNombre, txtApellido, txtDireccion, txtFec_Nac, txtTelefono, cmbPerfil, cmbEstado);
            cn.editarUserdesc(id, txtArea);
            ArrayList<String> users = cn.SacarusuarioId(id);
            if(cmbEstado==false && usuarioSesion.equals(users.get(0))){
                   response.sendRedirect("CerrarSesion.jsp?err=1");
               }else{
            response.sendRedirect("Home_admin.jsp?exito=2");
             }
        %>  
    </body>
</html>