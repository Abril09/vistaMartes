 <table class=" table table-striped table-bordered dt-responsive nowrap " id="table1">
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

<script>
     $(document).ready(function(){
            var tablas;    
                
           $.post("nuevo?action=cargar",function(data){
               var ob=$.parseJSON(data);
                tablas=$("#table1").DataTable({
                   'data':ob ,
                   
                   "searching": false ,
                   "columns":[{'data': "id_ejemplar"},
                       {'data':"isbn"},                       
                      { 'data':"titulo"},
                      { 'data':"Estado"},
                      { 'data':"ubicacion"},
                      { 'data':"Categoria"},
                      {'defaultContent':"<button type='button' class=' detalle btn btn-dark' data-toggle='modal' data-target='#ModalCenter'  >Detalle</button>"+"  "+
      "<button type='button' class=' borrar btn btn-dark'   >Borrar</button>"+
  "<button type='button' class=' editar btn btn-dark'   >  editar  </button>"}
                       
                   ],
                  "language": {
 
            "url": "//cdn.datatables.net/plug-ins/9dcbecd42ad/i18n/Spanish.json"
 
                 }
           
               });
               
             
              
       
        
    } );
    
    //traer valor de tabla 
    $('#table1 tbody').on('click', 'button.detalle', function () {
        
       
     var datos=tablas.row($(this).parents("tr")).data();
        
        
    main(datos.isbn);
 
    } );
    //metodo para traer id ejemplar
    
   $('#table1 tbody').on('click', 'button.borrar', function () {
        
       
     var datos=tablas.row($(this).parents("tr")).data();
        
        
       
       var libro={
            id_ejemplar: datos.id_ejemplar,
            isbn:datos.isbn,
            titulo:datos.titulo,
            estado:datos.Estado,
            ubicacion:datos.ubicacion,
            categoria:datos.Categoria
        }
        alert("hola")
        $.post("nuevo?action=borrar",{id_ejemplar:libro.id_ejemplar },function(data,status){
            if(data=1){
                alert("Exitoso");
                location.reload();
                
            }else{
                alert("No Exitoso");
            }
        });
        
 
    } );
      $('#table1 tbody').on('click', 'button.editar', function () {
        
       
        var datos=tablas.row($(this).parents("tr")).data(); 
        
           alert(datos.isbn);
           location.href="actualizar.jsp?id="+datos.id_ejemplar;
           
            
            
           
           
                                
                               
                                
                           
                   
                   

               
 
    } );
    
               
        
   
               
           }); 

    
    
</script>
