<%-- 
    Document   : actualizar
    Created on : 09-11-2018, 21:47:43
    Author     : programar
--%>
<%@page import="Entidades.libro"%>
<%@page import="Model.libroModel"%>
<%  libroModel l= new libroModel();
    String r=request.getParameter("id");
    libro lib =new libro();
    lib=l.LibroActualizar(r);
    out.print(r);
%>
<html>
    <head>
         <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" src="folder/scriptprueba.js"></script>
        <meta name="viewport" content="user-scalable=no, width=device-width, initial-scale=1">
        <LINK REL=StyleSheet HREF="folder/estilo.css" TYPE="text/css" MEDIA=screen>
        <link rel="stylesheet" type="text/css" href="folder/datatables.min.css"/>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        
    </head>
    <body>
 <div id="script">
            <script type="text/javascript" src="folder/cargarFormulario.js" > </script>
            
        </div>
        
        <div class="container" style="padding:2px">
            <div class="row" style="height: 50px;"></div>
            <div class="row">
                <div class="col-2"></div>
                <div class="col-10 ">
                    <form method="post" action="nuevo?action=actualizar" name="formulario" >
                        <div class="form-row">
                            <input type="hidden" name=id_ejemplar value=<%=r %> >
                            <div class="form-group col-md-5">
                                <label for="Nombre" class="mr-sm-2">  ISBN  </label>
                                <input type="number" placeholder="ISBN" name="ISBN" class= "form-control form-control-sm" id="isbn" required="True" value=<%out.print(lib.getIsbn());%> >>

                            </div>
                            <div class="col-md-5" style="margin-top: 31px" >
                                <button type="button" class="btn btn-outline-success">buscar</button>

                            </div>
                            <div class="form-group col-md-5">
                                <label for="Apellido" class="mr-sm-2">  Titulo  </label>
                                <input type="text" placeholder="Titulo" name="titulo" class= "form-control form-control-sm" id="titulo" required="True" value=<%=lib.getTitulo() %>>
                            </div>
                            <div class="form-group col-md-5  ">

                            </div>

                            <div class="form-group col-md-5  ">
                                <label for="Estado" class="mr-sm-2">  Estado  </label>
                                <input type="text" placeholder="Estado" name="ide_estado" class= "form-control form-control-sm" id="estado" value="Disponible" >
                            </div>

                            <div class="form-group col-md-5 ">

                            </div>
                            <div class="form-group col-md-5">
                                <label for="Apellido" class="mr-sm-2">  ubicacion  </label>
                                <input type="text" placeholder="Ubicacion" name="ubicacion" class= "form-control form-control-sm" id="ubicacion" required="True" value=<%=lib.getUbicacion() %>>
                            </div>
                            <div class="form-group col-md-5 ">

                            </div>
                            <div class=" col-md-5  ">
                                <label for="categoria" class="mr-sm-2">  categoria </label>
                                <select class="custom-select custom-select-sm" id="categoria" required="true">
                                    <option selected><%=lib.getCategoria() %></option>

                                </select>
                                <input type="hidden" name="categoria" id="id_categoria">
                            </div>
                            <div class="form-group col-md-5 ">
                                <input type="hidden" id="id_isbn" name="id_isbn"/>
                            </div>
                            <div class=" col-md-5  ">
                                <label for="autor" class="mr-sm-2">  Autor </label>
                                <select class="custom-select custom-select-sm" id="autor" name="autor">
                                    <option selectedvalue=><%=lib.getAutor() %></option>
                                   <input type="hidden" name="id_autor" id="id_autor">     
                                </select>
                            </div>

                            <div class="form-group col-md-5 ">
                            </div> 

                            <div class=" col-md-5  ">
                                <label for="editorial" class="mr-sm-2">  Editorial </label>
                                <select class="custom-select custom-select-sm" id="editorial" name="editorial">
                                    <option selected><%=lib.getEditorial() %></option>
                                    <input type="hidden" name="id_editorial" id="id_editorial">
                                </select>
                            </div>



                            <div class="col-md-5" ></div>
                            <div class="form-group col-md-5  " style="margin-top: 50px">
                                <input type="submit" class="btn btn-primary btn-md" value="Enviar" id="but">
                            </div>
                            <input type="hidden" name="OP" id="OP"/>

                        </div>                
                    </form>

                </div>
                                    <script>
  
                                               $("input#id_estado").val("Disponibles");
                                                $('#titulo').prop('readonly', true);
                                                $('#isbn').prop('readonly', true);
</script>
            </body>
</html>
