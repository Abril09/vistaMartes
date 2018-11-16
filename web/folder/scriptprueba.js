 function cargarPagina(action) {
    //metodo para cargar de pagina consulta base de datos
    
    $.ajax(
            {
                url: "nuevo?action=" + action,
                type: "post",
                datatype: "json",
                async: true, 

                success: function (data) {
                     
                    var obj = $.parseJSON(data);
                    
                    var t = action.split('=');
                    var result="";
                    var index=t[1];
                    for (var i = 0; i < obj.length; i++) {
                        if (obj[i].Estado == "baja") {
                            obj[i].ubicacion = "No disponible";
                        }
                        
                        
                        var fila="<tr  id='rw'>";
                        
                        if( index== obj[i].id_ejemplar){
                               fila="<tr style='color:red;' id='rw'>"
                               result =  fila+"<th scope='row'>" + obj[i].id_ejemplar + "</td>" +
                                "<td>" + obj[i].isbn + "</td>" +
                                "<td>" + obj[i].titulo + " </td> " +
                                "<td>" + obj[i].Estado + " </td> " +
                                "<td>" + obj[i].ubicacion + " </td> " +
                                "<td>" + obj[i].Categoria + " </td> " +
                                "<td>" +
                                "<button type='button' class='btn btn-dark' data-toggle='modal' data-target='#ModalCenter' onclick='main(" + obj[i].isbn + ")' >Detalle</button>"+
                       

                                 "</td>" +
                                  "</tr>";
                          break;
                        
                       } else{
                           result =  fila+"<th scope='row'>" + obj[i].id_ejemplar + "</td>" +
                                "<td>" + obj[i].isbn + "</td>" +
                                "<td>" + obj[i].titulo + " </td> " +
                                "<td>" + obj[i].Estado + " </td> " +
                                "<td>" + obj[i].ubicacion + " </td> " +
                                "<td>" + obj[i].Categoria + " </td> " +
                                "<td>" +
                                   
                                "<td>" +
                                "<button type='button' class='btn btn-dark' data-toggle='modal' data-target='#ModalCenter' onclick='main(" + obj[i].isbn + ")' >Detalle</button>"+
                                "</td>" +
                               

                              +
                                
                                    "</tr>"+result ;
                           
                           
                       }                       

                    }
                    
                    $('#tbody').append(result);
                    
                }
            }

    );
    

}





function main(isb) {
    var isbn = isb;
    data(isbn);

}

//Metodo para buscar info desde API de google
function data(isbn) {
   
    $.ajax(
            {
                url: "https://www.googleapis.com/books/v1/volumes?q=isbn:" + isbn,
                datatype: "json",
                type: "get",
                 async: true, 
                success: (function (data) {
                    try {
                        var libro = {
                            Titulo: data["items"][0]["volumeInfo"]["title"],
                            ISBN: data["items"][0]["volumeInfo"]["industryIdentifiers"][1]["identifier"],
                            Autor: data["items"][0]["volumeInfo"]["authors"],
                            Descripcion: data["items"][0]["volumeInfo"]["description"],
                            Año: data["items"][0]["volumeInfo"]["publishedDate"],
                            Imagen: data["items"][0]["volumeInfo"]["imageLinks"]["smallThumbnail"],
                            Reseña: data["items"][0]["searchInfo"]["textSnippet"]
                        };

                        $("#desc").text("Reseña" + "\n" + libro.Reseña)
                        $("#titulo").text("Titulo:  " + libro.Titulo + "     " + "ISBN: " + libro.ISBN)
                        $("#as").attr("src", libro.Imagen)
                        $("#dat3").text("Autor:  " + libro.Autor)
                        $("#isbn").text("ISBN:   " + libro.ISBN)
                        $("#dat2").text("Año:   " + libro.Año)


                        if (libro.Descripcion != null) {
                            $("#dat").text("Descripcion:  " + libro.Descripcion);

                        } else {
                            $("#dat").hide();
                        }
                    } catch (err) {
                        $("#titulo").text("No disponible ")
                        $("#as").attr("src", "folder/img/error.png")
                        
                        $("#desc").text("")

                        $("#dat").text("");
                        $("#dat3").text("")
                        $("#isbn").text("")
                        $("#dat2").text("")
                    }



                })

            }


    );
}



