﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/DisenoBootstrap3.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>


<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">

    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.24/css/dataTables.bootstrap.min.css">
      <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.24/js/dataTables.bootstrap.min.js"></script>
    <script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.11.1/jquery.validate.min.js"></script>
    
    
    
    <%-- Scripts de Gestion --%>
    <%-- AJAX de Descripción y estado --%>
    <script>
        $(document).ready(function () {
            var idEstado = $("#txtEstado").val();
            $.ajax({
                url: '<%: Url.Content("~/Solicitudes/ConsultarDescripcion/") %>',
                        data: { idEstado: idEstado },
                        cache: false,
                        type: "GET",
                        success: function (data) {
                            // data is your result from controller
                            var res = data.split(";");
                            var fkCategoria = res[1];
                            console.log("Res split: " + res)
                            console.log("Descripcion: " + res[0])
                            console.log("FK fkCategoria: " + fkCategoria)
                            console.log("Data completa: " + data);
                            $("#txtDescripcion").val(data);

                            // Manejo para acceder a estados.                  
                            $.ajax({
                                url: '<%: Url.Content("~/Solicitudes/ConsultarEstado/") %>',
                            data: { fkCategoria: fkCategoria, idEstado: idEstado },
                            cache: false,
                            type: "GET",
                            success: function (data) {
                                if (data != "") {
                                    var estados = JSON.parse(data);
                                    console.log("estados")
                                    console.log(estados);

                                    //borro la lista anterior
                                    $('#txtEstado').find('option').remove();
                                    $.each(estados, function (i, item) {
                                        if (estados[i].idEstado.toString() == idEstado.toString()) {
                                            $("#txtEstado").append("<option selected value='" + estados[i].idEstado + "'>" + estados[i].nombreEstado + "</option>");
                                            console.log("hola")
                                        }
                                        else {
                                            $("#txtEstado").append("<option value='" + estados[i].idEstado + "'>" + estados[i].nombreEstado + "</option>");
                                            console.log("hbai")
                                        }

                                    });

                                }

                            }
                        });
                        },
                        error: function (err) {
                            console.log(err);
                        }
                    });
                $("#txtEstado").change(function () {
                    var idEstado = $("#txtEstado").val();
                    $.ajax({
                        url: '<%: Url.Content("~/Solicitudes/ConsultarDescripcion/") %>',
                        data: { idEstado: idEstado },
                    cache: false,
                    type: "GET",
                    success: function (data) {
                        // data is your result from controller
                        var res = data.split(";");
                        var fkCategoria = res[1];
                        console.log("Res split: " + res)
                        console.log("Descripcion: " + res[0])
                        console.log("FK fkCategoria: " + fkCategoria)
                        console.log("Data completa: " + data);
                        $("#txtDescripcion").val(data);

                        // Manejo para acceder a estados.                  
                        $.ajax({
                            url: '<%: Url.Content("~/Solicitudes/ConsultarEstado/") %>',
                            data: { fkCategoria: fkCategoria, idEstado: idEstado },
                            cache: false,
                            type: "GET",
                            success: function (data) {
                                if (data != "") {
                                    var estados = JSON.parse(data);
                                    console.log("estados")
                                    console.log(estados);

                                    //borro la lista anterior
                                    $('#txtEstado').find('option').remove();
                                    $.each(estados, function (i, item) {
                                        if (estados[i].idEstado.toString() == idEstado.toString()) {
                                            $("#txtEstado").append("<option selected value='" + estados[i].idEstado + "'>" + estados[i].nombreEstado + "</option>");
                                            console.log("hola")
                                        }
                                        else {
                                            $("#txtEstado").append("<option value='" + estados[i].idEstado + "'>" + estados[i].nombreEstado + "</option>");
                                            console.log("hbai")
                                        }
                                        
                                    });

                                }

                            }
                        });
                    },
                    error: function (err) {
                        console.log(err);
                    }
                });
            });
        });
    </script>
    



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

    <%-- Script de Estados para el Div --%>
    <script>
        $(document).ready(function () {
            console.log("Estado Seleccionado: " + $("#txtEstado").val())
            var Estado = $("#txtEstado").val();
            if (Estado == 1) {
                $("#divEstados").hide();
            }
            $("#txtEstado").change(function () {
                console.log("Estado Seleccionado: " + $("#txtEstado").val())
                var Estado = $("#txtEstado").val();
                if (Estado == 6) {
                    console.log("Estado 5")
                    $("#divEstados").hide();
                }
                if (Estado == 2) {
                    console.log("Estado 2")
                    $("#divEstados").show();
                }
                else {
                    console.log("Otro estado")
                    $("#divEstados").hide();
                }
            });
            //divEstados
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


        <form style="background: #F7F7F7;"  method="post" action="<%: Url.Content("~/Solicitudes/GestionSolicitudes") %>">
        <section id="about" class="about" style="    margin-top: 8pc;">
            <div class="card border-secondary <%--border-0--%> shadow rounded-lg mt-5" style="margin-top: -55px; background-color: #e3e3e3;">
                <div class="container" data-aos="fade-up">
                    <input hidden name="idSolicitud" value="<%= ViewData["idSolicitud"]%>"/>
                    <div class="row">
                        <div class="card-body" style="    margin-top: -5pc;">
                        <div class="card border-left-warning shadow ">
                        <div class="card-body">
                            <div style="text-align: center;">
                                <h1 style="color: #858585; font-family: 'Open Sans', sans-serif; font-style: inherit;">Solicitud N°<%= ViewData["idSolicitud"]%> </h1>
                                <h1 style="color: #b8c517; font-style: inherit;"><%= ViewData["NombreCompleto"]  %></h1>
                                <h6 style="color: #858585; font-family: 'Open Sans', sans-serif; font-style: inherit;">Fecha Solicitud: <%= ViewData["FechaSolicitud"] %></h6>
                                <h6 style="color: #858585; font-family: 'Open Sans', sans-serif; font-style: inherit;">Estado: <%= ViewData["EstadoSolicitud"] %></h6>
                            </div>
                            <div class="row">
                                    <div class="col">
                                        <h4 style="color: #858585; font-family: 'Open Sans', sans-serif; font-style: initial !important">Información</h4>
                                    </div>
                                    <div class="col" style="    text-align: end;">
                                        <a id="btnInformacion" style="color: #858585; font-family: 'Open Sans', sans-serif; font-style: initial !important" data-toggle="collapse" data-target="#collapseExample3" role="button"  aria-controls="collapseExample3"><i style="color: #C6D41D;     font-size: 31px;" id="icon3" class="fa fa-angle-up"></i></a>
                                    </div>
                                </div>
                            <hr />
                            <div class="collapse" id="collapseExample3">
                            <div class="row">
                                <div class="col">
                                    <label for="txtNombre"></label>
                                    <label style="color: /*#C6D41D*/ black">Nombre </label>
                                    <div id="selDiv">
                                        <input disabled id="txtNombre" name="txtNombre" type='text' class='form-control' value='<%= ViewData["NombreCompleto"]  %>'>
                                    </div>
                                    <div class="invalid-feedback">Seleccione una opción</div>
                                    <br />
                                </div>
                                <div class="col">
                                    <label for="txtRut"></label>
                                        
                                    <label style="color: black">Rut </label>
                                    <div id="selDiv">
                                        <input disabled id="txtRut" name="txtRut" type='text' class='form-control' value='<%= ViewData["Rut"] %>'>
                                    </div>
                                    <div class="invalid-feedback">Seleccione una opción</div>
                                    <br />
                                </div>
                                <div class="col">
                                    <label for="txtFechaNacimiento"></label>
                                        
                                    <label style="color: black">Fecha de Nacimiento </label>
                                    <div id="selDiv">
                                        <input disabled id="txtFechaNacimiento" name="txtFechaNacimiento" type='text' class='form-control' value='<%= ViewData["FechaNacimiento"] %>'>
                                        <input hidden name="Nacimiento" value="<%= ViewData["FechaNacimiento"] %>"/>
                                    </div>
                                    <div class="invalid-feedback">Seleccione una opción</div>
                                    <br />
                                </div>

                            </div>
                            <div class="row">
                                <div class="col-4">
                                    <label for="txtTelefono"></label>
                                    <label style="color: black">Teléfono </label>
                                    <div id="selDiv">
                                        <input disabled id="txtTelefono" name="txtTelefono" type='text' class='form-control' value='<%= ViewData["Telefono"] %>'>
                                    </div>
                                    <div class="invalid-feedback">Seleccione una opción</div>
                                    <br />
                                </div>
                                <div class="col-4">
                                    <label for="txtCelular"></label>        
                                    <label style="color: black">Celular </label>
                                    <div id="selDiv">
                                        <input disabled  name="txtCelular" type='text' class='form-control' value='<%= ViewData["Celular"] %>'>
                                    </div>
                                    <div class="invalid-feedback">Seleccione una opción</div>
                                    <br />
                                </div>
                                    <div class="col-4">
                                    <label for="txtCorreo"></label>
                                    <label style="color: black">Correo </label>
                                    <div id="selDiv">
                                        <input disabled id="txtCorreo" name="txtCorreo" type='text' class='form-control' value='<%= ViewData["Correo"] %>'>
                                    </div>
                                    <div class="invalid-feedback">Seleccione una opción</div>
                                    <br />
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12">
                                    <label for="txtZona"></label>
                                    <label style="color:black">Respuesta ¿Qué zonas desea reparar? </label>
                                    <div id="selDiv">
                                        <textarea  disabled  name="txtZona"  class='form-control' style="overflow: hidden"><%= ViewData["RespuestaZona"] %></textarea>
                                    </div>
                                    <div class="invalid-feedback">Seleccione una opción</div>
                                    <br />
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12">
                                    <label for="txtDerma"></label>
                                    <label style="color: black">Respuesta ¿Se ha estado tratando con algún dermatologo por alguna enfermedad capilar? ¿Cuál? </label>
                                    <div id="selDiv">
                                        <textarea  disabled  name="txtDerma"  class='form-control' style="overflow: hidden "><%= ViewData["RespuestaDerma"] %></textarea>
                                    </div>
                                    <div class="invalid-feedback">Seleccione una opción</div>
                                    <br />
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12">
                                    <label for="txtPelo"></label>
                                    <label style="color: black">Respuesta ¿Ha tenido pelones en la cabeza o barba? </label>
                                    <div id="selDiv">
                                        <textarea  disabled name="txtPelo"  class='form-control' style="overflow: hidden"><%= ViewData["RespuestaPelo"] %></textarea>
                                    </div>
                                    <div class="invalid-feedback">Seleccione una opción</div>
                                    <br />
                                </div>
                            </div>      
                                </div>  
                            <%-- Fotografías --%>
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
                                        <div class="carousel-inner" style="border-radius: 7px;border-color: #ededed;border-style: solid;">
                                        <div class="carousel-item active">
                                            <img class="d-block w-100 imgen-carrusel" src="<%= ViewData["Foto1"]%>" alt="First slide">
                                          <div class="carousel-caption d-none d-md-block">
                                            <h5>Desde arriba</h5>
                                            <p>imagen1.jpg</p>
                                          </div>
                                        </div>
                                        <div class="carousel-item">
                                            <img class="d-block w-100 imgen-carrusel" src="<%= ViewData["Foto2"]%>" alt="Second slide">
                                             <div class="carousel-caption d-none d-md-block">
                                                <h5>Perfil izquierdo</h5>
                                                <p>imagen2.jpg</p>
                                            </div>
                                        </div>
                                        <div class="carousel-item">
                                            <img class="d-block w-100 imgen-carrusel" src="<%= ViewData["Foto3"]%>" alt="Third slide">
                                            <div class="carousel-caption d-none d-md-block">
                                                <h5>Perfil Derecho</h5>
                                                <p>imagen3.jpg</p>
                                            </div>
                                        </div>
                                        <div class="carousel-item">
                                            <img class="d-block w-100 imgen-carrusel" src="<%= ViewData["Foto4"]%>" alt="Third slide">
                                             <div class="carousel-caption d-none d-md-block">
                                                <h5>De atrás</h5>
                                                <p>imagen4.jpg</p>
                                            </div>
                                        </div>
                                        <div class="carousel-item">
                                            <img class="d-block w-100 imgen-carrusel" src="<%= ViewData["Foto5"]%>" alt="Third slide">
                                            <div class="carousel-caption d-none d-md-block">
                                                <h5>De frente</h5>
                                                <p>imagen5.jpg</p>
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
                                    <br />
                                </div>
                            </div>
                            
                            
                            <%-- Gestion --%>
                            <div class="row">
                                <div class="col">
                                    <h4 style="color: #858585; font-family: 'Open Sans', sans-serif; font-style: initial !important">Gestión</h4>
                                </div>
                                <div class="col" style="    text-align: end;">
                                    <a id="btnGestionar"  data-toggle="collapse" data-target="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample"><i style="color: #C6D41D;     font-size: 31px;" id="icon" class="fa fa-angle-down"></i></a>
                                </div>
                            </div>
                            <hr />
<%--                            <h6 class="collapse" id="collapseExample">
                                Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident.
                            </h6>
                            <div class=" text-center">
                                <a id="btnGestionar" class="btn btn-primary" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample" style="background-color: #C6D41D; border-color: #C6D41D;">Gestionar</a>
                            </div>--%>
                            <div class="collapse" id="collapseExample">
                                <div class="row">
                                    <div class="col">
                                        <label for="txtEstado"></label>
                                        <label style="color: /*#C6D41D*/ black">Estado </label>
                                        <div id="selDiv">
                                            <select name="txtEstado" id="txtEstado" class="form-control" >
                                                <%= ViewData["opcionesEstados"] %>
                                            </select>
                                        </div>
                                        <div class="invalid-feedback">Seleccione una opción</div>
                                        <br />
                                    </div>
                                    <div class="col">
                                        <label for="txtDescripcion"></label>
                                        <label style="color:black"> Descripción Estado</label>
                                        <div id="selDiv">
                                            <textarea  disabled id="txtDescripcion" name="txtDescripcion" class='form-control'><%= ViewData["Observacion"] %></textarea>
                                        </div>
                                        <div class="invalid-feedback">Seleccione una opción</div>
                                        <br />
                                    </div>
                                </div>
                                <div id="divEstados">
                                    <div class="row">

                                    <div class="col">
                                        <label for="txtTecnica"></label>
                                        <label style="color: black">Técnica </label>
                                        <div id="selDiv">
                                            <select name="txtTecnica" id="txtTecnica" class="form-control" >
                                                <%= ViewData["opcionesTecnicas"] %>
                                            </select>                                    </div>
                                        <div class="invalid-feedback">Seleccione una opción</div>
                                        <br />
                                    </div>
                                    <div class="col">
                                        <label for="txtZona"></label>
                                        <label style="color: black">Zona </label>
                                        <div id="selDiv">
                                            <select name="txtZona" id="txtZona" class="form-control" >
                                                <%= ViewData["opcionesZonas"] %>
                                            </select>                                      </div>
                                        <div class="invalid-feedback">Seleccione una opción</div>
                                        <br />
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-6">
                                        <label for="txtFoliculo1"></label>
                                        <label style="color:black"> Rango Folículos </label>
                                            <select name="txtFoliculo1" id="txtFoliculo1" class="form-control" >
                                                <%= ViewData["opcionesRangos1"] %>
                                            </select>  
                                        <div class="invalid-feedback">Seleccione una opción</div>
                                        <br />
                                    </div>
                                    <div class="col-6">
                                        <label for="txtFoliculo2"></label>
                                        <label style="color:white"> a </label>
                                            <select name="txtFoliculo2" id="txtFoliculo2" class="form-control" >
                                                <%= ViewData["opcionesRangos2"] %>
                                            </select>  
                                        <div class="invalid-feedback">Seleccione una opción</div>
                                        <br />
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-12">
                                        <label for="txtObservacion"></label>
                                        <label style="color:black"> Observación </label>
                                        <div id="selDiv">
                                            <textarea  id="txtObservacion" name="txtObservacion" class='form-control'><%= ViewData["Observacion"] %></textarea>
                                        </div>
                                        <div class="invalid-feedback">Seleccione una opción</div>
                                        <br />
                                    </div>
                                </div>
                                    </div>
                                    <div class=" text-center">
                                        <div class="row">
                                            <div class="col">
                                                <button class="btn btn-primary" id="btnGuardar" type="submit" style="background-color: #55a247; border-color: #55a247;">Guardar</button>

                                            </div>
                                            <div class="col">
                                                <button class="btn btn-primary" id="btnEnviar" type="submit" style="background-color: #C6D41D; border-color: #C6D41D;">Enviar</button>
                                                <input id="enviar" name="enviar" hidden value="0"/>
                                                <script>
                                                    $(document).ready(function () {
                                                        $("#btnEnviar").click(function () {
                                                            $("#enviar").val(1);
                                                        });
                                                    });
                                                </script>
                                            </div>
                                        </div>
                                    </div>
                            
                            </div>
                        </div>
                        </div>
                    </div>
                    </div>    
                </div> 
            </div> 
        </section>
    </form>
</main>
</asp:Content>