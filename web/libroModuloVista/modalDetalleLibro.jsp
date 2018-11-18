<div  class="modal fade" id="ModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="titulo">Modal title</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close" >
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body" id="mbody">
                        <div class="container-fluid">
                            <div class="row">
                                <div class="card-deck col-md-12">
                                    <div class="card  border-light mb-3" style="width: 100%;">
                                        <center>
                                            <img class="card-img-top" src="folder/img/loading.gif" alt="cargarLibro" style="width: 12rem;" id="as">
                                        </center>
                                    </div>
                                    <div class="card-body">

                                        <br /> <p id="isbn" class="card-text"></p>
                                        <p id="dat2" class="card-text"></p>
                                        <p id="dat3"  class="card-text"> </p>
                                        <p class="card-text" id="desc"></p>
                                        <p id="dat" class="card-text"></p>
                                    </div>
                                </div>
                            </div>



                        </div>
                    </div>
                    <div class="modal-footer">

                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                    </div>
                </div>
            </div>
        </div>
<script> 
   
   
  function cargarModalLibro(isbn){
            
            var api="https://www.googleapis.com/books/v1/volumes?q=isbn:"+isbn;
            $.get(api,function(data){
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
                $("#as").attr("src", libro.Imagen);
                $("#dat3").text("Autor:  " + libro.Autor);
                $("#isbn").text("ISBN:   " + libro.ISBN);
                $("#dat2").text("Año:   " + libro.Año);


                if (libro.Descripcion != null) {
                    $("#dat").text("Descripcion:  " + libro.Descripcion);

                } else {
                    $("#dat").hide();
                }
            } catch (err) {
                $("#titulo").text("No disponible ");
                $("#as").attr("src", "folder/img/error.png");

                $("#desc").text("");

                $("#dat").text("");
                $("#dat3").text("");
                $("#isbn").text("");
                $("#dat2").text("");
            }
        });
    }
</script>