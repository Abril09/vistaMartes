<%@page import="Conexiones.Conexion"%> <%-- aqui va la clase conexion.java --%>
<%@page import="Conexiones.Usuario"%> <%-- Aqui la clase Usuarios.java--%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Guardar Usuario</title>
    </head>
    <body>
       <%
          Boolean acceso=true;
          String redireccion="no";
            Conexion cn = new Conexion();
            String usuario = request.getParameter("txtUser"); 
            String pass1 = request.getParameter("txtPassword");
            String pass2 = request.getParameter("txtPassword2");
            if (!pass1.equals(pass2)){
                acceso=false;
                redireccion="contraseña";
            } else {
                    ArrayList<String> users = cn.compuser();
                    for (int x = 0; x < users.size(); x++) {
                        if (usuario.equals(users.get(x))) {
                        acceso=false;
                        redireccion="usuario";
                        }}}
            
            if (acceso){
                String txtUser = request.getParameter("txtUser");
                    String txtRut = request.getParameter("rut");
                    String txtNombre = request.getParameter("txtNombre");
                    String txtApellido = request.getParameter("txtApellido");
                    String txtDireccion = request.getParameter("txtDireccion");
                    String txtFec_Nac = request.getParameter("txtFec_Nac");
                    Integer txtTelefono = Integer.parseInt(request.getParameter("txtTelefono"));
                    String txtPassword = request.getParameter("txtPassword");
                    String txtPassword2 = request.getParameter("txtPassword2");
                    Integer cmbPerfil = Integer.parseInt(request.getParameter("cmbPerfil"));
                    String txtArea = request.getParameter("txtArea");
                    cn.nuevoUsuario(txtUser, txtRut, txtNombre, txtApellido, txtDireccion, txtFec_Nac, txtTelefono, txtPassword, cmbPerfil);
                    cn.nuevoUsuariodesc(txtRut, txtArea);
                    response.sendRedirect("Home_admin.jsp?exito=1");
            }else{
                if(redireccion=="contraseña"){
                response.sendRedirect("Registro.jsp?pas=1");    
                }else{
                    if(redireccion=="usuario"){
                response.sendRedirect("Registro.jsp?use=1");}
                }
            }
        %>
    </body>
    
</html>
