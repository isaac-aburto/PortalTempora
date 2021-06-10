﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/DisenoBootstrap3.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>


<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">


    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.24/css/dataTables.bootstrap.min.css">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
    <script src="js/jquery.min.js" type="text/javascript"></script>
<script src="js/jquery.dataTables.min.js" type="text/javascript"></script>
    <style>
        h5 {
            font-family: "Open Sans", sans-serif !important;
        }
        .card {
        border-radius: 0.6rem;
        border-color: #00000033;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <main id="main" style="margin-top: -1pc;">

    <!-- ======= About Section ======= -->
    <section id="about" class="about" style="    margin-top: 5pc;">
        <div class="card border-secondary <%--border-0--%> shadow rounded-lg mt-5" style="margin-top: -55px; background-color: #e3e3e3;">
      <div class="container" data-aos="fade-up">
        <div class="row">
            <div class="card-body" style="margin-top: -5pc;"> 
            <br />
                <div class="row">
                  <div class="col-6 col-md-3"> 
                    <div class="card border-left-primary shadow h-100 py-2">
                    <div class="card-body">
                        <div class="row no-gutters align-items-center">
                            <div class="col mr-2">
                                <div class="text-xs font-weight-bold  text-uppercase mb-1" style="color: #8e8e8e">
                                    Solicitudes
                                </div>
                                <div class="text-xs font-weight-bold  text-uppercase mb-1" style="color: #8e8e8e">
                                     Totales
                                </div>
                                <div class="h5 mb-0 font-weight-bold text-gray-800">
                                    <h5 style="color: #C6D41D"; >18</h5>
                                </div>
                            </div>
                         </div>
                       </div>
                   </div>
                  </div>
                  <div class="col-6 col-md-3">
                      <div class="card border-left-warning shadow h-100 py-2">
                    <div class="card-body">
                        <div class="row no-gutters align-items-center">
                            <div class="col mr-2">
                                <div class="text-xs font-weight-bold text-uppercase mb-1" style="color: #8e8e8e">Estado </div>
                                <div class="text-xs font-weight-bold text-uppercase mb-1" style="color: #8e8e8e"> Abierto</div>
                                <div class="h5 mb-0 font-weight-bold text-gray-800">
                                    <h5 style="color: #C6D41D">15</h5>
                                </div>
                            </div>
                         </div>
                       </div>
                   </div>
                </div>
                    <div class="col-6 col-md-3">
                        <div class="card border-left-primary shadow h-100 py-2">
                        <div class="card-body">
                            <div class="row no-gutters align-items-center">
                                <div class="col mr-2">
                                    <div class="text-xs font-weight-bold text-uppercase mb-1" style="color: #8e8e8e">Estado </div>
                                    <div class="text-xs font-weight-bold text-uppercase mb-1" style="color: #8e8e8e">En proceso</div>
                                    <div class="h5 mb-0 font-weight-bold text-gray-800">
                                        <h5 style="color: #C6D41D">0</h5>
                                    </div>
                                </div>
                             </div>
                           </div>
                       </div>
                    </div>
                    <div class="col-6 col-md-3">
                        <div class="card border-left-warning shadow h-100 py-2">
                        <div class="card-body">
                            <div class="row no-gutters align-items-center">
                                <div class="col mr-2">
                                    <div class="text-xs font-weight-bold  text-uppercase mb-1" style="color: #8e8e8e">Estado </div>
                                    <div class="text-xs font-weight-bold  text-uppercase mb-1" style="color: #8e8e8e"> En Espera</div>
                                    <div class="h5 mb-0 font-weight-bold text-gray-800">
                                        <h5 style="color: #C6D41D">0</h5>
                                    
                                    </div>
                                </div>
                             </div>
                           </div>
                       </div>
                    </div>
                </div>
                <br />
        <%-- Fiktros --%>
        
        <div class="card border-left-warning shadow ">
            <div class="card-body">
                <div class="panel panel-primary">
                    <div class="panel-heading"><%--Filtros Ticket--%></div>
                        <div class="panel-body">
                            <div class="row justify-content-md-center">
                                <fieldset class="form-group col-md-2">
                                    <label for="txtSolicitud">N° de Solicitud</label>
                                    <input type="text" class="form-control" id="txtSolicitud" name="txtSolicitud" />
                                </fieldset>                         
                                <fieldset class="form-group col-md-3">
                                    <label for="txtFechaDesde">Creación Desde</label>
                                    <input type="date" class="form-control" id="txtFechaDesde" name="txtFechaDesde" />
                                </fieldset>
                                <fieldset class="form-group col-md-3">
                                    <label for="txtFechaHasta">Creación Hasta</label>
                                    <input type="date" class="form-control" id="txtFechaHasta" name="txtFechaHasta" />
                                </fieldset>
                                <fieldset class="form-group col-md-2">
                                    <label for="txtEstado">Estado</label>
                                    <select name="txtEstado" id="txtEstado" class="form-control">
                                         <%=  ViewData["opcionesEstados"] %>
                                    </select>
                                </fieldset>
                                <fieldset class="form-group col-md-2">
                                    <label for="txtTecnica">Completada</label>
                                    <select name="txtTecnica" id="txtTecnica" class="form-control">
                                        <option  value='0'>Todos</option>
                                         <option  value='1'>Completa</option>
                                        <option  value='2'>Incompleta</option>
                                    </select>
                                </fieldset>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
                <br />
            <div class="card border-left-warning shadow ">
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-bordered table-hover" id="tablasolicitudes">
                            <thead>
                                <tr>
                                    <th class="col-xs-2">N° Solicitud</th>
                                    <th class="col-xs-1">Cliente</th>
                                    <th class="col-xs-1">Rut</th>
                                    <th class="col-xs-1">Fecha Solicitud</th>
                                    <th class="col-xs-2">Estado</th>
                                    <th class="col-xs-1">Técnica</th>
                                    <th class="col-xs-1">Completada</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%= ViewData["valoresSolicitudes"] %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <script>
                $(document).ready(function () {
                    // Datatable y propiedades
                    var table = $('#tablasolicitudes').DataTable({
                        "sDom": '<"top">rt<"bottom"ip><"clear">',
                        "order": [ [0, "desc"] ],
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

                    $('#txtRut, #txtFechaDesde, #txtFechaHasta,  #txtEstado, #txtTecnica').change(function () {
                        table.draw();
                    });

                    // Filtros
                    $.fn.dataTable.ext.search.push(
                    function (settings, data, dataIndex) {
                            // Id de la Solicitud
                            var IdSolicitud = data[0];
                            var IsIdSolicitud = !$("#txtSolicitud").val() ||
                                IdSolicitud.includes($("#txtSolicitud").val()) == true;

                            //Rut
                            //var Rut = data[2];
                            //var IsRut = !$("#txtRut").val() ||
                            //    Rut.includes($("#txtRut").val()) == true;

                            var min = moment($('#txtFechaDesde').val(), "YYYY-MM-DD");
                            var max = moment($('#txtFechaHasta').val(), "YYYY-MM-DD");
                            var fecha = moment(data[3], "DD/MM/YYYY");
                            var estaEnRangoFechas = ((isNaN(min) && isNaN(max)) || // Si no hay campos
                                (min.isSameOrBefore(fecha) && isNaN(max)) || // Solo si hay desde
                                (isNaN(min) && fecha.isSameOrBefore(max)) || // Solo si hay hasta
                                (min.isSameOrBefore(fecha) && fecha.isSameOrBefore(max))); // Si hay ambos campos


                            //Estado
                            var EstadoTabla = data[4];
                            var EstadoActual = $("#txtEstado").children(":selected").text();
                            var EstadoSeleccionada = EstadoActual == "-- Selecciona opción --" || EstadoActual == EstadoTabla;

                            //Técnica
                            var TecnicoTabla = data[6];
                            var TecnicoActual = $("#txtTecnica").children(":selected").text();
                            var TecnicoSeleccionada = TecnicoActual == "-- Selecciona opción --" || TecnicoActual == TecnicoTabla;
                            var TecnicoSeleccionadaTdos = TecnicoActual == "Todos" || TecnicoActual == TecnicoTabla;
                            if (TecnicoSeleccionadaTdos) {
                                if (TecnicoSeleccionadaTdos && IsIdSolicitud && EstadoSeleccionada && estaEnRangoFechas) {
                                    return true;
                                }
                            } else {
                                if (TecnicoSeleccionadaTdos) {
                                    if (TecnicoSeleccionada && IsIdSolicitud && EstadoSeleccionada && estaEnRangoFechas) {
                                        return true;
                                    }    
                                }
                                   
                            }
                            return false;
                    });
                        //table.draw();
                });
            </script>
            </div>
        </div>
    </div> 

        </div>
        </section>
        </main>
</asp:Content>