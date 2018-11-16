<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="Shortcut Icon" type="image/x-icon" href="assets/icons/book.ico" />
    <script src="js/sweet-alert.min.js"></script>
    <link rel="stylesheet" href="css/sweet-alert.css">
    <link rel="stylesheet" href="css/material-design-iconic-font.min.css">
    <link rel="stylesheet" href="css/normalize.css">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/jquery.mCustomScrollbar.css">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/login.css"/>
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script>window.jQuery || document.write('<script src="js/jquery-1.11.2.min.js"><\/script>')</script>
    <script src="js/modernizr.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.mCustomScrollbar.concat.min.js"></script>
    <script src="js/main.js"></script>
            <%
            String er1 = "1";
            String er2 = "2";
            if (er1.equals(request.getParameter("acceso"))) {
                String mensaje = "<script language='javascript'>alert('Error de acceso, verifique sus credenciales o comuniquese con el administrador del sistema');</script>";
                out.println(mensaje);
            }
            if (er2.equals(request.getParameter("acceso"))) {
                String mensaje = "<script language='javascript'>alert('Usuario inactivo, comuniquese con el administrador');</script>";
                out.println(mensaje);
            }
        %>  
    </head>
    
    <body class="full-cover-background" style="background-image:url(assets/img/font-login.jpg);">    
                
    <div class="form-container">
        <p class="text-center" style="margin-top: 19px;">
           <i class="zmdi zmdi-account-circle zmdi-hc-5x"></i>
       </p>
       <h4 class="text-center all-tittles" style="margin-bottom: 30px;">inicia sesión con tu cuenta</h4>
       <form method="post" action="Acceso.jsp">
            <div class="group-material-login">
              <input type="text" class="material-login-control" name="txtusuario" required="" maxlength="70">
              <span class="highlight-login"></span>
              <span class="bar-login"></span>
              <label><i class="zmdi zmdi-account"></i> &nbsp; Nombre de Usuario</label>
            </div><br>
            <div class="group-material-login">
              <input type="password" class="material-login-control" name="txtpassword" required="" maxlength="70">
              <span class="highlight-login"></span>
              <span class="bar-login"></span>
              <label><i class="zmdi zmdi-lock"></i> &nbsp; Contraseña</label>
            </div>
            <div class="group-material">
                <select class="material-control-login" name="cmbPerfil">
                    <option selected="">Seleccione Tipo de usuario</option>
                    <option value="1">Administrador</option>
                    <option value="2">Trabajador</option>
                </select>
            </div>
            <button class="btn-login" name="submit"  type="submit">Ingresar al sistema &nbsp; <i class="zmdi zmdi-arrow-right"></i></button>
        </form>
       <br/>
       </div>
    </div>  
</body>
</html>
  