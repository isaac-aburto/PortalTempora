<%@ Page Title="" Language="C#" MasterPageFile="~/Views/DisenoBootstrap3.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>


<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">

<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/pdfmake.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/vfs_fonts.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/v/bs4/jszip-2.5.0/dt-1.10.24/af-2.3.5/b-1.7.0/b-colvis-1.7.0/b-html5-1.7.0/b-print-1.7.0/cr-1.5.3/date-1.0.3/fc-3.3.2/fh-3.1.8/kt-2.6.1/r-2.2.7/rg-1.1.2/rr-1.2.7/sc-2.0.3/sb-1.0.1/sp-1.2.2/sl-1.3.3/datatables.min.js"></script>
    
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.24/css/dataTables.bootstrap.min.css">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
    <%--    <script src="js/jquery.min.js" type="text/javascript"></script>--%>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/bs4/jszip-2.5.0/dt-1.10.24/af-2.3.5/b-1.7.0/b-colvis-1.7.0/b-html5-1.7.0/b-print-1.7.0/cr-1.5.3/date-1.0.3/fc-3.3.2/fh-3.1.8/kt-2.6.1/r-2.2.7/rg-1.1.2/rr-1.2.7/sc-2.0.3/sb-1.0.1/sp-1.2.2/sl-1.3.3/datatables.min.css"/>
 <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
    <%-- Moment --%>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
<%--<script src="js/jquery.dataTables.min.js" type="text/javascript"></script>--%>
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


        <form style="background: #F7F7F7;"  method="post" action="<%: Url.Content("~/Solicitudes/GestionSolicitudes") %>">

        <section id="about" class="about" style="    margin-top: 8pc;">
            
            <div class="card border-secondary <%--border-0--%> shadow rounded-lg mt-5" style="margin-top: -55px; background-color: #e3e3e3;">
                <div class="container" data-aos="fade-up">
                    <input hidden name="idUsuario" value="<%= ViewData["id"]%>"/>
                    <div class="row">
                        <div class="card-body" style="    margin-top: -5pc;">
                            <div class="card border-left-warning shadow ">
                                <div class="card-body">
                                    <div class="panel panel-primary">
                                        <div class="panel-heading"><%--Filtros Ticket--%></div>
                                            <div class="panel-body">
                                                <div class="row justify-content-md-center">
                                                    <fieldset class="form-group col-md-3">
                                                        <label for="txtSolicitud">N° de Paciente</label>
                                                        <input type="text" class="form-control" id="txtSolicitud" name="txtSolicitud" />
                                                    </fieldset>   
                                                    <fieldset class="form-group col-md-3">
                                                        <label for="txtNombre">Nombre</label>
                                                        <input type="text" class="form-control" id="txtNombre" name="txtNombre" />
                                                    </fieldset>
                                                    <fieldset class="form-group col-md-3">
                                                        <label for="txtCorreo">Correo</label>
                                                        <input type="text" class="form-control" id="txtCorreo" name="txtCorreo" />
                                                    </fieldset>
                                                    <fieldset class="form-group col-md-3">
                                                        <label for="txtSolicitud2">N° de Solicitud</label>
                                                        <input type="text" class="form-control" id="txtSolicitud2" name="txtSolicitud2" />
                                                    </fieldset>
<%--                                                    <fieldset class="form-group col-md-3">
                                                        <label for="txtFechaDesde">Creación Desde</label>
                                                        <input type="date" class="form-control" id="txtFechaDesde" name="txtFechaDesde" />
                                                    </fieldset>
                                                    <fieldset class="form-group col-md-3">
                                                        <label for="txtFechaHasta">Creación Hasta</label>
                                                        <input type="date" class="form-control" id="txtFechaHasta" name="txtFechaHasta" />
                                                    </fieldset>--%>
<%--                                                    <fieldset class="form-group col-md-3">
                                                        <label for="txtEstado">Estado</label>
                                                        <select name="txtEstado" id="txtEstado" class="form-control">
                                                             <%=  ViewData["opcionesEstados"] %>
                                                        </select>
                                                    </fieldset>--%>
