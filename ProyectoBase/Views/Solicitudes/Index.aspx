<%@ Page Title="" Language="C#" MasterPageFile="~/Views/DisenoBootstrap3.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>


<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">



<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/pdfmake.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/vfs_fonts.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/v/bs4/jszip-2.5.0/dt-1.10.24/af-2.3.5/b-1.7.0/b-colvis-1.7.0/b-html5-1.7.0/b-print-1.7.0/cr-1.5.3/date-1.0.3/fc-3.3.2/fh-3.1.8/kt-2.6.1/r-2.2.7/rg-1.1.2/rr-1.2.7/sc-2.0.3/sb-1.0.1/sp-1.2.2/sl-1.3.3/datatables.min.js"></script>
    
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.24/css/dataTables.bootstrap.min.css">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
    <%--    <script src="js/jquery.min.js" type="text/javascript"></script>--%>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/bs4/jszip-2.5.0/dt-1.10.24/af-2.3.5/b-1.7.0/b-colvis-1.7.0/b-html5-1.7.0/b-print-1.7.0/cr-1.5.3/date-1.0.3/fc-3.3.2/fh-3.1.8/kt-2.6.1/r-2.2.7/rg-1.1.2/rr-1.2.7/sc-2.0.3/sb-1.0.1/sp-1.2.2/sl-1.3.3/datatables.min.css"/>
 
    <%-- Moment --%>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
<%--<script src="js/jquery.dataTables.min.js" type="text/javascript"></script>--%>
<%--        <script>
            $(document).ready(function () {
                var table = $('#tablasolicitudes').DataTable({
                    "sDom": '<"top">rt<"bottom"ip><"clear">',
                    "order": [
                        [0, "asc"]
                    ],
                    "language": {
                        "oPaginate": {
                            "sFirst": "Primero",
                            "sLast": "Último",
                            "sNext": ">",
                            "sPrevious": "<"
                        },
                    }
                });
                $("#tablasolicitudes").on("click", ".btnEliminar", function (e) {
                    console.log("asdasd");
                    //fila2 = e.currentTarget;
                    $("#exampleModal").modal('show');
                });
            });
        </script>--%>
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
                    <!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        ...
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>
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
                                    <label for="txtTecnica">Técnica</label>
                                    <select name="txtTecnica" id="txtTecnica" class="form-control">
                                        <option  value='0'>Todos</option>
                                         <option  value='1'>FUE</option>
                                        <option  value='2'>FUSS</option>
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
                        <table aria-describedby="datatable-basic_info" class="table table-flush table-striped table-bordered dataTable" role="grid" id="tablasolicitudes">
                            <thead>
                                <tr>
                                    <th class="col-xs-2">N° Solicitud</th>
                                    <th class="col-xs-1">Cliente</th>
                                    <th class="col-xs-1">Rut</th>
                                    <th class="col-xs-1">Fecha Solicitud</th>
                                    <th class="col-xs-2">Estado</th>
                                    <th class="col-xs-1">Técnica</th>
                                    <th class="col-xs-1">Último cambio</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%= ViewData["valoresSolicitudes"] %>
                            </tbody>
                        </table>
                        
                    </div>
                </div>
            </div>
                <style>
                            .page-item.active .page-link {
            z-index: 1 !important;
            color: #fff !important;
            background-color: #bad302 !important;
            border-color: #bad302 !important;
        }
                </style>
            <script type="text/javascript" src="https://cdn.datatables.net/plug-ins/1.10.24/sorting/date-uk.js"></script>
            <script>
                // Datatable y propiedades
                jQuery.extend(jQuery.fn.dataTableExt.oSort, {
                    "date-uk-pre": function (a) {
                        var ukDatea = a.split('-');
                        return (ukDatea[2] + ukDatea[1] + ukDatea[0]) * 1;
                    },

                    "date-uk-asc": function (a, b) {
                        return ((a < b) ? -1 : ((a > b) ? 1 : 0));
                    },

                    "date-uk-desc": function (a, b) {
                        return ((a < b) ? 1 : ((a > b) ? -1 : 0));
                    }
                });
                    
                    // Datatable y propiedades  

                    var table = $('#tablasolicitudes').DataTable({
                        "aoColumns": [
                            null,
                            null,
                            null,
                            { "sType": "date-uk" },
                            null,
                            null,
                            { "sType": "date-uk" }
                        ],
                        "sDom": '<"top">rt<"bottom"ip><"clear">',
                        "order": [ [6, "dec"] ],
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
              
            </script>
            </div>
        </div>
    </div> 

        </div>
        </section>
        </main>
</asp:Content>