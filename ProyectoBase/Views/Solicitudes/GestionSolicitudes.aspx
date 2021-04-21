﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/DisenoBootstrap3.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>


<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">

    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.24/css/dataTables.bootstrap.min.css">
      <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.24/js/dataTables.bootstrap.min.js"></script>

    <%-- Scripts de Gestion --%>
    <script>

        $(document).ready(function () {
            
            $("#btnGestionar").click(function () {
                var div = document.getElementById('container');
                var icon = document.getElementById('icon');
                var open = false;
                if (open) {
                    icon.className = 'fa fa-arrow-down';
                } else {
                    icon.className = 'fa fa-arrow-down open';
                }
                open = !open;

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

    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <main id="main">

    <!-- ======= About Section ======= -->


        <form style="background: #F7F7F7;"  method="post" action="<%: Url.Content("~/Solicitudes/GestionSolicitudes") %>">
        <section id="about" class="about">
            <div class="card border-secondary <%--border-0--%> shadow rounded-lg mt-5" style="margin-top: -55px">
                <div class="container" data-aos="fade-up">
                    <input hidden name="idSolicitud" value="<%= ViewData["idSolicitud"]%>"/>
                    <div class="row">
                        <div class="card-body">
                        <div class="card border-left-warning shadow ">
                        <div class="card-body">
                            <div>

                                <script>
                                    (function (document) {

                                    })(document);
                                </script>
                                <h1 style="color: #C6D41D; font-family: 'Open Sans', sans-serif;">Solicitud N°<%= ViewData["idSolicitud"]%> </h1>
                                <h1 style="color: #C6D41D; font-family: 'Open Sans', sans-serif;"><%= ViewData["NombreCompleto"]  %></h1>
                            </div>
                            <hr />
                            <br />
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

                            <%-- Gestion --%>

                            <h1><a id="btnGestionar" style="color:#C6D41D; font-family: 'Open Sans', sans-serif !important" data-toggle="collapse" data-target="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
                                Gestionar<i style="color: #C6D41D;" id="icon" class="fa fa-arrow-down"></i>
                            </a></h1>
<%--                            <h6 class="collapse" id="collapseExample">
                                Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident.
                            </h6>
                            <div class=" text-center">
                                <a id="btnGestionar" class="btn btn-primary" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample" style="background-color: #C6D41D; border-color: #C6D41D;">Gestionar</a>
                            </div>--%>
                            <div class="collapse" id="collapseExample">
                                <hr />

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
                                <div class=" text-center">
                                    <button class="btn btn-primary" id="btnEnviar" type="submit" style="background-color: #C6D41D; border-color: #C6D41D;">Enviar</button>
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