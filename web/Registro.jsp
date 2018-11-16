<%@page import="Conexiones.Conexion"%>
<%@page import="Conexiones.rut"%> <%-- aqui va la clase conexion.java --%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
     <head>
         <script language=JavaScript>
 function validarut(rut) { //no modificar!!!! es el validador del rut!!!!!!!
    var valor = rut.value.replace('.','');
    valor = valor.replace('-','');
    cuerpo = valor.slice(0,-1);
    dv = valor.slice(-1).toUpperCase();
    rut.value = cuerpo + '-'+ dv
    if(cuerpo.length < 7) { rut.setCustomValidity("RUT Incompleto"); return false;}
    suma = 0; multiplo = 2;
    for(i=1;i<=cuerpo.length;i++) {
        index = multiplo * valor.charAt(cuerpo.length - i);
        suma = suma + index;
        if(multiplo < 7) { multiplo = multiplo + 1; } else { multiplo = 2; }}
    dvEsperado = 11 - (suma % 11);
    dv = (dv == 'K')?10:dv;
    dv = (dv == 0)?11:dv;
    if(dvEsperado != dv) { rut.setCustomValidity("RUT Inválido"); return false; }
    rut.setCustomValidity('');}
</script>
        <title>Registro</title>
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
    <div class="navbar-lateral full-reset">
        <div class="visible-xs font-movile-menu mobile-menu-button"></div>
        <div class="full-reset container-menu-movile custom-scroll-containers">
            <div class="logo full-reset all-tittles">
                <i class="visible-xs zmdi zmdi-close pull-left mobile-menu-button" style="line-height: 55px; cursor: pointer; padding: 0 10px; margin-left: 7px;"></i> 
                sistema bibliotecario
            </div>
            <div class="full-reset" style="background-color:#2B3D51; padding: 10px 0; color:#fff;">
                <figure>
                    <img src="assets/img/logo.png" alt="Biblioteca" class="img-responsive center-box" style="width:55%;">
                </figure>
                <p class="text-center" style="padding-top: 15px;">Sistema Bibliotecario</p>
            </div>
            <div class="full-reset nav-lateral-list-menu">
                <ul class="list-unstyled">
                    <li><a href="home.html"><i class="zmdi zmdi-home zmdi-hc-fw"></i>&nbsp;&nbsp; Inicio</a></li>
                    <li>
                        <div class="dropdown-menu-button"><i class="zmdi zmdi-case zmdi-hc-fw"></i>&nbsp;&nbsp; Administración <i class="zmdi zmdi-chevron-down pull-right zmdi-hc-fw"></i></div>
                        <ul class="list-unstyled">
                            <li><a href="institution.html"><i class="zmdi zmdi-balance zmdi-hc-fw"></i>&nbsp;&nbsp; Sucursal</a></li>
                            <li><a href="provider.html"><i class="zmdi zmdi-truck zmdi-hc-fw"></i>&nbsp;&nbsp; Nuevo proveedor</a></li>
                        </ul>
                    </li>
                    <li>
                        <div class="dropdown-menu-button"><i class="zmdi zmdi-account-add zmdi-hc-fw"></i>&nbsp;&nbsp; Registro de usuarios <i class="zmdi zmdi-chevron-down pull-right zmdi-hc-fw"></i></div>
                        <ul class="list-unstyled">
                            <li><a href="Registro.jsp"><i class="zmdi zmdi-face zmdi-hc-fw"></i>&nbsp;&nbsp; Agregar Usuario</a></li>
                            <li><a href="Verusuarios_admin.jsp"><i class="zmdi zmdi-male-female zmdi-hc-fw"></i>&nbsp;&nbsp; Lista usuarios activos</a></li>
                            <li><a href="Verusuarios_inactivos.jsp"><i class="zmdi zmdi-male-female zmdi-hc-fw"></i>&nbsp;&nbsp; Lista usuarios desactivados</a></li>
                        </ul>
                    </li>
                    <li>
                        <div class="dropdown-menu-button"><i class="zmdi zmdi-assignment-o zmdi-hc-fw"></i>&nbsp;&nbsp; Libros y catálogo <i class="zmdi zmdi-chevron-down pull-right zmdi-hc-fw"></i></div>
                        <ul class="list-unstyled">
                            <li><a href="book.html"><i class="zmdi zmdi-book zmdi-hc-fw"></i>&nbsp;&nbsp; Nuevo libro</a></li>
                            <li><a href="catalog.html"><i class="zmdi zmdi-bookmark-outline zmdi-hc-fw"></i>&nbsp;&nbsp; Catálogo</a></li>
                        </ul>
                    </li>
                    <li>
                        <div class="dropdown-menu-button"><i class="zmdi zmdi-alarm zmdi-hc-fw"></i>&nbsp;&nbsp; Préstamos y reservaciones <i class="zmdi zmdi-chevron-down pull-right zmdi-hc-fw"></i></div>
                        <ul class="list-unstyled">
                            <li><a href="loan.html"><i class="zmdi zmdi-calendar zmdi-hc-fw"></i>&nbsp;&nbsp; Todos los préstamos</a></li>
                            <li>
                                <a href="loanpending.html"><i class="zmdi zmdi-time-restore zmdi-hc-fw"></i>&nbsp;&nbsp; Devoluciones pendientes <span class="label label-danger pull-right label-mhover">7</span></a>
                            </li>
                            <li>
                                <a href="loanreservation.html"><i class="zmdi zmdi-timer zmdi-hc-fw"></i>&nbsp;&nbsp; Reservaciones <span class="label label-danger pull-right label-mhover">7</span></a>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <div class="content-page-container full-reset custom-scroll-containers">
        <nav class="navbar-user-top full-reset">
            <ul class="list-unstyled full-reset">
                <figure>
                   <img src="assets/img/user01.png" alt="user-picture" class="img-responsive img-circle center-box">
                </figure>
                <li style="color:#fff; cursor:default;">
                    <span class="all-tittles"><%
            String exit="1";
        if (exit.equals(request.getParameter("exito"))) {
                String mensaje = "<script language='javascript'>alert('Registro exitoso');</script>";
                out.println(mensaje);
            }
         String exit2="2";
        if (exit2.equals(request.getParameter("exito"))) {
                String mensaje = "<script language='javascript'>alert('Modificacion exitosa');</script>";
                out.println(mensaje);
            }
        HttpSession misesion=request.getSession(true);
        String usuarioSesion=(String)misesion.getAttribute("username"); 
         String perfiluser=(String)misesion.getAttribute("perfiluser"); 
        if (usuarioSesion==null || perfiluser=="trabajador") {
                     response.sendRedirect("Acceso_denegado.jsp");   
        }else{
        out.print(""+usuarioSesion+"<br/>");}
        %></span>
                </li>
                <li  class="tooltips-general exit-system-button" data-href="CerrarSesion.jsp" data-placement="bottom" title="Salir del sistema">
                    <i class="zmdi zmdi-power"></i>
                </li>
                <li  class="tooltips-general search-book-button" data-href="searchbook.html" data-placement="bottom" title="Buscar libro">
                    <i class="zmdi zmdi-search"></i>
                </li>
                <li  class="tooltips-general btn-help" data-placement="bottom" title="Ayuda">
                    <i class="zmdi zmdi-help-outline zmdi-hc-fw"></i>
                </li>
                <li class="mobile-menu-button visible-xs" style="float: left !important;">
                    <i class="zmdi zmdi-menu"></i>
                </li>
            </ul>
        </nav>
        <div class="container">
            <div class="page-header">
              <h1 class="all-tittles">Sistema bibliotecario <small>Administración Usuarios</small></h1>
            </div>
        </div>
        <div class="container-fluid">
            <ul class="nav nav-tabs nav-justified"  style="font-size: 17px;">
                <li role="presentation"  class="active"><a href="Home_admin.jsp">Administradores</a></li>
            </ul>
        </div>
        <div class="container-fluid"  style="margin: 50px 0;">
            <div class="row">
                <div class="col-xs-12 col-sm-4 col-md-3">
                    <img src="assets/img/user01.png" alt="user" class="img-responsive center-box" style="max-width: 110px;">
                </div>
                <div class="col-xs-12 col-sm-8 col-md-8 text-justify lead">
                    Bienvenido a la sección para registrar nuevos usuarios al sistema, debes llenar todos los campos.
                </div>
            </div>
        </div>
        <div class="container-fluid">
            <div class="container-flat-form">
                <div class="title-flat-form title-flat-blue">Registrar un nuevo Usuario</div>
                <%
         String er1 = "1";
            if (er1.equals(request.getParameter("pas"))) {
                String mensaje = "<script language='javascript'>alert('Ambas contraseñas deben coincidir, reingrese por favor');</script>";
                out.println(mensaje);
            }
            String user1 = "1";
            if (user1.equals(request.getParameter("use"))) {
                String mensaje = "<script language='javascript'>alert('Usuario existente, use otro por favor');</script>";
                out.println(mensaje);
            }
        %>
                <form method="POST" action="Guardarusuario.jsp" autocomplete="off" >
                    <div class="row">
            
                       <div class="col-xs-12 col-sm-8 col-sm-offset-2">
                           <div class="group-material">
                                <input type="text" class="material-control tooltips-general" placeholder="Nombre Usuario" name="txtUser" required=""  data-toggle="tooltip" data-placement="top" title="Escribe el nombre del usuario">
                                <span class="highlight"></span>
                                <span class="bar"></span>
                                <label>Nombre Usuario</label>
                            </div>
                           <div class="group-material">
                                <input type="text" class="material-control tooltips-general" placeholder="Rut" id="rut" name="rut"  required="" pattern="[0-9-k]{9}" data-toggle="tooltip" data-placement="top" title="Escribe el rut sin guion">
                                <span class="highlight"></span>
                                <span class="bar"></span>
                                <label>Rut</label>
                            </div>
                           <div class="group-material">
                                <input type="password" class="material-control tooltips-general" placeholder="Contraseña" name="txtPassword" required=""  data-toggle="tooltip" data-placement="top" title="Escribe una contraseña">
                                <span class="highlight"></span>
                                <span class="bar"></span>
                                <label>Contraseña</label>
                            </div>
                           <div class="group-material">
                                <input type="password" class="material-control tooltips-general" placeholder="Repite la contraseña" name="txtPassword2" required=""  data-toggle="tooltip" data-placement="top" title="Repite la contraseña">
                                <span class="highlight"></span>
                                <span class="bar"></span>
                                <label>Repetir contraseña</label>
                           </div>
                            <div class="group-material">
                                <input type="text" class="material-control tooltips-general" placeholder="Nombre" name="txtNombre" required="" maxlength="70"  data-toggle="tooltip" data-placement="top" title="Escribe el nombre">
                                <span class="highlight"></span>
                                <span class="bar"></span>
                                <label>Nombre</label>
                            </div>
                           <div class="group-material">
                                <input type="text" class="material-control tooltips-general" placeholder="Apellido" name="txtApellido" required=""  data-toggle="tooltip" data-placement="top" title="Escribe el apellido">
                                <span class="highlight"></span>
                                <span class="bar"></span>
                                <label>Apellido</label>
                            </div>
                            <div class="group-material">
                                <input type="text" class="material-control tooltips-general" placeholder="Direccion" name="txtDireccion" required="" data-toggle="tooltip" data-placement="top" title="Escribe la direccion">
                                <span class="highlight"></span>
                                <span class="bar"></span>
                                <label>Direccion</label>
                            </div>
                           <div class="group-material">
                                <input type="text" class="material-control tooltips-general" placeholder="Telefono" name="txtTelefono" required="" data-toggle="tooltip" data-placement="top" title="Escribe el telefono +56912345678">
                                <span class="highlight"></span>
                                <span class="bar"></span>
                                <label>Telefono</label>
                            </div>
                           <div class="group-material">
                                <input type="date" class="material-control tooltips-general" placeholder="Fecha de nacimiento" name="txtFec_Nac" required=""data-toggle="tooltip" data-placement="top" title="Escribe la fecha de nacimiento">
                                <span class="highlight"></span>
                                <span class="bar"></span>
                                <label>Fecha nacimiento</label>
                            </div>
                           <div class="group-material">                               
                               <select id="Perfil_idPerfil" name="cmbPerfil"class="material-control tooltips-general" required="" data-toggle="tooltip" data-placement="top" title="Seleccione tipo usuario">
                                <option value="1">Administrador</option>
                                <option value="2">Trabajador</option>
                                <span class="highlight"></span>
                                <span class="bar"></span>
                                </select>
                           </div>
                            <div class="group-material">
                                <textarea name="txtArea" rows="auto" cols="134"placeholder="Ingrese una descripcion, campo obligatorio" required title="Escribe una descripción"></textarea>
                            </div>
                            <p class="text-center">
                                <button type="reset" class="btn btn-info" style="margin-right: 20px;"><i class="zmdi zmdi-roller"></i> &nbsp;&nbsp; Limpiar</button>
                                <button type="submit" name="submit" class="btn btn-primary"><i class="zmdi zmdi-floppy"></i> &nbsp;&nbsp; Guardar</button>
                            </p> 
                       </div>
                   </div>
                </form>
            </div>
        </div>

        
        <div class="modal fade" tabindex="-1" role="dialog" id="ModalHelp">
          <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title text-center all-tittles">ayuda del sistema</h4>
                </div>
                <div class="modal-body">
                 </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" data-dismiss="modal"><i class="zmdi zmdi-thumb-up"></i> &nbsp; De acuerdo</button>
                </div>
            </div>
          </div>
        </div>
        <footer class="footer full-reset">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-xs-12 col-sm-6">
                        <h4 class="all-tittles">Acerca de</h4>
                        <p>
                            Somos un equipo de estudiantes informáticos creando un sistema bibliotecario.
                        </p>
                    </div>
                    <div class="col-xs-12 col-sm-6">
                        <h4 class="all-tittles">Desarrollador</h4>
                        <ul class="list-unstyled">
                            <li><i class="zmdi zmdi-check zmdi-hc-fw"></i>&nbsp; Veronica y asociados <i class="zmdi zmdi-facebook zmdi-hc-fw footer-social"></i><i class="zmdi zmdi-twitter zmdi-hc-fw footer-social"></i></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="footer-copyright full-reset all-tittles">© 2018 Analistas</div>
        </footer>
    </div>
</body>
</html>