<%--                                                    <fieldset class="form-group col-md-2">
                                                        <label for="txtTecnica">Técnica</label>
                                                        <select name="txtTecnica" id="txtTecnica" class="form-control">
                                                            <option  value='0'>Todos</option>
                                                             <option  value='1'>FUE</option>
                                                            <option  value='2'>FUSS</option>
                                                        </select>
                                                    </fieldset>--%>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            <br />
                        <div class="card border-left-warning shadow ">
                        <div class="card-body">
                            <h1 style="color: #858585; font-family: 'Open Sans', sans-serif; font-style: inherit;">Pacientes Tempora</h1>
                            <br />
                            <div style="text-align: center;">
                            </div>                   
                             <div class="card border-left-warning  ">
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered table-hover" id="tablasolicitudes">
                                        <thead>
                                            <tr>
                                                <th class="col-xs-2">ID</th>
                                                <th class="col-xs-1">Nombre</th>
                                                <th class="col-xs-1">Rut</th>
                                                <th class="col-xs-1">Correo</th>
                                                <th class="col-xs-1">ID Solicitud</th>
                                                <th class="col-xs-1">Evaluación</th>
                                                <th class="col-xs-1">Fecha Solicitud</th>
                                                <th class="col-xs-2">Mantenedor</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%= ViewData["valoresclientes"] %>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    <script type="text/javascript" src="https://cdn.datatables.net/plug-ins/1.10.24/sorting/date-uk.js"></script>
                    <script>
                        // Datatable y propiedades

                        // Datatable y propiedades  

                        var table = $('#tablasolicitudes').DataTable({

                            "sDom": '<"top">rt<"bottom"ip><"clear">',
                            "order": [[0, "dec"]],
                            "language": {
                                "sProcessing": "Procesando...",
                                "sLengthMenu": "Mostrar _MENU_ registros",
                                "sZeroRecords": "No se encontraron resultados",
                                "sEmptyTable": "Ningún dato disponible en esta tabla",
                                "sInfo": "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
                                "sInfoEmpty": "Mostrando registros del 0 al 0 de un total de 0 registros",
                                "sInfoFiltered": "(filtrado de un total de _MAX_ registros)",
                                "sInfoPostFix": "",
                                "sSearch": "Buscar:",
                                "sUrl": "",
                                "sInfoThousands": ",",
                                "sLoadingRecords": "Cargando...",
                                "oPaginate": {
                                    "sFirst": "Primero",
                                    "sLast": "Último",
                                    "sNext": "Siguiente",
                                    "sPrevious": "Anterior"
                                },
                                "oAria": {
                                    "sSortAscending": ": Activar para ordenar la columna de manera ascendente",
                                    "sSortDescending": ": Activar para ordenar la columna de manera descendente"
                                }
                            }
                        }); 

                        $("#txtSolicitud").on("input", function () {
                            table.draw();
                        });
                        $("#txtNombre").on("input", function () {
                            table.draw();
                        });
                        $("#txtCorreo").on("input", function () {
                            table.draw();
                        });

                        $("#txtSolicitud2").on("input", function () {
                            table.draw();
                        });

                        //$('#txtRut, #txtFechaDesde, #txtFechaHasta,  #txtEstado, #txtTecnica').change(function () {
                        //    table.draw();
                        //});

                        // Filtros
                        $.fn.dataTable.ext.search.push(
                            function (settings, data, dataIndex) {
                                // Id de la Solicitud
                                var IdSolicitud = data[0];
                                var IsIdSolicitud = !$("#txtSolicitud").val() ||
                                    IdSolicitud.includes($("#txtSolicitud").val()) == true;

                                var IdNombre = data[1];
                                var IsIdNombre = !$("#txtNombre").val() ||
                                    IdNombre.includes($("#txtNombre").val()) == true;

                                var IdCorreo = data[2];
                                var IsIdCorreo = !$("#txtCorreo").val() ||
                                    IdCorreo.includes($("#txtCorreo").val()) == true;

                                var IdSolicitud2 = data[3];
                                var IsIdSolicitud2 = !$("#txtSolicitud2").val() ||
                                    IdSolicitud2.includes($("#txtSolicitud2").val()) == true;
                                //Rut
                                //var Rut = data[2];
                                //var IsRut = !$("#txtRut").val() ||
                                //    Rut.includes($("#txtRut").val()) == true;

                                //var min = moment($('#txtFechaDesde').val(), "YYYY-MM-DD");
                                //var max = moment($('#txtFechaHasta').val(), "YYYY-MM-DD");
                                //var fecha = moment(data[3], "DD/MM/YYYY");
                                //var estaEnRangoFechas = ((isNaN(min) && isNaN(max)) || // Si no hay campos
                                //    (min.isSameOrBefore(fecha) && isNaN(max)) || // Solo si hay desde
                                //    (isNaN(min) && fecha.isSameOrBefore(max)) || // Solo si hay hasta
                                //    (min.isSameOrBefore(fecha) && fecha.isSameOrBefore(max))); // Si hay ambos campos


                                //Estado
                                //var EstadoTabla = data[4];
                                //var EstadoActual = $("#txtEstado").children(":selected").text();
                                //var EstadoSeleccionada = EstadoActual == "-- Selecciona opción --" || EstadoActual == EstadoTabla;

                                ////Técnica
                                //var TecnicoTabla = data[6];
                                //var TecnicoActual = $("#txtTecnica").children(":selected").text();
                                //var TecnicoSeleccionada = TecnicoActual == "-- Selecciona opción --" || TecnicoActual == TecnicoTabla;
                                //var TecnicoSeleccionadaTdos = TecnicoActual == "Todos" || TecnicoActual == TecnicoTabla;
                                //if (TecnicoSeleccionadaTdos) {
                                if (IsIdSolicitud /*EstadoSeleccionada*/ && IsIdNombre && IsIdCorreo && IsIdSolicitud2) {
                                       return true;
                               }
                                //} else {
                                //    if (TecnicoSeleccionadaTdos) {
                                //        if (TecnicoSeleccionada && IsIdSolicitud && EstadoSeleccionada && estaEnRangoFechas) {
                                //            return true;
                                //        }
                                //    }

                                //}
                                return false;
                            });
                    </script>
         
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