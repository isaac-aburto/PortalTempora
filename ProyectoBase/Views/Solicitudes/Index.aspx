﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/DisenoBootstrap3.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>


<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">


    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.24/css/dataTables.bootstrap.min.css">
  
    <script src="js/jquery.min.js" type="text/javascript"></script>
<script src="js/jquery.dataTables.min.js" type="text/javascript"></script>
    <style>
        h5 {
            font-family: "Open Sans", sans-serif !important;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <main id="main">

    <!-- ======= About Section ======= -->
    <section id="about" class="about">
        <div class="card border-secondary <%--border-0--%> shadow rounded-lg mt-5" style="margin-top: -55px">
      <div class="container" data-aos="fade-up">
        <div class="row">
            <div class="card-body"> 
            <br />
                <div class="row">
                  <div class="col-6 col-md-3"> 
                    <div class="card border-left-primary shadow h-100 py-2">
                    <div class="card-body">
                        <div class="row no-gutters align-items-center">
                            <div class="col mr-2">
                                <div class="text-xs font-weight-bold  text-uppercase mb-1" style="color: #C6D41D">
                                    Solicitudes
                                </div>
                                <div class="text-xs font-weight-bold  text-uppercase mb-1" style="color: #C6D41D">
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
                                <div class="text-xs font-weight-bold text-uppercase mb-1" style="color: #C6D41D">Estado </div>
                                <div class="text-xs font-weight-bold text-uppercase mb-1" style="color: #C6D41D"> Abierto</div>
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
                                    <div class="text-xs font-weight-bold text-uppercase mb-1" style="color: #C6D41D">Estado </div>
                                    <div class="text-xs font-weight-bold text-uppercase mb-1" style="color: #C6D41D">En proceso</div>
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
                                    <div class="text-xs font-weight-bold  text-uppercase mb-1" style="color: #C6D41D">Estado </div>
                                    <div class="text-xs font-weight-bold  text-uppercase mb-1" style="color: #C6D41D"> En Espera</div>
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
                                    <label for="txtEstadoCasoTicket2">Rut Paciente</label>
                                    <input type="text" class="form-control" id="txtRut" name="txtRut" />
                                </fieldset>
                                    <fieldset class="form-group col-md-3">
                                    <label for="txtFechaDesde">Fecha de Solicitud</label>
                                    <input type="date" class="form-control" id="txtFechaDesde" name="txtFechaDesde" />
                                </fieldset>
                                <fieldset class="form-group col-md-2">
                                    <label for="txtEstado">Estado</label>
                                    <select name="txtEstado" id="txtEstado" class="form-control">
                                         <%=  ViewData["opcionesEstados"] %>
                                    </select>
                                </fieldset>
                                <fieldset class="form-group col-md-2">
                                    <label for="txtTecnica">Técnica</label>
                                    <select name="txtTecnica" id="txtTecnica" class="form-control">
                                         <%=  ViewData["opcionesTecnicas"] %>
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

                    $('#txtRut, #txtFechaDesde, #txtEstado, #txtTecnica').change(function () {
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
                            var Rut = data[2];
                            var IsRut = !$("#txtRut").val() ||
                                Rut.includes($("#txtRut").val()) == true;

                            //Estado
                            var EstadoTabla = data[4];
                            var EstadoActual = $("#txtEstado").children(":selected").text();
                            var EstadoSeleccionada = EstadoActual == "--- Selecciona opción --" || EstadoActual == EstadoTabla;

                            //Técnica
                            var TecnicoTabla = data[5];
                            var TecnicoActual = $("#txtTecnica").children(":selected").text();
                            var TecnicoSeleccionada = TecnicoActual == "-- Selecciona opción --" || TecnicoActual == TecnicoTabla;

                            if (TecnicoSeleccionada && IsIdSolicitud && EstadoSeleccionada && IsRut) {
                                return true;
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