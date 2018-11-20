

<!-- Modal boton  editar en tabla -->
<div class="modal " id="ModalEditar" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Editar Libro</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
          <div class="container-fluid">
              <div class="row">
                  <div class="col-md-10 col-md-offset-1">
                       <!--Fromulario editar libro-->
                  <form >
                     
                          <!-- -->
                      <div class="form-group row">
                          
                          <label for="idLibro" class="col-sm-3 col-form-label ">Codigo Libro  </label>
                          <div class="col-sm-9">
                              <input type="text" class="form-control" id="idLibro" placeholder="Id libro" name="idLibro">
                          </div>
                      </div>
                       <div class="form-group row">
                          <label for="Isbn" class="col-sm-3 col-form-label">ISBN  </label>
                          <div class="col-sm-9">
                              <input type="text" class="form-control" id="Isbn" placeholder="ISBN" name="isbn">
                          </div>
                      </div>
                       <div class="form-group row">
                          <label for="Titulo" class="col-sm-3 col-form-label">Titulo </label>
                          <div class="col-sm-9">
                              <input type="text" class="form-control" id="Titulo" placeholder="Titulo" name="titulo">
                          </div>
                      </div>
                       <div class="form-group row">
                          <label for="ubicacion" class="col-sm-3 col-form-label">Ubicacion </label>
                          <div class="col-sm-9">
                              <input type="text" class="form-control" id="Ubicacion" placeholder="Ubicacion" name="ubicacion">
                          </div>
                      </div>
                        <div class=" form-group row ">
                                <label for="Estado" class="col-sm-3 col-form-label">  Estado </label>
                                <div class="col-sm-9">
                                     <select class="custom-select custom-select-sm" id="Estado" required="true" name="estado">
                                        <option selected></option>
                                     </select>
                                </div>
                        </div>  
                        <div class=" form-group row ">
                                <label for="categoria" class="col-sm-3 col-form-label">  Categoria </label>
                                <div class="col-sm-9">
                                     <select class="custom-select custom-select-sm" id="categoria" required="true" name="categoria">
                                        <option selected>Categoria</option>
                                     </select>
                                </div>
                        </div>  
                       <div class="form-group row">
                          <label for="Autor" class="col-sm-3 col-form-label">Autor </label>
                          <div class="col-sm-9">
                              <input type="text" class="form-control" id="Autor" placeholder="Autor" name="autor">
                          </div>
                      </div>
                        <div class="form-group row">
                          <label for="Editorial" class="col-sm-3 col-form-label">Editorial </label>
                          <div class="col-sm-9">
                              <input type="text" class="form-control" id="Editorial" placeholder="Editorial" name="editorial">
                          </div>
                      </div>
                      
                      
                  </form>
                  </div> 
              </div>
              
          </div>
           
          
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
        <button type="button" class="btn btn-primary">Guardar Cambios</button>
      </div>
    </div>
  </div>
</div>

<script>
   
    //llena modal editar con datos //
    function Formulario(id){
        //asigna valor a input de formulario //
         getLibro(id).then((libro) => {
               $("[name='idLibro']").val(libro.id_ejemplar);
               $("[name='isbn']").val(libro.isbn);
               $("[name='titulo']").val(libro.titulo);
               $("[name='ubicacion']").val(libro.ubicacion);
               $("#categoria option:selected").text(libro.Categoria);
               $("[name='autor']").val(libro.Autor);
               $("[name='editorial']").val(libro.Editorial);

          });
     }

     //devuelve un objeto promise de libro//
    function getLibro(isbn) {
       return new Promise((resolve) => {
           var ruta="Libros?action=getLibro&idEjemplar="+isbn;
           $.get(ruta, (data) => {
               var libro=$.parseJSON(data);
               resolve(libro);
           });
       });
     }

  

    
</script>