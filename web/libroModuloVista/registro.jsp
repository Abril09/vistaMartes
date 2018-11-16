
        <div id="script">
            <script type="text/javascript" src="folder/cargarFormulario.js" > </script>
            
        </div>
        <h1>Libro</h1>
        <div class="container" style="padding:2px">
            <div class="row" style="height: 50px;"></div>
            <div class="row">
                <div class="col-2"></div>
                <div class="col-10 ">
                    <form method="post" action="nuevo?action=CrearEjemplar" name="formulario" >
                        <div class="form-row">

                            <div class="form-group col-md-5">
                                <label for="Nombre" class="mr-sm-2">  ISBN  </label>
                                <input type="number" placeholder="ISBN" name="ISBN" class= "form-control form-control-sm" id="isbn" required="True" >

                            </div>
                            <div class="col-md-5" style="margin-top: 31px" >
                                <button type="button" class="btn btn-outline-success" onclick="llamarLibro()">buscar</button>

                            </div>
                            <div class="form-group col-md-5">
                                <label for="Apellido" class="mr-sm-2">  Titulo  </label>
                                <input type="text" placeholder="Titulo" name="titulo" class= "form-control form-control-sm" id="titulo" required="True">
                            </div>
                            <div class="form-group col-md-5  ">

                            </div>

                            <div class="form-group col-md-5  ">
                                <label for="Estado" class="mr-sm-2">  Estado  </label>
                                <input type="text" placeholder="Estado" name="Estado" class= "form-control form-control-sm" id="estado" value="Disponible" >
                            </div>

                            <div class="form-group col-md-5 ">

                            </div>
                            <div class="form-group col-md-5">
                                <label for="Apellido" class="mr-sm-2">  ubicacion  </label>
                                <input type="text" placeholder="Ubicacion" name="ubicacion" class= "form-control form-control-sm" id="ubicacion" required="True">
                            </div>
                            <div class="form-group col-md-5 ">

                            </div>
                            <div class=" col-md-5  ">
                                <label for="categoria" class="mr-sm-2">  categoria </label>
                                <select class="custom-select custom-select-sm" id="categoria" required="true">
                                    <option selected>Categoria</option>

                                </select>
                                <input type="hidden" name="categoria" id="id_categoria">
                            </div>
                            <div class="form-group col-md-5 ">
                                <input type="hidden" id="id_isbn" name="id_isbn"/>
                            </div>
                            <div class=" col-md-5  ">
                                <label for="autor" class="mr-sm-2">  Autor </label>
                                <select class="custom-select custom-select-sm" id="autor" name="autor">
                                    <option selected>Autor</option>
                                   <input type="hidden" name="id_autor" id="id_autor">     
                                </select>
                            </div>

                            <div class="form-group col-md-5 ">
                            </div> 

                            <div class=" col-md-5  ">
                                <label for="editorial" class="mr-sm-2">  Editorial </label>
                                <select class="custom-select custom-select-sm" id="editorial" name="editorial">
                                    <option selected>Editorial</option>
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



            </div>

        </div>


        <script >
         inicio();
               function llamarLibro(){
                   
                   var t=$("#isbn").val();
                   cargarForm("libro&isbn="+t);

               };
              
               
        </script>    

   