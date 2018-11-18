 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <h1>Libro</h1>
        <div class="container" style="padding:2px">
            <div class="row" style="height: 50px;"></div>
            <div class="row">
                <div class="col-2"></div>
                <div class="col-10 ">
                    <form method="post" action="Libros?action=CrearEjemplar" name="formulario" >
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
     function cargarForm(action) {
    var t = action.split('=');
    var index=t[1];
     alert("hola");
   
    $.ajax(
            {
                url: "Libros?action=" + action,
                type: "Get",
                datatype: "json",
                 
                success: function (data) {
                    alert(data);
                    try {

                        var obj = $.parseJSON(data);
                        
                        if (obj.id_ejemplar != 0) {
                           
                            var libro = {
                                id_ejemplar:obj.id_ejemplar,
                                isbn: obj.ISBN,
                                titulo: obj.titulo,
                                                              
                                categoria: obj.Categoria,
                                autor: obj.Autor,
                                editorial:obj.Editorial

                            };
                            if (libro != null) {
                                
                                $("input#titulo").val(libro.titulo);
                                $("input#estado").val("Disponible");
                                $("#categoria option:selected").text(libro.categoria);
                                $("#autor option:selected").text(libro.autor);
                                 $("#editorial option:selected").text(libro.editorial);
                                 $("#id_isbn").val(obj.id_ejemplar);
                                $('input').prop('readonly', true);
                                $('#ubicacion').prop('readonly', false);
                                $('select').attr('disabled','disabled')
                               $("input#OP").val("1");
                            }
                        } else {
                           

                            $.ajax(
                                    {
                                        url: "https://www.googleapis.com/books/v1/volumes?q=isbn:" + index,
                                        datatype: "json",
                                        type: "get",
                                        success: (function (data) {
                                            
                                        if(data["totalItems"]!=0){
                                         try{       
                                            var libro = {
                                                titulo: data["items"][0]["volumeInfo"]["title"],
                                                isbn: data["items"][0]["volumeInfo"]["industryIdentifiers"][1]["identifier"],
                                                autor: data["items"][0]["volumeInfo"]["authors"],
                                                editorial: data["items"][0]["volumeInfo"]["publisher"]
                                                
                                            };
                                              
                                               
                                                
                                                $("input#titulo").val(libro.titulo);
                                                $("input#estado").val("Disponibles");
                                                $("#editorial option:selected").text(libro.editorial);
                                                $("#autor option:selected").text(libro.autor);
                                                $('input').prop('readonly', true);
                                               
                                                $('#ubicacion').prop('readonly', false);
                                                 $("input#OP").val("2");
                                                 
                                             }catch(err){
                                                 alert("catch");
                                                 
                                             }
                                         } 
                                         else{
                                             alert("sin registros");
                                              $("input#OP").val("3");
                                               $("input#estado").val("Disponibles");
                                                $('#estado').prop('readonly', true);
                                                $('#isbn').prop('readonly', true);
                                               
                                         }
                                        })

                                    }


                            );
            
            
        }

        }       catch (err){


                }
        } 
}

);}

function llenarCategoria(action,op) {

    $.ajax(
            {
                url: "Libros?action="+action,
                datatype: "json",
                type: "get",
                async:true,
               
                success: (function (data) {
                        var obj = $.parseJSON(data);
                        
                        switch(op){
                            case "1":
                              $("#categoria").find("option").hide();
                                for (var i = 0; i < obj.length; i++){
                                     
                                llenarComboBox("#categoria",obj[i].id_categoria,obj[i].nombre);
                                
                                } 
                                break;
                            case "2":
                               $("#autor").find("option").hide();
                                     for (var i = 0; i < obj.length; i++){
                                         
                                        llenarComboBox("#autor",obj[i].id_autor,obj[i].nombre);
                                       
                                }  break;
                            case "3":
                                $("#editorial").find("option").hide();
                                 for ( var i = 0 ; i < obj.length ; i++){
                                         
                                        llenarComboBox("#editorial",obj[i].id_editorial,obj[i].nombre);
                                       
                                }  break;
                            default:
                            
                        }
                        
                        
                  




                })

            }


    );



}
function llenarComboBox(id,value,data){
    
     $(id).append("<option value="+value+">"+data+"</option>");
    
}

function inicio(){
          $(document).ready(function(){
                   $("#categoria").click(function(){
                       
                       llenarCategoria("categorias","1");});
                   
                    $("#autor").click(function(){llenarCategoria("autor","2");});
                     $("#editorial").click(function(){llenarCategoria("editorial","3");});
                  cat();
                  
        
    });
    
     function cat(){
                   $("#but").click(function(){
                       
                       var cat=$("#categoria").val();
                        $("#id_categoria").val(cat); 
                        
                        var edito=$("#editorial").val();
                        $("#id_editorial").val(edito); 
                        var autor =$("#autor").val();
                       
                        
                        $("#id_autor").val(autor); 
                        
                   });
                   
                   
               }
}
               
        </script>    

   