<%@ Page Title="" Language="C#" MasterPageFile="~/Views/DisenoBootstrap3.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>


<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
            <script src="https://unpkg.com/gijgo@1.9.13/js/gijgo.min.js" type="text/javascript"></script>
    <link href="https://unpkg.com/gijgo@1.9.13/css/gijgo.min.css" rel="stylesheet" type="text/css" />
    <script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.11.1/jquery.validate.min.js"></script>
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
            if (Estado == 6) {
                $("#divEstados").show();
                $("#divEstado7").hide();
                $("#divEstado4").hide();
                $("#divEstado13").hide();
                $("#divEstado14").hide();
                $("#divEstado15").hide();
                $("#divEstado17").hide();
                $("#divEstado21").hide();
                $("#divEstado23").hide();
                $("#divEstado25").hide();
                $("#divEstado27").hide();
                $("#divEstado29").hide();
                $("#divEstado30").hide();
                $("#divEstado11").hide();
                $("#divEstado33").hide();
            }
            if (Estado == 4) {
                console.log("Estado 4")
                $("#divEstados").hide();
                $("#divEstado4").show();
                $("#divEstado7").hide();
                $("#divEstado13").hide();
                $("#divEstado14").hide();
                $("#divEstado15").hide();
                $("#divEstado17").hide();
                $("#divEstado21").hide();
                $("#divEstado23").hide();
                $("#divEstado25").hide();
                $("#divEstado27").hide();
                $("#divEstado29").hide();
                $("#divEstado30").hide();
                $("#divEstado11").hide();
                $("#divEstado33").hide();
            }
            if (Estado == 7) {
                console.log("Estado 4")
                $("#divEstados").hide();
                $("#divEstado4").hide();
                $("#divEstado13").hide();
                $("#divEstado14").hide();
                $("#divEstado15").hide();
                $("#divEstado17").hide();
                $("#divEstado21").hide();
                $("#divEstado23").hide();
                $("#divEstado25").hide();
                $("#divEstado27").hide();
                $("#divEstado29").hide();
                $("#divEstado30").hide();
                $("#divEstado11").hide();
                $("#divEstado7").show();
                $("#divEstado33").hide();
            }
            if (Estado == 11) {
                $("#divEstados").hide();
                $("#divEstado4").hide();
                $("#divEstado7").hide();
                $("#divEstado13").hide();
                $("#divEstado14").hide();
                $("#divEstado15").hide();
                $("#divEstado17").hide();
                $("#divEstado21").hide();
                $("#divEstado23").hide();
                $("#divEstado25").hide();
                $("#divEstado27").hide();
                $("#divEstado29").hide();
                $("#divEstado30").hide();
                $("#divEstado11").show();
                $("#divEstado33").hide();
            }
            if (Estado == 13) {
                console.log("Estado 13")
                $("#divEstados").hide();
                $("#divEstado4").hide();
                $("#divEstado13").show();
                $("#divEstado14").hide();
                $("#divEstado15").hide();
                $("#divEstado17").hide();
                $("#divEstado21").hide();
                $("#divEstado23").hide();
                $("#divEstado25").hide();
                $("#divEstado27").hide();
                $("#divEstado29").hide();
                $("#divEstado30").hide();
                $("#divEstado11").hide();
                $("#divEstado7").hide();
                $("#divEstado33").hide();
            }
            if (Estado == 14) {
                $("#divEstados").hide();
                $("#divEstado4").hide();
                $("#divEstado13").hide();
                $("#divEstado14").show();
                $("#divEstado15").hide();
                $("#divEstado17").hide();
                $("#divEstado21").hide();
                $("#divEstado23").hide();
                $("#divEstado25").hide();
                $("#divEstado27").hide();
                $("#divEstado29").hide();
                $("#divEstado30").hide();
                $("#divEstado11").hide();
                $("#divEstado7").hide();
                $("#divEstado33").hide();
            }
            if (Estado == 15) {
                $("#divEstados").hide();
                $("#divEstado4").hide();
                $("#divEstado13").hide();
                $("#divEstado14").hide();
                $("#divEstado15").show();
                $("#divEstado17").hide();
                $("#divEstado21").hide();
                $("#divEstado23").hide();
                $("#divEstado25").hide();
                $("#divEstado27").hide();
                $("#divEstado29").hide();
                $("#divEstado30").hide();
                $("#divEstado11").hide();
                $("#divEstado7").hide();
                $("#divEstado33").hide();
            }
            if (Estado == 17) {
                $("#divEstados").hide();
                $("#divEstado4").hide();
                $("#divEstado13").hide();
                $("#divEstado14").hide();
                $("#divEstado15").hide();
                $("#divEstado17").show();
                $("#divEstado21").hide();
                $("#divEstado23").hide();
                $("#divEstado25").hide();
                $("#divEstado27").hide();
                $("#divEstado29").hide();
                $("#divEstado30").hide();
                $("#divEstado11").hide();
                $("#divEstado7").hide();
                $("#divEstado33").hide();
            }
            if (Estado == 1 || Estado == 2 || Estado == 3 || Estado == 5 || Estado == 8 || Estado == 9) {
                $("#divEstados").hide();
                $("#divEstado4").hide();
                $("#divEstado13").hide();
                $("#divEstado14").hide();
                $("#divEstado15").hide();
                $("#divEstado17").hide();
                $("#divEstado21").hide();
                $("#divEstado23").hide();
                $("#divEstado25").hide();
                $("#divEstado27").hide();
                $("#divEstado29").hide();
                $("#divEstado30").hide();
                $("#divEstado11").hide();
                $("#divEstado7").hide();
                $("#divEstado33").hide();
            }
            if (Estado == 20 || Estado == 22 || Estado == 24) {
                $("#divEstados").hide();
                $("#divEstado4").hide();
                $("#divEstado13").hide();
                $("#divEstado14").hide();
                $("#divEstado15").hide();
                $("#divEstado17").hide();
                $("#divEstado21").hide();
                $("#divEstado23").hide();
                $("#divEstado25").hide();
                $("#divEstado27").hide();
                $("#divEstado29").hide();
                $("#divEstado30").hide();
                $("#divEstado11").hide();
                $("#divEstado7").hide();
                $("#divEstado33").hide();
            }
            if (Estado == 10 || Estado == 12 || Estado == 16 || Estado == 18 || Estado == 19) {
                $("#divEstados").hide();
                $("#divEstado4").hide();
                $("#divEstado13").hide();
                $("#divEstado14").hide();
                $("#divEstado15").hide();
                $("#divEstado17").hide();
                $("#divEstado21").hide();
                $("#divEstado23").hide();
                $("#divEstado25").hide();
                $("#divEstado27").hide();
                $("#divEstado29").hide();
                $("#divEstado30").hide();
                $("#divEstado11").hide();
                $("#divEstado7").hide();
                $("#divEstado33").hide();
            }
            if (Estado == 26 || Estado == 28 || Estado == 31 || Estado == 32) {
                $("#divEstados").hide();
                $("#divEstado4").hide();
                $("#divEstado13").hide();
                $("#divEstado14").hide();
                $("#divEstado15").hide();
                $("#divEstado17").hide();
                $("#divEstado21").hide();
                $("#divEstado23").hide();
                $("#divEstado25").hide();
                $("#divEstado27").hide();
                $("#divEstado29").hide();
                $("#divEstado30").hide();
                $("#divEstado11").hide();
                $("#divEstado7").hide();
                $("#divEstado33").hide();
            }
            if (Estado == 21) {
                $("#divEstados").hide();
                $("#divEstado4").hide();
                $("#divEstado13").hide();
                $("#divEstado14").hide();
                $("#divEstado15").hide();
                $("#divEstado17").hide();
                $("#divEstado21").show();
                $("#divEstado23").hide();
                $("#divEstado25").hide();
                $("#divEstado23").hide();
                $("#divEstado25").hide();
                $("#divEstado27").hide();
                $("#divEstado29").hide();
                $("#divEstado30").hide();
                $("#divEstado11").hide();
                $("#divEstado7").hide();
                $("#divEstado33").hide();
            }
            if (Estado == 23) {
                $("#divEstados").hide();
                $("#divEstado4").hide();
                $("#divEstado13").hide();
                $("#divEstado14").hide();
                $("#divEstado15").hide();
                $("#divEstado17").hide();
                $("#divEstado21").hide();
                $("#divEstado23").show();
                $("#divEstado25").hide();
                $("#divEstado21").hide();
                $("#divEstado25").hide();
                $("#divEstado27").hide();
                $("#divEstado29").hide();
                $("#divEstado30").hide();
                $("#divEstado11").hide();
                $("#divEstado7").hide();
                $("#divEstado33").hide();
            }

            if (Estado == 25) {
                $("#divEstados").hide();
                $("#divEstado4").hide();
                $("#divEstado13").hide();
                $("#divEstado14").hide();
                $("#divEstado15").hide();
                $("#divEstado17").hide();
                $("#divEstado21").hide();
                $("#divEstado23").hide();
                $("#divEstado25").show();
                $("#divEstado21").hide();
                $("#divEstado23").hide();
                $("#divEstado27").hide();
                $("#divEstado29").hide();
                $("#divEstado30").hide();
                $("#divEstado11").hide();
                $("#divEstado7").hide();
                $("#divEstado33").hide();
            }
            if (Estado == 27) {
                $("#divEstados").hide();
                $("#divEstado4").hide();
                $("#divEstado13").hide();
                $("#divEstado14").hide();
                $("#divEstado15").hide();
                $("#divEstado17").hide();
                $("#divEstado27").show();
                $("#divEstado21").hide();
                $("#divEstado23").hide();
                $("#divEstado25").hide();
                $("#divEstado29").hide();
                $("#divEstado30").hide();
                $("#divEstado11").hide();
                $("#divEstado7").hide();
                $("#divEstado33").hide();
            }
            if (Estado == 29) {
                $("#divEstados").hide();
                $("#divEstado4").hide();
                $("#divEstado13").hide();
                $("#divEstado14").hide();
                $("#divEstado15").hide();
                $("#divEstado17").hide();
                $("#divEstado27").hide();
                $("#divEstado21").hide();
                $("#divEstado23").hide();
                $("#divEstado25").hide();
                $("#divEstado29").show();
                $("#divEstado30").hide();
                $("#divEstado11").hide();
                $("#divEstado7").hide();
                $("#divEstado33").hide();
            }
            if (Estado == 30) {
                $("#divEstados").hide();
                $("#divEstado4").hide();
                $("#divEstado13").hide();
                $("#divEstado14").hide();
                $("#divEstado15").hide();
                $("#divEstado17").hide();
                $("#divEstado21").hide();
                $("#divEstado23").hide();
                $("#divEstado25").hide();
                $("#divEstado27").hide();
                $("#divEstado29").hide();
                $("#divEstado30").show();
                $("#divEstado11").hide();
                $("#divEstado7").hide();
                $("#divEstado33").hide();
            }
            if (Estado == 33) {
                $("#divEstados").hide();
                $("#divEstado4").hide();
                $("#divEstado13").hide();
                $("#divEstado14").hide();
                $("#divEstado15").hide();
                $("#divEstado17").hide();
                $("#divEstado21").hide();
                $("#divEstado23").hide();
                $("#divEstado25").hide();
                $("#divEstado27").hide();
                $("#divEstado29").hide();
                $("#divEstado30").hide();
                $("#divEstado11").hide();
                $("#divEstado7").hide();
                $("#divEstado33").show();
            }
            $("#txtEstado").change(function () {
                console.log("Estado Seleccionado: " + $("#txtEstado").val())
                var Estado = $("#txtEstado").val();
                if (Estado == 6) {
                    console.log("Estado 6")
                    console.log("Estado 6" + Estado)
                    $("#divEstados").show();
                    $("#divEstado4").hide();
                    $("#divEstado13").hide();
                    $("#divEstado14").hide();
                    $("#divEstado15").hide();
                    $("#divEstado17").hide();
                    $("#divEstado21").hide();
                    $("#divEstado23").hide();
                    $("#divEstado25").hide();
                    $("#divEstado27").hide();
                    $("#divEstado29").hide();
                    $("#divEstado30").hide();
                    $("#divEstado11").hide();
                    $("#divEstado7").hide();
                    $("#divEstado33").hide();
                }
                if (Estado == 4) {
                    console.log("Estado 4")
                    $("#divEstados").hide();
                    $("#divEstado4").show();
                    $("#divEstado13").hide();
                    $("#divEstado14").hide();
                    $("#divEstado15").hide();
                    $("#divEstado17").hide();
                    $("#divEstado21").hide();
                    $("#divEstado23").hide();
                    $("#divEstado25").hide();
                    $("#divEstado27").hide();
                    $("#divEstado29").hide();
                    $("#divEstado30").hide();
                    $("#divEstado11").hide();
                    $("#divEstado7").hide();
                    $("#divEstado33").hide();
                }
                if (Estado == 7) {
                    console.log("Estado 4")
                    $("#divEstados").hide();
                    $("#divEstado4").hide();
                    $("#divEstado13").hide();
                    $("#divEstado14").hide();
                    $("#divEstado15").hide();
                    $("#divEstado17").hide();
                    $("#divEstado27").hide();
                    $("#divEstado21").hide();
                    $("#divEstado23").hide();
                    $("#divEstado25").hide();
                    $("#divEstado29").hide();
                    $("#divEstado30").hide();
                    $("#divEstado11").hide();
                    $("#divEstado7").show();
                    $("#divEstado33").hide();
                }
                if (Estado == 13) {
                    $("#divEstados").hide();
                    $("#divEstado4").hide();
                    $("#divEstado13").show();
                    $("#divEstado14").hide();
                    $("#divEstado15").hide();
                    $("#divEstado17").hide();
                    $("#divEstado21").hide();
                    $("#divEstado23").hide();
                    $("#divEstado25").hide();
                    $("#divEstado27").hide();
                    $("#divEstado27").hide();
                    $("#divEstado29").hide();
                    $("#divEstado11").hide();
                    $("#divEstado7").hide();
                    $("#divEstado33").hide();
                }
                if (Estado == 14) {
                    $("#divEstados").hide();
                    $("#divEstado4").hide();
                    $("#divEstado13").hide();
                    $("#divEstado14").show(); 
                    $("#divEstado15").hide();
                    $("#divEstado17").hide();
                    $("#divEstado21").hide();
                    $("#divEstado23").hide();
                    $("#divEstado25").hide();
                    $("#divEstado27").hide();
                    $("#divEstado29").hide();
                    $("#divEstado30").hide();
                    $("#divEstado11").hide();
                    $("#divEstado7").hide();
                    $("#divEstado33").hide();
                }
                if (Estado == 15) {
                    $("#divEstados").hide();
                    $("#divEstado4").hide();
                    $("#divEstado13").hide();
                    $("#divEstado14").hide();
                    $("#divEstado15").show();
                    $("#divEstado17").hide();
                    $("#divEstado21").hide();
                    $("#divEstado23").hide();
                    $("#divEstado25").hide();
                    $("#divEstado27").hide();
                    $("#divEstado29").hide();
                    $("#divEstado11").hide();
                    $("#divEstado7").hide();
                    $("#divEstado33").hide();
                }
                if (Estado == 17) {
                    $("#divEstados").hide();
                    $("#divEstado4").hide();
                    $("#divEstado13").hide();
                    $("#divEstado14").hide();
                    $("#divEstado15").hide();
                    $("#divEstado17").show();
                    $("#divEstado21").hide();
                    $("#divEstado23").hide();
                    $("#divEstado25").hide();
                    $("#divEstado27").hide();
                    $("#divEstado29").hide();
                    $("#divEstado30").hide();
                    $("#divEstado11").hide();
                    $("#divEstado7").hide();
                    $("#divEstado33").hide();
                }
                if (Estado == 20 || Estado == 22 || Estado == 24) {
                    $("#divEstados").hide();
                    $("#divEstado4").hide();
                    $("#divEstado13").hide();
                    $("#divEstado14").hide();
                    $("#divEstado15").hide();
                    $("#divEstado17").hide();
                    $("#divEstado21").hide();
                    $("#divEstado23").hide();
                    $("#divEstado25").hide();
                    $("#divEstado27").hide();
                    $("#divEstado29").hide();
                    $("#divEstado30").hide();
                    $("#divEstado11").hide();
                    $("#divEstado7").hide();
                    $("#divEstado33").hide();
                }
                if (Estado == 1 || Estado == 2 || Estado == 3 || Estado == 5 || Estado == 8 || Estado == 9) {
                    $("#divEstados").hide();
                    $("#divEstado4").hide();
                    $("#divEstado13").hide();
                    $("#divEstado14").hide();
                    $("#divEstado15").hide();
                    $("#divEstado17").hide();
                    $("#divEstado21").hide();
                    $("#divEstado23").hide();
                    $("#divEstado25").hide();
                    $("#divEstado27").hide();
                    $("#divEstado29").hide();
                    $("#divEstado30").hide();
                    $("#divEstado11").hide();
                    $("#divEstado7").hide();
                    $("#divEstado33").hide();
                }
                if (Estado == 11) {
                    $("#divEstados").hide();
                    $("#divEstado4").hide();
                    $("#divEstado13").hide();
                    $("#divEstado14").hide();
                    $("#divEstado15").hide();
                    $("#divEstado17").hide();
                    $("#divEstado21").hide();
                    $("#divEstado23").hide();
                    $("#divEstado25").hide();
                    $("#divEstado27").hide();
                    $("#divEstado29").hide();
                    $("#divEstado30").hide();
                    $("#divEstado11").show();
                    $("#divEstado7").hide();
                    $("#divEstado33").hide();
                }
                if (Estado == 10 || Estado == 12 || Estado == 16 || Estado == 18 || Estado == 19) {
                    $("#divEstados").hide();
                    $("#divEstado4").hide();
                    $("#divEstado13").hide();
                    $("#divEstado14").hide();
                    $("#divEstado15").hide();
                    $("#divEstado17").hide();
                    $("#divEstado21").hide();
                    $("#divEstado23").hide();
                    $("#divEstado25").hide();
                    $("#divEstado27").hide();
                    $("#divEstado29").hide();
                    $("#divEstado30").hide();
                    $("#divEstado11").hide();
                    $("#divEstado7").hide();
                    $("#divEstado33").hide();
                }
                if (Estado == 26 || Estado == 28 || Estado == 31 || Estado == 32) {
                    $("#divEstados").hide();
                    $("#divEstado4").hide();
                    $("#divEstado13").hide();
                    $("#divEstado14").hide();
                    $("#divEstado15").hide();
                    $("#divEstado17").hide();
                    $("#divEstado21").hide();
                    $("#divEstado23").hide();
                    $("#divEstado25").hide();
                    $("#divEstado27").hide();
                    $("#divEstado29").hide();
                    $("#divEstado30").hide();
                    $("#divEstado11").hide();
                    $("#divEstado7").hide();
                    $("#divEstado33").hide();
                }
                if (Estado == 21) {
                    $("#divEstados").hide();
                    $("#divEstado4").hide();
                    $("#divEstado13").hide();
                    $("#divEstado14").hide();
                    $("#divEstado15").hide();
                    $("#divEstado17").hide();
                    $("#divEstado21").show();
                    $("#divEstado23").hide();
                    $("#divEstado25").hide();
                    $("#divEstado27").hide();
                    $("#divEstado29").hide();
                    $("#divEstado30").hide();
                    $("#divEstado11").hide();
                    $("#divEstado7").hide();
                    $("#divEstado33").hide();
                }
                if (Estado == 23) {
                    $("#divEstados").hide();
                    $("#divEstado4").hide();
                    $("#divEstado13").hide();
                    $("#divEstado14").hide();
                    $("#divEstado15").hide();
                    $("#divEstado17").hide();
                    $("#divEstado21").hide();
                    $("#divEstado23").show();
                    $("#divEstado25").hide();
                    $("#divEstado27").hide();
                    $("#divEstado29").hide();
                    $("#divEstado30").hide();
                    $("#divEstado11").hide();
                    $("#divEstado7").hide();
                    $("#divEstado33").hide();
                }

                if (Estado == 25) {
                    $("#divEstados").hide();
                    $("#divEstado4").hide();
                    $("#divEstado13").hide();
                    $("#divEstado14").hide();
                    $("#divEstado15").hide();
                    $("#divEstado17").hide();
                    $("#divEstado21").hide();
                    $("#divEstado23").hide();
                    $("#divEstado25").show();
                    $("#divEstado27").hide();
                    $("#divEstado29").hide();
                    $("#divEstado30").hide();
                    $("#divEstado11").hide();
                    $("#divEstado7").hide();
                    $("#divEstado33").hide();
                }
                if (Estado == 27) {
                    $("#divEstados").hide();
                    $("#divEstado4").hide();
                    $("#divEstado13").hide();
                    $("#divEstado14").hide();
                    $("#divEstado15").hide();
                    $("#divEstado17").hide();
                    $("#divEstado21").hide();
                    $("#divEstado23").hide();
                    $("#divEstado25").hide();
                    $("#divEstado27").show();  
                    $("#divEstado29").hide();
                    $("#divEstado30").hide();
                    $("#divEstado11").hide();
                    $("#divEstado7").hide();
                    $("#divEstado33").hide();
                }
                if (Estado == 29) {
                    $("#divEstados").hide();
                    $("#divEstado4").hide();
                    $("#divEstado13").hide();
                    $("#divEstado14").hide();
                    $("#divEstado15").hide();
                    $("#divEstado17").hide();
                    $("#divEstado21").hide();
                    $("#divEstado23").hide();
                    $("#divEstado25").hide();
                    $("#divEstado27").hide();
                    $("#divEstado29").show(); 
                    $("#divEstado30").hide();
                    $("#divEstado11").hide();
                    $("#divEstado7").hide();
                    $("#divEstado33").hide();
                }
                if (Estado == 30) {
                    $("#divEstados").hide();
                    $("#divEstado4").hide();
                    $("#divEstado13").hide();
                    $("#divEstado14").hide();
                    $("#divEstado15").hide();
                    $("#divEstado17").hide();
                    $("#divEstado21").hide();
                    $("#divEstado23").hide();
                    $("#divEstado25").hide();
                    $("#divEstado27").hide();
                    $("#divEstado29").hide();
                    $("#divEstado30").show();
                    $("#divEstado11").hide();
                    $("#divEstado7").hide();
                    $("#divEstado33").hide();
                }
                if (Estado == 33) {
                    $("#divEstados").hide();
                    $("#divEstado4").hide();
                    $("#divEstado13").hide();
                    $("#divEstado14").hide();
                    $("#divEstado15").hide();
                    $("#divEstado17").hide();
                    $("#divEstado21").hide();
                    $("#divEstado23").hide();
                    $("#divEstado25").hide();
                    $("#divEstado27").hide();
                    $("#divEstado29").hide();
                    $("#divEstado30").hide();
                    $("#divEstado11").hide();
                    $("#divEstado7").hide();
                    $("#divEstado33").show();
                }
                
            });
            var valorEscrito = $("#txtObservacion2").val();
            $("#txtObservacion2").change(function () {
                 valorEscrito = $("#txtObservacion2").val();
            });
            $("#chxObservacion2").change(function () {
                $("#txtObservacion2").val("");
                var valorSelect = $("#chxObservacion2").val();
                if (valorSelect == "") {
                    $("#txtObservacion2").val(valorEscrito);
                } else {
                    $("#txtObservacion2").val(valorSelect);
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
   <%-- <meta http-equiv="Content-Security-Policy" content="default-src 'self' data: gap: https://ssl.gstatic.com 'unsafe-eval'; style-src 'self' 'unsafe-inline'; media-src *;**script-src 'self' http://onlineerp.solution.quebec 'unsafe-inline' 'unsafe-eval';** ">
    <meta http-equiv="Content-Security-Policy" content="default-src * self blob: data: gap:; style-src * self 'unsafe-inline' blob: data: gap:; script-src * 'self' 'unsafe-eval' 'unsafe-inline' blob: data: gap:; object-src * 'self' blob: data: gap:; img-src * self 'unsafe-inline' blob: data: gap:; connect-src self * 'unsafe-inline' blob: data: gap:; frame-src * self blob: data: gap:;">--%>
    <!-- ======= About Section ======= -->
    <meta http-equiv="Content-Security-Policy" content="default-src 'none'; connect-src 'self';font-src 'self'; img-src 'self' data: https:; style-src 'self' ; script-src 'self'">

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
                            <div class="row">
                                <div class="col-4">
                                    <label for="txtFechaCirugia"></label>
                                    <label style="color: black">Fecha Cirugía Paciente</label>
                                    <div id="selDiv">
                                        <input disabled id="txtFechaCirugia" name="txtFechaCirugia" type='text' class='form-control' value='<%= ViewData["FechaCirugia"] %>'>
                                    </div>
                          
                                    <br />
                                </div>
                                <div class="col-4">
                                    <label for="txtFechaLlamada"></label>        
                                    <label style="color: black">Fecha Llamada Paciente</label>
                                    <div id="selDiv">
                                        <input disabled  name="txtFechaLlamada" type='text' class='form-control' value='<%= ViewData["FechaLlamada"] %>'>
                                    </div>
          
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
                            <div id="divEstado4">
                                <div class="col-lg-6 col-md-6 form-group">
                                    <input id="txtFechaEvaluacion" placeholder="Fecha de evaluación presencial" name="txtFechaEvaluacion" />
                                    <script>
                                        $('#txtFechaEvaluacion').datepicker({
                                            uiLibrary: 'bootstrap4',
                                            format: 'dd/mm/yyyy'
                                        });
                                    </script>

                                </div>
                            </div>
                            <div id="divEstado7">
<%--                                <div class="col-lg-6 col-md-6 form-group">
                                    <label for="txtFechaCirugiaDoctor"></label>
                                    <label style="color:black">Confirmar Fecha Cirugía </label>
                                    <input id="txtFechaCirugiaDoctor" placeholder="Fecha de cirugía " name="txtFechaCirugiaDoctor" />
                                    <script>
                                        $('#txtFechaCirugiaDoctor').datepicker({
                                            uiLibrary: 'bootstrap4',
                                            format: 'dd/mm/yyyy'
                                        });
                                    </script>

                                </div>--%>
                            </div>
                            <div id="divEstado11">
                                <div class="col-6">
                                    <label for="txtMedico"></label>
                                    <label style="color:black"> Médico </label>
                                        <select name="txtMedico" id="txtMedico" class="form-control" >
                                            <%= ViewData["opcionesMedicos"] %>
                                        </select>  
                                    <div class="invalid-feedback">Seleccione una opción</div>
                                    <br />
                                    <label style="color:black"> Fecha Evaluación Presencial</label>
                                    <input id="txtFechaPresencial" placeholder="Fecha de evaluación presencial" name="txtFechaPresencial" value="<%= ViewData["FechaEvaluacionPreciencial"] %>"/>
                                    <script>
                                        $('#txtFechaPresencial').datepicker({
                                            uiLibrary: 'bootstrap4',
                                            format: 'dd/mm/yyyy'
                                        });
                                    </script>
                                    <br />
                                 </div>
                            </div>                            
                            <div id="divEstado13">
                                <div class="col-lg-12 col-md-12 form-group">
                                    <label style="color:black"> Observación </label>
                                    <select id="chxObservacion2" name="chxObservacion2" class="form-control">
                                        <option value="">--Comentarios--</option>
                                        <option value="No se puede calcular bien el numero de foliculos">No se puede calcular bien el numero de foliculos</option>
                                        <option value="El paciente requiere por su estado...">El paciente requiere por su estado...</option>
                                    </select>
                                </div>
                                <div class="col-lg-12 col-md-12 form-group">
                                    <label for="txtObservacion2"></label>
                                    <div id="selDiv">
                                        <textarea  id="txtObservacion2" name="txtObservacion2" class='form-control'><%= ViewData["Observacion"] %></textarea>
                                    </div>
                                    <div class="invalid-feedback">Seleccione una opción</div>
                                    <br />
                                </div>
                            </div>
                            <div id="divEstado14">
                                <div class="col-lg-6 col-md-6 form-group">
                                    <input id="txtFechaCirugiaMandar" placeholder="Fecha de cirugia" name="txtFechaCirugiaMandar" />
                                    <script>
                                        $('#txtFechaCirugiaMandar').datepicker({
                                            uiLibrary: 'bootstrap4',
                                            format: 'dd/mm/yyyy'
                                        });
                                    </script>
                                </div>
                            </div>
                            <div id="divEstado15">
                                <div class="col-lg-6 col-md-6 form-group">
                                    <label for="txtObservacion3"></label>
                                    <label style="color:black"> Observación Cuidados Preoperatorios </label>
                                    <div id="selDiv">
                                        <textarea  id="txtObservacion3" name="txtObservacion3" class='form-control'><%= ViewData["ObservacionCuidadoPreoperatorio"] %></textarea>
                                    </div>
                                    <div class="invalid-feedback">Seleccione una opción</div>
                                </div>
                            </div>
                            <div id="divEstado17">
                                <div class="col-lg-6 col-md-6 form-group">
                                    <label for="txtFechaReagendarCirugia"></label>
                                    <label style="color:black"> Fecha para reagendar cirugía</label>
                                    <input id="txtFechaReagendarCirugia" placeholder="Nueva fecha " name="txtFechaReagendarCirugia" />
                                    <script>
                                        $('#txtFechaReagendarCirugia').datepicker({
                                            uiLibrary: 'bootstrap4',
                                            format: 'dd/mm/yyyy'
                                        });
                                    </script>
                                </div>
                            </div>
                            <div id="divEstado21">
                                <div class="row">
                                <div class="col-12">
                                    <label for="txtFotos"></label>
                                <div class="row">
                                    <div class="col">
                                        <h4 style="color: #858585; font-family: 'Open Sans', sans-serif; font-style: initial !important">Fotografías 1 mes después</h4>
                                    </div>
                                </div>                                  
                                    <div id="carouselExampleIndicators3" class="carousel slide" data-ride="carousel">
                                        <ol class="carousel-indicators">
                                        <li data-target="#carouselExampleIndicators3" data-slide-to="0" class="active"></li>
                                        <li data-target="#carouselExampleIndicators3" data-slide-to="1"></li>
                                        <li data-target="#carouselExampleIndicators3" data-slide-to="2"></li>
                                        <li data-target="#carouselExampleIndicators3" data-slide-to="3"></li>
                                        <li data-target="#carouselExampleIndicators3" data-slide-to="4"></li>
         
                                        </ol>
                                        <div class="carousel-inner" style="border-radius: 7px;border-color: #ededed;border-style: solid;">
                                        <div class="carousel-item active">
                                            <img class="d-block w-100 imgen-carrusel" src="<%= ViewData["Foto1Mes1"]%>" alt="First slide">
                                          <div class="carousel-caption d-none d-md-block">
                                            <h5>Desde arriba</h5>
                                            <p>imagen1.jpg</p>
                                          </div>
                                        </div>
                                        <div class="carousel-item">
                                            <img class="d-block w-100 imgen-carrusel" src="<%= ViewData["Foto2Mes1"]%>" alt="Second slide">
                                             <div class="carousel-caption d-none d-md-block">
                                                <h5>Perfil izquierdo</h5>
                                                <p>imagen2.jpg</p>
                                            </div>
                                        </div>
                                        <div class="carousel-item">
                                            <img class="d-block w-100 imgen-carrusel" src="<%= ViewData["Foto3Mes1"]%>" alt="Third slide">
                                            <div class="carousel-caption d-none d-md-block">
                                                <h5>Perfil Derecho</h5>
                                                <p>imagen3.jpg</p>
                                            </div>
                                        </div>
                                        <div class="carousel-item">
                                            <img class="d-block w-100 imgen-carrusel" src="<%= ViewData["Foto4Mes1"]%>" alt="Third slide">
                                             <div class="carousel-caption d-none d-md-block">
                                                <h5>De atrás</h5>
                                                <p>imagen4.jpg</p>
                                            </div>
                                        </div>
                                        <div class="carousel-item">
                                            <img class="d-block w-100 imgen-carrusel" src="<%= ViewData["Foto5Mes1"]%>" alt="Third slide">
                                            <div class="carousel-caption d-none d-md-block">
                                                <h5>De frente</h5>
                                                <p>imagen5.jpg</p>
                                            </div>
                                        </div>
                                        </div>
                                        <a class="carousel-control-prev" href="#carouselExampleIndicators3" role="button" data-slide="prev">
                                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                        <span class="sr-only">Previous</span>
                                        </a>
                                        <a class="carousel-control-next" href="#carouselExampleIndicators3" role="button" data-slide="next">
                                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                        <span class="sr-only">Next</span>
                                        </a>
                                    </div>
                           
                                    <br />
                                </div>
                            </div>
                            </div>
                            <div id="divEstado23">
                                <div class="row">
                                <div class="col-12">
                                    <label for="txtFotos"></label>
                                <div class="row">
                                    <div class="col">
                                        <h4 style="color: #858585; font-family: 'Open Sans', sans-serif; font-style: initial !important">Fotografías 3 meses después</h4>
                                    </div>
                                </div>                                  
                                    <div id="carouselExampleIndicators4" class="carousel slide" data-ride="carousel">
                                        <ol class="carousel-indicators">
                                        <li data-target="#carouselExampleIndicators4" data-slide-to="0" class="active"></li>
                                        <li data-target="#carouselExampleIndicators4" data-slide-to="1"></li>
                                        <li data-target="#carouselExampleIndicators4" data-slide-to="2"></li>
                                        <li data-target="#carouselExampleIndicators4" data-slide-to="3"></li>
                                        <li data-target="#carouselExampleIndicators4" data-slide-to="4"></li>
         
                                        </ol>
                                        <div class="carousel-inner" style="border-radius: 7px;border-color: #ededed;border-style: solid;">
                                        <div class="carousel-item active">
                                            <img class="d-block w-100 imgen-carrusel" src="<%= ViewData["Foto1Mes3"]%>" alt="First slide">
                                          <div class="carousel-caption d-none d-md-block">
                                            <h5>Desde arriba</h5>
                                            <p>imagen1.jpg</p>
                                          </div>
                                        </div>
                                        <div class="carousel-item">
                                            <img class="d-block w-100 imgen-carrusel" src="<%= ViewData["Foto2Mes3"]%>" alt="Second slide">
                                             <div class="carousel-caption d-none d-md-block">
                                                <h5>Perfil izquierdo</h5>
                                                <p>imagen2.jpg</p>
                                            </div>
                                        </div>
                                        <div class="carousel-item">
                                            <img class="d-block w-100 imgen-carrusel" src="<%= ViewData["Foto3Mes3"]%>" alt="Third slide">
                                            <div class="carousel-caption d-none d-md-block">
                                                <h5>Perfil Derecho</h5>
                                                <p>imagen3.jpg</p>
                                            </div>
                                        </div>
                                        <div class="carousel-item">
                                            <img class="d-block w-100 imgen-carrusel" src="<%= ViewData["Foto4Mes3"]%>" alt="Third slide">
                                             <div class="carousel-caption d-none d-md-block">
                                                <h5>De atrás</h5>
                                                <p>imagen4.jpg</p>
                                            </div>
                                        </div>
                                        <div class="carousel-item">
                                            <img class="d-block w-100 imgen-carrusel" src="<%= ViewData["Foto5Mes3"]%>" alt="Third slide">
                                            <div class="carousel-caption d-none d-md-block">
                                                <h5>De frente</h5>
                                                <p>imagen5.jpg</p>
                                            </div>
                                        </div>
                                        </div>
                                        <a class="carousel-control-prev" href="#carouselExampleIndicators4" role="button" data-slide="prev">
                                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                        <span class="sr-only">Previous</span>
                                        </a>
                                        <a class="carousel-control-next" href="#carouselExampleIndicators4" role="button" data-slide="next">
                                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                        <span class="sr-only">Next</span>
                                        </a>
                                    </div>
                           
                                    <br />
                                </div>
                            </div>
                            </div>
                            <div id="divEstado25">
                                <div class="row">
                                <div class="col-12">
                                    <label for="txtFotos"></label>
                                <div class="row">
                                    <div class="col">
                                        <h4 style="color: #858585; font-family: 'Open Sans', sans-serif; font-style: initial !important">Fotografías 3 meses después</h4>
                                    </div>
                                </div>                                  
                                    <div id="carouselExampleIndicators5" class="carousel slide" data-ride="carousel">
                                        <ol class="carousel-indicators">
                                        <li data-target="#carouselExampleIndicators5" data-slide-to="0" class="active"></li>
                                        <li data-target="#carouselExampleIndicators5" data-slide-to="1"></li>
                                        <li data-target="#carouselExampleIndicators5" data-slide-to="2"></li>
                                        <li data-target="#carouselExampleIndicators5" data-slide-to="3"></li>
                                        <li data-target="#carouselExampleIndicators5" data-slide-to="4"></li>
         
                                        </ol>
                                        <div class="carousel-inner" style="border-radius: 7px;border-color: #ededed;border-style: solid;">
                                        <div class="carousel-item active">
                                            <img class="d-block w-100 imgen-carrusel" src="<%= ViewData["Foto1Mes6"]%>" alt="First slide">
                                          <div class="carousel-caption d-none d-md-block">
                                            <h5>Desde arriba</h5>
                                            <p>imagen1.jpg</p>
                                          </div>
                                        </div>
                                        <div class="carousel-item">
                                            <img class="d-block w-100 imgen-carrusel" src="<%= ViewData["Foto2Mes6"]%>" alt="Second slide">
                                             <div class="carousel-caption d-none d-md-block">
                                                <h5>Perfil izquierdo</h5>
                                                <p>imagen2.jpg</p>
                                            </div>
                                        </div>
                                        <div class="carousel-item">
                                            <img class="d-block w-100 imgen-carrusel" src="<%= ViewData["Foto3Mes6"]%>" alt="Third slide">
                                            <div class="carousel-caption d-none d-md-block">
                                                <h5>Perfil Derecho</h5>
                                                <p>imagen3.jpg</p>
                                            </div>
                                        </div>
                                        <div class="carousel-item">
                                            <img class="d-block w-100 imgen-carrusel" src="<%= ViewData["Foto4Mes6"]%>" alt="Third slide">
                                             <div class="carousel-caption d-none d-md-block">
                                                <h5>De atrás</h5>
                                                <p>imagen4.jpg</p>
                                            </div>
                                        </div>
                                        <div class="carousel-item">
                                            <img class="d-block w-100 imgen-carrusel" src="<%= ViewData["Foto5Mes6"]%>" alt="Third slide">
                                            <div class="carousel-caption d-none d-md-block">
                                                <h5>De frente</h5>
                                                <p>imagen5.jpg</p>
                                            </div>
                                        </div>
                                        </div>
                                        <a class="carousel-control-prev" href="#carouselExampleIndicators5" role="button" data-slide="prev">
                                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                        <span class="sr-only">Previous</span>
                                        </a>
                                        <a class="carousel-control-next" href="#carouselExampleIndicators5" role="button" data-slide="next">
                                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                        <span class="sr-only">Next</span>
                                        </a>
                                    </div>
                           
                                    <br />
                                </div>
                            </div>
                            </div>
                            <div id="divEstado33">
                                <div class="row">
                                    <div class="col-4">
                                        <label style="color:black"> Foto primer mes </label>
                                        <img id="imagen1MesSeleccionado" class="d-block w-100" src="<%= ViewData["Foto1Mes6"]%>">
                                        <select id="foto1mes" name="foto1mes" class="form-control">
                                            <%= ViewData["opcionfoto1"] %>
                                        </select>
                                    </div>
                                    <div class="col-4">
                                    <label style="color:black"> Foto tercer mes </label>
                                        <img id="imagen3MesSeleccionado" class="d-block w-100" src="<%= ViewData["Foto1Mes6"]%>">
                                    <select id="foto3mes" name="foto3mes" class="form-control">
                                        <%= ViewData["opcionfoto3"] %>
                                    </select>
                                    </div>
                                    <div class="col-4">
                                    <label style="color:black"> Foto sexto mes </label>
                                    <img id="imagen6MesSeleccionado" class="d-block w-100" src="<%= ViewData["Foto1Mes6"]%>">
                                    <select id="foto6mes" name="foto4mes" class="form-control">
                                        <%= ViewData["opcionfoto6"] %>
                                    </select>
                                    </div>
                                    <script>
                                        $(document).ready(function () {
                                            $("#foto1mes").change(function () {
                                                var id = $(this).children(":selected").attr("id");
                                                console.log("id" + id)
                                                $("#imagen1MesSeleccionado").attr("src", id);
                                            });

                                            $("#foto3mes").change(function () {
                                                var id = $(this).children(":selected").attr("id");
                                                console.log("id" + id)
                                                $("#imagen3MesSeleccionado").attr("src", id);
                                            });

                                            $("#foto6mes").change(function () {
                                                var id = $(this).children(":selected").attr("id");
                                                console.log("id" + id)
                                                $("#imagen6MesSeleccionado").attr("src", id);
                                            });

                                        });
                                    </script>
                                </div>
                                <br />
                            </div>
                            <div id="divEstado27">
                                <div class="col-lg-6 col-md-6 form-group">
                                    <label style="color:black"> Nueva fecha de evaluación </label>
                                    <input id="txtFechaEvaluacion2" placeholder="Seleccionar fecha" name="txtFechaEvaluacion2" value="<%= ViewData["FechaEvaluacionOnceMeses"] %>" />
                                    <script>
                                        $('#txtFechaEvaluacion2').datepicker({
                                            uiLibrary: 'bootstrap4',
                                            format: 'dd/mm/yyyy'
                                        });
                                    </script>
                                </div>
                            </div>
                            <div id="divEstado29">
                                <div class="col-lg-6 col-md-6 form-group">
                                    <label style="color:black"> Observación </label>
                                    <select id="chxObservacion4" name="chxObservacion4" class="form-control">
                                        <option value="">--Comentarios--</option>
                                        <option value="No se puede calcular bien el numero de foliculos">No se puede calcular bien el numero de foliculos</option>
                                        <option value="El paciente requiere por su estado...">El paciente requiere por su estado...</option>
                                    </select>
                                </div>
                                <div class="col-lg-12 col-md-12 form-group">
                                    <label for="txtObservacion4"></label>
                                    <div id="selDiv">
                                        <textarea  id="txtObservacion4" name="txtObservacion4" class='form-control'><%= ViewData["Observacion"] %></textarea>
                                    </div>
                                    <div class="invalid-feedback">Seleccione una opción</div>
                                    <br />
                                </div>
                            </div>
                            <div id="divEstado30">
                                <div class="col-lg-6 col-md-6 form-group">
                                    <input id="txtFechaCirugiaGarantia" placeholder="Fecha cirugía garantía" name="txtFechaCirugiaGarantia" value="<%= ViewData["FechaCirugíaGarantía"] %>" />
                                    <script>
                                        $('#txtFechaCirugiaGarantia').datepicker({
                                            uiLibrary: 'bootstrap4',
                                            format: 'dd/mm/yyyy'
                                        });
                                    </script>
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