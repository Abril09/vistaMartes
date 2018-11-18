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