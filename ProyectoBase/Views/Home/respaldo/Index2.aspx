﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/DisenoBootstrap3.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <script src="<%: Url.Content("~/Styles/js/moment.js") %>"></script>
    <script src="<%: Url.Content("~/Styles/js/datatable.min.js") %>"></script>
    <link href="<%: Url.Content("~/Styles/css/datatable.min.css") %>" rel="stylesheet" />

    <title>Estado de solicitudes</title>
    <script>
        $(document).ready(function () {
            // Datatable y propiedades
            var table = $('#tablasolicitudes').DataTable({
                "sDom": '<"top">rt<"bottom"ip><"clear">',
                "order": [[1, "desc"]],
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

            // Reconocer inputs
            $("#txtNroCaso").on("input", function () {
                table.draw();
            });
            $('#txtFechaDesde, #txtFechaHasta, #txtEstadoCaso, #txtProceso, #txtActividadActual').change(function () {
                table.draw();
            });

            // Filtros
            $.fn.dataTable.ext.search.push(
                function (settings, data, dataIndex) {
                    // Rango de fecha
                    var min = moment($('#txtFechaDesde').val(), "YYYY-MM-DD");
                    var max = moment($('#txtFechaHasta').val(), "YYYY-MM-DD");
                    var fecha = moment(data[3], "DD/MM/YYYY");
                    var estaEnRangoFechas = ((isNaN(min) && isNaN(max)) || // Si no hay campos
                        (min.isSameOrBefore(fecha) && isNaN(max)) || // Solo si hay desde
                        (isNaN(min) && fecha.isSameOrBefore(max)) || // Solo si hay hasta
                        (min.isSameOrBefore(fecha) && fecha.isSameOrBefore(max))); // Si hay ambos campos

                    // Nro. de caso
                    var nroCaso = data[1];
                    var estaNroCaso = !$("#txtNroCaso").val() ||
                        $("#txtNroCaso").val() == nroCaso;

                    // Estado del caso
                    var estadosTabla = data[2];
                    var estadoActual = $("#txtEstadoCaso").children(":selected").text();
                    var estaEnEstadoCaso = estadoActual == "Todos" ||
                        estadoActual == estadosTabla;

                    // Nombre proceso
                    var procesosTabla = data[0];
                    var procesoActual = $("#txtProceso").children(":selected").text();
                    var estaEnProcesoCaso = procesoActual == "Todos" ||
                        procesoActual == procesosTabla;

                    // Actividad actual
                    var actividadesTabla = data[5];
                    var actividadActual = $("#txtActividadActual").children(":selected").text();
                    var estaActividadActual = actividadActual == "Todos" ||
                        actividadActual == actividadesTabla;

                    // Comprobar todos los casos (con actividad)
                    /*if (estaEnRangoFechas &&
                        estaNroCaso &&
                        estaEnEstadoCaso &&
                        estaActividadActual) {
                        return true;
                    }*/

                    if (estaEnRangoFechas &&
                        estaNroCaso &&
                        estaEnEstadoCaso &&
                        estaEnProcesoCaso) {
                        return true;
                    }

                    return false;
                });

            // Validar números
            $("#txtNroCaso").numeric("{ negative : false , decimalPlaces : 0 , decimal : ',' }");
        });
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Estado de solicitudes</h2>

    <%--FILTROS--%>

    <div class="panel panel-primary">
        <div class="panel-heading">Filtros solicitudes</div>
        <div class="panel-body">
            <div class="row">
                <fieldset class="form-group col-md-2 ">
                    <label for="txtFechaDesde">Fecha desde</label>
                    <input type="date" class="form-control" id="txtFechaDesde" name="txtFechaDesde" />
                </fieldset>
                <fieldset class="form-group col-md-2">
                    <label for="txtFechaHasta">Fecha hasta</label>
                    <input type="date" class="form-control" id="txtFechaHasta" name="txtFechaHasta" />
                </fieldset>
                <fieldset class="form-group col-md-2">
                    <label for="txtNroCaso">ID de caso</label>
                    <input type="text" class="form-control" id="txtNroCaso" name="txtNroCaso" placeholder="ID de caso" />
                </fieldset>
                <fieldset class="form-group col-md-3">
                    <label for="txtProceso">Nombre proceso</label>
                    <select name="txtProceso" id="txtProceso" class="form-control">
                        <option value="0">Todos</option>
                        <option value="1">Proceso 1</option>
                    </select>
                </fieldset>
                <fieldset class="form-group col-md-2">
                    <label for="txtEstadoCaso">Estado del caso</label>
                    <select name="txtEstadoCaso" id="txtEstadoCaso" class="form-control">
                        <option value="0">Todos</option>
                        <option value="1">Iniciado</option>
                        <option value="2">Completado</option>
                        <%--<option value="3">No iniciado</option>
                        <option value="4">Suspendido</option>--%>
                    </select>
                </fieldset>
            </div>
        </div>
    </div>

    <%--TABLA--%>
    <div class="table-responsive">
        <table class="table table-bordered table-hover" id="tablasolicitudes">
            <thead>
                <tr>
                    <th class="col-xs-2">Proceso</th>
                    <th class="col-xs-1">ID de caso</th>
                    <th class="col-xs-2">Estado del caso</th>
                    <th class="col-xs-1">Fecha de creación</th>
                    <%--<th class="col-xs-1">Fecha de solución</th>--%>
                    <th class="col-xs-4">Actividad actual</th>
                    <th class="col-xs-1">Detalle</th>
                </tr>
            </thead>
            <tbody><%= ViewData["valores"] %></tbody>
        </table>
    </div>

</asp:Content>
