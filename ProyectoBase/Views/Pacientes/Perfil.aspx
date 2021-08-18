<%@ Page Title="" Language="C#" MasterPageFile="~/Views/DisenoBootstrap3.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>


<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">

    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.24/css/dataTables.bootstrap.min.css">
      <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.24/js/dataTables.bootstrap.min.js"></script>

    <%-- Scripts de Gestion --%>
    <script>

        $(document).ready(function () {
            var open = false;
            $('#btnInformacion').click();

            
            $("#btnGestionar").click(function () {
                var icon = document.getElementById('icon');
                
                if (open) {
                    icon.className = 'fa fa-angle-down';
                } else {
                    icon.className = 'fa fa-angle-up';
                }
                open = !open;

            });
            var open2 = false;
            $("#btnFotografias").click(function () {
                var icon2 = document.getElementById('icon2');

                if (open2) {
                    icon2.className = 'fa fa-angle-down';
                } else {
                    icon2.className = 'fa fa-angle-up';
                }
                open2 = !open2;

            });
            var open3 = true;
            $("#btnInformacion").click(function () {
                var icon3 = document.getElementById('icon3');

                if (open3) {
                    icon3.className = 'fa fa-angle-down';
                } else {
                    icon3.className = 'fa fa-angle-up';
                }
                open3 = !open3;

            });
        });
    </script>
    <style>
        .textarea {
            overflow: auto !important;
        }
        .fa-arrow-down{
          transform: rotate(0deg);
          transition: transform 0.3s linear;
          font-size: 27px;
        }

        .fa-arrow-down.open{
          transform: rotate(180deg);
          transition: transform 0.3s linear;
          font-size: 27px;
}
        .card {
        border-radius: 0.60rem;
        border-color: #00000033;
        }
        .carousel-inner > .item > img {
  width:640px;
  height:360px;
}
        .imgen-carrusel {
            float: left;
            width:  100px;
            height: 500px;
            object-fit: cover;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <main id="main" style="    margin-top: -1pc;">

    <!-- ======= About Section ======= -->


        <form style="background: #F7F7F7;"  method="post" action="<%: Url.Content("~/Clientes/DescargaExcel") %>">

        <section id="about" class="about" style="    margin-top: 8pc;">
            <br />
            <br />
            <br />
            <br />
            <div class="card border-secondary <%--border-0--%> shadow rounded-lg mt-5" style="margin-top: -55px; background-color: #e3e3e3;">
                <div class="container" data-aos="fade-up">
                    <input hidden id="idCliente" name="idCliente" value="<%= ViewData["id"]%>"/>
                    <div class="row">
                        <div class="card-body" style="    margin-top: -5pc;">
                        <div class="card border-left-warning shadow ">
                        <div class="card-body">
                            <div style="text-align: center;">
                                <div class="icon-home icon-shape icon-shape-success rounded-circle mb-4" style="    margin-top: -8pc;">                              
                                    <img src="https://media.istockphoto.com/vectors/female-doctor-wearing-a-medical-mask-coronavirus-covid19-prevention-vector-id1209936855" alt="" class="user-profil" style="    width: 13pc;
                                    height: 205px;
                                    border-radius: 5pc;">
                                </div> 
                                <h1 style="color: #bece52; font-family: 'Open Sans', sans-serif; font-style: inherit;"><%= ViewData["Nombre"] %></h1>
                                <h4 style="color: #858585;"><%= ViewData["Correo"]  %></h4>
                                <h5 style="color: #858585;"><%= ViewData["Telefono"]  %></h5>
                                
                            </div>
                            <div class="row">
                                <div class="col-12">
                                    <label for="txtFotos"></label>
                                        <div class="row">
                                            <div class="col">
                                                <h4 style="color: #858585; font-family: 'Open Sans', sans-serif; font-style: initial !important">Información Solicitud N°<%= ViewData["idSolicitud"] %></h4>
                                            </div>
                                            <div class="col" style="    text-align: end;">
                                                <a id="btnInformacion" style="color: #858585; font-family: 'Open Sans', sans-serif; font-style: initial !important" data-toggle="collapse" data-target="#collapseExample3" role="button" aria-expanded="false" aria-controls="collapseExample3"><i style="color: #C6D41D;     font-size: 31px;" id="icon2" class="fa fa-angle-down"></i></a>
                                            </div>
                                        </div>                                  
                                            <hr />
                                            <div class="collapse" id="collapseExample3">
                                    <div class="row">
                                        <div class="col">
                                            <label for="txtMedico"></label>
                                            <label style="color: /*#C6D41D*/ black">Médico Asignado </label>
                                            <div id="selDiv">
                                                <input disabled id="txtMedico" name="txtMedico" type='text' class='form-control' value='<%= ViewData["MedicoAsignado"]  %>'>
                                            </div>
                                            <div class="invalid-feedback">Seleccione una opción</div>
                                            <br />
                                        </div>
                                        <div class="col">
                                            <label for="txtEstado"></label>
                                        
                                            <label style="color: black">Estado actual </label>
                                            <div id="selDiv">
                                                <input disabled id="txtEstado" name="txtEstado" type='text' class='form-control' value='<%= ViewData["EstadoSolicitud"] %>'>
                                            </div>
                                            <div class="invalid-feedback">Seleccione una opción</div>
                                            <br />
                                        </div>
                                        <div class="col">
                                            <label for="txtFechaNacimiento"></label>
                                        
                                            <label style="color: black">Fecha de Cirugía </label>
                                            <div id="selDiv">
                                                <input disabled id="txtFechaCirugia" name="txtFechaCirugia" type='text' class='form-control' value='<%= ViewData["FechaCirugia"] %>'>
                                                <input hidden name="Nacimiento" value="<%= ViewData["FechaNacimiento"] %>"/>
                                            </div>
                                            <div class="invalid-feedback">Seleccione una opción</div>
                                            <br />
                                        </div>
                                    </div>
                                        <h5 style="color: #bece52;"></h5>
                                    </div>
                                </div>
                            </div>
                           
                           <div class="row">
                                <div class="col-12">
                                    <label for="txtFotos"></label>
                                <div class="row">
                                    <div class="col">
                                        <h4 style="color: #858585; font-family: 'Open Sans', sans-serif; font-style: initial !important">Fotografías</h4>
                                    </div>
                                    <div class="col" style="    text-align: end;">
                                        <a id="btnFotografias" style="color: #858585; font-family: 'Open Sans', sans-serif; font-style: initial !important" data-toggle="collapse" data-target="#collapseExample2" role="button" aria-expanded="false" aria-controls="collapseExample2"><i style="color: #C6D41D;     font-size: 31px;" id="icon2" class="fa fa-angle-down"></i></a>
                                    </div>
                                </div>                                  
                                    <hr />
                                    <div class="collapse" id="collapseExample2">
                                        <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                                        <ol class="carousel-indicators">
                                        <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                                        <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                                        <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                                        <li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
                                        <li data-target="#carouselExampleIndicators" data-slide-to="4"></li>
         
                                        </ol>
                                        <div class="carousel-inner" <%--style="border-radius: 7px;border-color: #ededed;border-style: solid;--%>">
                                        <div class="carousel-item active">
                                            <div class="text-center" style="margin: 5px;"><h5 style="color: #a7a7a7;">Desde arriba</h5></div>
                                            <img class="d-block w-100 imgen-carrusel" src="<%= ViewData["Foto1"]%>" alt="First slide" onclick="window.open(this.src)">
                                          <div class="carousel-caption d-none d-md-block">

                                          </div>
                                        </div>
                                        <div class="carousel-item">
                                            <div class="text-center" style="margin: 5px;"></div>
                                            <div class="text-center" style="margin: 5px;"><h5 style="color: #a7a7a7;">Perfil izquierdo</h5></div>
                                            <img class="d-block w-100 imgen-carrusel" src="<%= ViewData["Foto2"]%>" alt="Second slide">
                                             <div class="carousel-caption d-none d-md-block">

                                            </div>
                                        </div>
                                        <div class="carousel-item">
                                            <div class="text-center" style="margin: 5px;"><h5 style="color: #a7a7a7;">Perfil Derecho</h5></div>
                                                                                            
                                     
                                            <img class="d-block w-100 imgen-carrusel" src="<%= ViewData["Foto3"]%>" alt="Third slide">
                                            <div class="carousel-caption d-none d-md-block">

                                            </div>
                                        </div>
                                        <div class="carousel-item">
                                            <div class="text-center" style="margin: 5px;"><h5 style="color: #a7a7a7;">De atrás</h5></div>
                                                                                            
    
                                            <img class="d-block w-100 imgen-carrusel" src="<%= ViewData["Foto4"]%>" alt="Third slide">
                                             <div class="carousel-caption d-none d-md-block">

                                            </div>
                                        </div>
                                        <div class="carousel-item">
                                            <div class="text-center" style="margin: 5px;"><h5 style="color: #a7a7a7;">De frente</h5></div>
                                                                                            

                                            <img class="d-block w-100 imgen-carrusel" src="<%= ViewData["Foto5"]%>" alt="Third slide" >
                                            <div class="carousel-caption d-none d-md-block">

                                            </div>
                                        </div>
                                        </div>
                                        <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                        <span class="sr-only">Previous</span>
                                        </a>
                                        <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                        <span class="sr-only">Next</span>
                                        </a>
                                    </div>
                                        </div>
                                </div>
                            </div>
                            <script>
                                $(document).ready(function () {
                                    $('#collapseExample3').collapse("toggle");
                                   
                                });
                               
                            </script>
<%--                            <button id="btnExcel" type="button"> Apretar</button>
                            <script>
                                $(document).ready(function () {
                                    var idCliente = $("#idCliente").val();
                                    idCliente
                                    $("#btnExcel").click(function () {
                                        console.log("hooola!")
                                        $.ajax({
                                            url: '<%: Url.Content("~/Clientes/DescargaExcel/") %>',
                                            data: { idCliente: idCliente },
                                            cache: false,
                                            type: "GET",
                                            success: function (data) {
                                                // data is your result from controller
                                            },
                                            error: function (err) {
                                                console.log(err);
                                            }
                                        });
                                    });
                                });
                            </script>--%>
                        </div>
                            <div class=" text-center">
                                <div class="row">
                                    <div class="col">
                                        <button class="btn btn-primary" id="btnGuardar" type="submit" style="background-color: #55a247; border-color: #55a247;">Descargar </button>

                                    </div>
                                </div>
                            </div> 
                            <br />
                        </div>
                    </div>
                    </div>    
                </div> 
            </div> 
        </section>
            </form>
    </main>
</asp:Content>