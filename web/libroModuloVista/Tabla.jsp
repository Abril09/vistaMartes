<div class="container" style="margin-top: 20px;" >
    <div class="row">
        <div class="col-xs-12 col-sm-4 col-md-9 col-xs-offset-1">
         
         
<table class="  display dt-responsive nowrap " id="table1">
            <thead class="thead-dark">
            <th scope="col">#</th>
            <th scope="col">ISBN</th>
            <th scope="col">titulo</th>
            <th scope="col">Estado</th>
            <th scope="col">Ubicacion</th>
            <th scope="col">Categoria</th>
            <th scope="col" colspan="3">Accion</th>
            </thead>
            <tbody id="tbody">
                
            </tbody>
</table>
            </div>
        </div>
</div> 
<script>

        $(document).ready(function(){


            traerlibros();


            //muestra detalle modal google//
            $('#table1 tbody').on('click', 'button.detalle', function () {

                var isbn=traerFila("table1",this).isbn;
               //carga modal desde api googlebooks//
                 cargarModalLibro(isbn);

            } );
            //metodo para borrar ejemplar boton borrar//    
            $('#table1 tbody').on('click', 'button.borrar', function () {
               //crea objeto fila libro
                var datos=traerFila("table1",this);       

                $.post("Libros?action=borrar",{id_ejemplar:datos.id_ejemplar },function(data,status){
                    if(data=1){
                        alert("Exitoso");
                        location.reload();

                         }else{
                        alert("No Exitoso");
                    }
                });                

            });

            //metodo para boton editar ejemplar
            $('#table1 tbody').on('click', 'button.editar', function () {       
                var id_ejemplar=traerFila("table1",this).id_ejemplar; 
                //metodo llena formulario modaleditar, parametro id_ejemplar//
                   Formulario(id_ejemplar);

              } );








              


         });  //Fin de document.ready//         



       //llenar tabla libro catalogo //

        function traerlibros(){

                   $.post("Libros?action=cargar",function(data){
                       var ob=$.parseJSON(data);
                        $("#table1").DataTable({
                           'data':ob ,

                           "searching": true ,
                           "columns":[{'data': "id_ejemplar"},
                               {'data':"isbn"},                       
                              { 'data':"titulo"},
                              { 'data':"Estado"},
                              { 'data':"ubicacion"},
                              { 'data':"Categoria"},
                              {'defaultContent':"<button type='button' class=' detalle btn ' data-toggle='modal' data-target='#ModalCenter'  >Detalle</button>"+"  "+
                                                "<button type='button' class=' borrar btn '   >Borrar</button>"+" "+
                                                 "<button type='button' class='btn editar' data-toggle='modal' data-target='#ModalEditar'>Editar</button>"}

                           ],
                          "language": {

                                    "url": "//cdn.datatables.net/plug-ins/9dcbecd42ad/i18n/Spanish.json"

                            }

                       });            

                    });  




         }

      //retorna un objeto libro desde la fila de la tabla//
        function traerFila(id,button){
             var datos=$("#"+id).DataTable().row($(button).parents("tr")).data();



               var libro={
                    id_ejemplar: datos.id_ejemplar,
                    isbn:datos.isbn,
                    titulo:datos.titulo,
                    estado:datos.Estado,
                    ubicacion:datos.ubicacion,
                    categoria:datos.Categoria
                };

                return libro;

        }


    
    
</script>
