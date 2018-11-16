<%@page import="Conexiones.Conexion"%> <%-- aqui va la clase conexion.java --%>
<%@page import="Conexiones.Trabajador"%>
<%@page import="Conexiones.Perfil"%> <%-- Aqui la clase Usuarios.java--%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
Conexion cn=new Conexion();       
String txtUser=request.getParameter("txtUser");
String txtRut=request.getParameter("txtRut");
String txtNombre=request.getParameter("txtNombre");
String txtApellido=request.getParameter("txtApellido");
String txtDireccion=request.getParameter("txtDireccion");
String txtFec_Nac=request.getParameter("txtFec_Nac");
Integer txtTelefono=Integer.parseInt(request.getParameter("txtTelefono"));
String txtPassword=request.getParameter("txtPassword");
String txtPassword2=request.getParameter("txtPassword2");
Integer cmbPerfil=Integer.parseInt(request.getParameter("cmbPerfil"));

Boolean iguales=false;
out.print(cmbPerfil);
if (txtPassword.equals(txtPassword2)){
                iguales=true;}else{
                    out.print("Contraseñas distintas<br/>");
                out.print("<a href='.\\registro.jsp'>Volver</a><br/>");}
         if (iguales==true){
             cn.nuevoTrabajador(txtUser,txtRut,txtNombre,txtApellido,txtDireccion,txtFec_Nac,txtTelefono,txtPassword,cmbPerfil);
             
 response.sendRedirect("index.jsp"); 
         }
            



        %>
    </body>
</html>
