<%@ Page Title="" Language="C#" MasterPageFile="~/Views/DisenoBootstrap3.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

    <asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">

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

    </asp:Content>
