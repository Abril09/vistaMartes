<%@page import="java.util.ArrayList"%>
<%@page import="Conexiones.Usuario"%>
<%@page import="Conexiones.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Administradores</title>
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
            <div class="container-fluid">
            <h2 class="text-center all-tittles">Lista de Usuarios</h2>
            <div class="div-table">
                <div class="div-table-row div-table-head">
                    <div class="div-table-cell">Rut</div>
                    <div class="div-table-cell">Perfil</div>
                    <div class="div-table-cell">Nombre Usuario</div>
                    <div class="div-table-cell">Contraseña</div>
                    <div class="div-table-cell">Nombre</div>
                    <div class="div-table-cell">Apellido</div>
                    <div class="div-table-cell">Direccion</div>
                    <div class="div-table-cell">Fecha nacimiento</div>
                    <div class="div-table-cell">Telefono</div>
                    <div class="div-table-cell">Estado</div>
                    <div class="div-table-cell">Descripción</div>
                    <div class="div-table-cell">Cambiar Password</div>
                    <div class="div-table-cell">Editar</div>
                </div>  
                
                    <%
                                    Conexion cn = new Conexion();

                        ArrayList<Usuario> users=cn.verUsuario();
                         for (int x = 0; x < users.size(); x++) {
                             out.print("<div class=\"div-table-row\">");
                             out.print("<div class=\"div-table-cell\">");
                             out.print(users.get(x).get_rut());
                             out.print("</div>");
                             out.print("<div class=\"div-table-cell\">");
                             out.print(users.get(x).getPerfil_idPerfil());
                             out.print("</div>");
                             out.print("<div class=\"div-table-cell\">");
                             out.print(users.get(x).getNombre_usuario());
                             out.print("</div>");
                             out.print("<div class=\"div-table-cell\">");
                             out.print(users.get(x).getPassword());
                             out.print("</div>");
                             out.print("<div class=\"div-table-cell\">");
                             out.print(users.get(x).getNombre());
                             out.print("</div>");
                             out.print("<div class=\"div-table-cell\">");
                             out.print(users.get(x).getApellido());
                             out.print("</div>");
                             out.print("<div class=\"div-table-cell\">");
                             out.print(users.get(x).getDireccion());
                             out.print("</div>");
                             out.print("<div class=\"div-table-cell\">");
                             out.print(users.get(x).getFecNac());
                             out.print("</div>");
                             out.print("<div class=\"div-table-cell\">");
                             out.print(users.get(x).getTelefono());
                             out.print("</div>");
                              out.print("<div class=\"div-table-cell\">");
                             if (users.get(x).getEstado()==true){
                             out.print("Activo");
                             }else{
                             out.print("Inactivo");    
                             }
                             out.print("</div>");
                              out.print("<div class=\"div-table-cell\">");
                             out.print(users.get(x).getDescripcion());
                             out.print("</div>");
                             out.print("<div class=\"div-table-cell\">");
                             out.print("<a href=\"CambioPassword.jsp?id="+users.get(x).get_rut()+"\"><button class=\"btn btn-success\"><i class=\"zmdi zmdi-refresh\"></i></button></a>");
                             out.print("</div>");
                             out.print("<div class=\"div-table-cell\">");
                             out.print("<a href=\"Editar.jsp?id="+users.get(x).get_rut()+"\"><button class=\"btn btn-success\"><i class=\"zmdi zmdi-refresh\"></i></button></a>");
                             out.print("</div>");
                             out.print("</div>");
                         }
                        %>
           
            </div>                  
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
