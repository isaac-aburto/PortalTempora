<%@ Page Title="" Language="C#" MasterPageFile="~/Views/DisenoBootstrap3.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>


<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
            <script src="https://unpkg.com/gijgo@1.9.13/js/gijgo.min.js" type="text/javascript"></script>
    <link href="https://unpkg.com/gijgo@1.9.13/css/gijgo.min.css" rel="stylesheet" type="text/css" />
    <script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.11.1/jquery.validate.min.js"></script>
<%--    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.24/css/dataTables.bootstrap.min.css">--%>
      <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<%--<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>--%>
<%--<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.24/js/dataTables.bootstrap.min.js"></script>
    <script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.11.1/jquery.validate.min.js"></script>--%>
    

    <script>
        $(document).ready(function () {
            $('#hola').selectpicker();
        })
    </script>
    
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
                            let descripcion = data.toString();
                            $("#txtDescripcion").val(res[0]);
                            

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
            var text = "a";
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
                        $("#txtDescripcion").val(res[0]);
                        $('#btnDescripcion').attr('title', res[0]).tooltip('dispose');
                        $('#btnDescripcion').tooltip('show');
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
                    //var text = $('#txtDescripcion').val();
                    //console.log("TEXT2: " + text)
                    //$('[data-toggle="tooltip"]').attr("title", text);
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
        .img{
    margin: 8px auto;
    border-radius: 5px;
    border: 0px solid #999;
    padding: 0px;
    width: 266px;
    height: 220px;
  background-size: 100% 100%;
  background-repeat:no-repeat;
  background:url(../img/imagen.jpg);
  background-size: cover;
  }
.img img{
  width: 100%;
}
@media all and (min-width: 500px) and (max-width: 1000px)
{  
.img{
    margin: 8px auto;
    border-radius: 5px;
    border: 0px solid #999;
    padding: 0px;
    width: 266px;
    height: 220px;
  background-size: 100% 100%;
  background-repeat:no-repeat;
  background:url(../img/imagen.jpg);
  background-size: cover;
  
  }
}
.img img{
   width:100%;
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
                    <input hidden id="idSolicitud" name="idSolicitud" value="<%= ViewData["idSolicitud"]%>"/>
                    <input hidden id="Guardado" name="Guardado" value="<%= ViewData["Guardado"]%>"/>
                    <input hidden id="Enviado" name="Enviado" value="<%= ViewData["Enviado"]%>"/>
                    <div class="row">

                        <div class="card-body" style="    margin-top: -5pc;">
                        <div class="card border-left-warning shadow ">
                        <div class="card-body">
                            <div id="alertaGuardado" class="alert alert-success alert-dismissible fade show" role="alert">
                              <strong>Guardado con éxito</strong>.
                              <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                              </button>
                            </div>
                            <div id="alertaEnviado" class="alert alert-success alert-dismissible fade show" role="alert">
                              <strong>Enviado con éxito</strong>.
                              <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                              </button>
                            </div>
                            <%--  --%>
                            <script>
                                $(document).ready(function () {
                                    console.log($("#Guardado").val())                                 
                                    if ($("#Guardado").val() == "True") {
                                        $("#alertaGuardado").alert()
                                    }
                                    else {
                                        $("#alertaGuardado").alert('close')
                                    }

                                    if ($("#Enviado").val() == "True") {
                                        $("#alertaEnviado").alert()
                                    }
                                    else {
                                        $("#alertaEnviado").alert('close')
                                    }

                                    //Ajax para cambiar el estado
                                    var id = $("#idSolicitud").val();
                                    console.log("Ahora quiero cambiar alertas" + id)
                                    $.ajax({
                                        url: '<%: Url.Content("~/Solicitudes/CambiarAlertas/") %>',
                                        data: { id: id },
                                            cache: false,
                                            type: "POST",
                                            success: function (data) {
                                                if (data != "") {
                                                    console.log(data);
                                                }

                                            }
                                        });


                                });
                            </script>
                            <div style="text-align: center;">
                                <h1 style="color: #858585; font-family: 'Open Sans', sans-serif; font-style: inherit;">Solicitud N°<%= ViewData["idSolicitud"]%> </h1>
                                <h1 style="color: #b8c517; font-style: inherit;"><%= ViewData["NombreCompleto"]  %></h1>
                                <h6 style="color: #858585; font-family: 'Open Sans', sans-serif; font-style: inherit;">Fecha Solicitud: <%= ViewData["FechaSolicitud"] %></h6>
                                <h6 style="color: #858585; font-family: 'Open Sans', sans-serif; font-style: inherit;">Estado: <%= ViewData["EstadoSolicitud"] %></h6>
                            </div>
                            <div class="row">
                                    <div class="col">
                                        <h4 style="color: #858585; font-family: 'Open Sans', sans-serif; font-style: initial !important">Información</h4>
                                        <h6 style="color: #858585;font-family: -webkit-pictograph; font-style: initial !important">Formulario y datos del paciente.</h6>
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
<%--                                <div class="col-4">
                                    <label for="txtTelefono"></label>
                                    <label style="color: black">Teléfono </label>
                                    <div id="selDiv">
                                        <input disabled id="txtTelefono" name="txtTelefono" type='text' class='form-control' value='<%= ViewData["Telefono"] %>'>
                                    </div>
                                    <div class="invalid-feedback">Seleccione una opción</div>
                                    <br />
                                </div>--%>
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
                                        <h6 style="color: #858585;font-family: -webkit-pictograph; font-style: initial !important">Imágenes del paciente.</h6>
                                    </div>
                                    <div class="col" style="    text-align: end;">
                                        <a id="btnFotografias" style="color: #858585; font-family: 'Open Sans', sans-serif; font-style: initial !important" data-toggle="collapse" data-target="#collapseExample2" role="button" aria-expanded="false" aria-controls="collapseExample2"><i style="color: #C6D41D;     font-size: 31px;" id="icon2" class="fa fa-angle-down"></i></a>
                                    </div>
                                </div>                                  
                                    <hr />


                                    <div class="collapse" id="collapseExample2">
                                    

                                        
                                    <div  class="text-center" style="margin: 5px;"><h5 id="txtImages" style="color: #a7a7a7;">Desde arriba</h5></div>
                                    <img id="fotoMaestra" style="padding-bottom: 20px;" class="d-block w-100 imgen-carrusel" src="<%= ViewData["Foto1"]%>" alt="First slide" onclick="window.open(this.src)">
                                    <br />
                                    <div style=" text-align: center;">
                                        <br />
                                        <div class="row">
                                            <br />
                                            <div class="col">
                                                <img id="foto1" style="height: 140px;" class="d-block w-100 imgen-carrusel" src="<%= ViewData["Foto1"]%>" alt="First slide">
                                            </div>
                                            <div class="col">
                                                <img id="foto2" style="height: 140px;" class="d-block w-100 imgen-carrusel" src="<%= ViewData["Foto2"]%>" alt="First slide">
                                            </div>
                                            <div class="col">
                                                <img id="foto3" style="height: 140px;" class="d-block w-100 imgen-carrusel" src="<%= ViewData["Foto3"]%>" alt="First slide">
                                            </div>
                                            <div class="col">
                                                <img id="foto4" style="height: 140px;" class="d-block w-100 imgen-carrusel" src="<%= ViewData["Foto4"]%>" alt="First slide">
                                            </div>
                                            <div class="col">
                                                <img id="foto5" style="height: 140px;" class="d-block w-100 imgen-carrusel" src="<%= ViewData["Foto5"]%>" alt="First slide">
                                            </div>
                                        </div>
                                    </div>
                                    <script>
                                        $(document).ready(function () {


                                            $("#foto1").css('border', '2px');
                                            $("#foto1").css('border-style', 'solid');
                                            $("#foto1").css('border-color', '#ccdd0e');


                                            $("#foto1").on("click", function () {
                                                var src = $('#foto1').attr('src');
                                                $("#fotoMaestra").attr("src", src);

                                                $("#txtImages").text("Desde arriba");

                                                $("#foto1").css('border', '2px');
                                                $("#foto1").css('border-style', 'solid');
                                                $("#foto1").css('border-color', '#ccdd0e');

                                                $("#foto2").css('border', '0px');
                                                $("#foto2").css('border-style', 'solid');
                                                $("#foto2").css('border-color', '#ccdd0e');

                                                $("#foto3").css('border', '0px');
                                                $("#foto3").css('border-style', 'solid');
                                                $("#foto3").css('border-color', '#ccdd0e');

                                                $("#foto4").css('border', '0px');
                                                $("#foto4").css('border-style', 'solid');
                                                $("#foto4").css('border-color', '#ccdd0e');

                                                $("#foto5").css('border', '0px');
                                                $("#foto5").css('border-style', 'solid');
                                                $("#foto5").css('border-color', '#ccdd0e');
                                            });
                                            $("#foto2").on("click", function () {
                                                var src = $('#foto2').attr('src');
                                                $("#fotoMaestra").attr("src", src);

                                                $("#txtImages").text("Perfil izquierdo");

                                                $("#foto1").css('border', '0px');
                                                $("#foto1").css('border-style', 'solid');
                                                $("#foto1").css('border-color', '#ccdd0e');

                                                $("#foto2").css('border', '2px');
                                                $("#foto2").css('border-style', 'solid');
                                                $("#foto2").css('border-color', '#ccdd0e');

                                                $("#foto3").css('border', '0px');
                                                $("#foto3").css('border-style', 'solid');
                                                $("#foto3").css('border-color', '#ccdd0e');

                                                $("#foto4").css('border', '0px');
                                                $("#foto4").css('border-style', 'solid');
                                                $("#foto4").css('border-color', '#ccdd0e');

                                                $("#foto5").css('border', '0px');
                                                $("#foto5").css('border-style', 'solid');
                                                $("#foto5").css('border-color', '#ccdd0e');

                                            });
                                            $("#foto3").on("click", function () {
                                                var src = $('#foto3').attr('src');
                                                $("#fotoMaestra").attr("src", src);

                                                $("#txtImages").text("Perfil Derecho");

                                                $("#foto1").css('border', '0px');
                                                $("#foto1").css('border-style', 'solid');
                                                $("#foto1").css('border-color', '#ccdd0e');

                                                $("#foto2").css('border', '0px');
                                                $("#foto2").css('border-style', 'solid');
                                                $("#foto2").css('border-color', '#ccdd0e');

                                                $("#foto3").css('border', '2px');
                                                $("#foto3").css('border-style', 'solid');
                                                $("#foto3").css('border-color', '#ccdd0e');

                                                $("#foto4").css('border', '0px');
                                                $("#foto4").css('border-style', 'solid');
                                                $("#foto4").css('border-color', '#ccdd0e');

                                                $("#foto5").css('border', '0px');
                                                $("#foto5").css('border-style', 'solid');
                                                $("#foto5").css('border-color', '#ccdd0e');

                                            });
                                            $("#foto4").on("click", function () {
                                                var src = $('#foto4').attr('src');
                                                $("#fotoMaestra").attr("src", src);

                                                $("#txtImages").text("De Atrás");

                                                $("#foto1").css('border', '0px');
                                                $("#foto1").css('border-style', 'solid');
                                                $("#foto1").css('border-color', '#ccdd0e');

                                                $("#foto2").css('border', '0px');
                                                $("#foto2").css('border-style', 'solid');
                                                $("#foto2").css('border-color', '#ccdd0e');

                                                $("#foto3").css('border', '0px');
                                                $("#foto3").css('border-style', 'solid');
                                                $("#foto3").css('border-color', '#ccdd0e');

                                                $("#foto4").css('border', '2px');
                                                $("#foto4").css('border-style', 'solid');
                                                $("#foto4").css('border-color', '#ccdd0e');

                                                $("#foto5").css('border', '0px');
                                                $("#foto5").css('border-style', 'solid');
                                                $("#foto5").css('border-color', '#ccdd0e');
                                            });
                                            $("#foto5").on("click", function () {
                                                var src = $('#foto5').attr('src');
                                                $("#fotoMaestra").attr("src", src);

                                                $("#txtImages").text("De frente");

                                                $("#foto1").css('border', '0px');
                                                $("#foto1").css('border-style', 'solid');
                                                $("#foto1").css('border-color', '#ccdd0e');

                                                $("#foto2").css('border', '0px');
                                                $("#foto2").css('border-style', 'solid');
                                                $("#foto2").css('border-color', '#ccdd0e');

                                                $("#foto3").css('border', '0px');
                                                $("#foto3").css('border-style', 'solid');
                                                $("#foto3").css('border-color', '#ccdd0e');

                                                $("#foto4").css('border', '0px');
                                                $("#foto4").css('border-style', 'solid');
                                                $("#foto4").css('border-color', '#ccdd0e');

                                                $("#foto5").css('border', '2px');
                                                $("#foto5").css('border-style', 'solid');
                                                $("#foto5").css('border-color', '#ccdd0e');
                                            });
                                        });
                                    </script>


<%--                                    <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                                        <ol class="carousel-indicators">
                                        <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                                        <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                                        <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                                        <li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
                                        <li data-target="#carouselExampleIndicators" data-slide-to="4"></li>
         
                                        </ol>
                                        <div class="carousel-inner">
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
                                    </div>--%>
                                        </div>
                                    <br />
                                </div>
                            </div>
                            
                            
                            <%-- Gestion --%>
                            <div class="row">
                                <div class="col">
                                    <h4 style="color: #858585; font-family: 'Open Sans', sans-serif; font-style: initial !important">Gestión<span id="btnGestion" class="d-inline-block" tabindex="0" data-toggle="tooltip" data-placement="right" title="Por favor, seleccione estados según su criterio para el avance correcto del paciente.">
                                        <button style="margin-top: -5px;pointer-events: none;background-color: white;border-color: white;" class="btn btn-primary" type="button" disabled><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="18" height="18"><path d="M13 7.5a1 1 0 11-2 0 1 1 0 012 0zm-3 3.75a.75.75 0 01.75-.75h1.5a.75.75 0 01.75.75v4.25h.75a.75.75 0 010 1.5h-3a.75.75 0 010-1.5h.75V12h-.75a.75.75 0 01-.75-.75z"></path><path fill-rule="evenodd" d="M12 1C5.925 1 1 5.925 1 12s4.925 11 11 11 11-4.925 11-11S18.075 1 12 1zM2.5 12a9.5 9.5 0 1119 0 9.5 9.5 0 01-19 0z"></path></svg></button>
                                    </span></h4>
                                    <h6 style="color: #858585;font-family: -webkit-pictograph; font-style: initial !important">Control de estados para el paciente.</h6>
                                    
                                    <script>
                                        $(document).ready(function () {
                                            $('#btnGestion').tooltip()
                                        });
                                    </script>
                                                
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
                                        <script>
                                            $(function () {
                                                //$('#btnDescripcion').tooltip()
                                                $('#btnDescripcion').tooltip()
                                                //$("#txtEstado").change(function () {
                                                //    console.log("HOOOOOOOOOOOOOOOOOOLA")
                                                //    var text = $('#txtDescripcion').val();
                                                //    console.log("TEXT: " + text)
                                                    
                                                //});
                                                
                                                
                                            })

                                        </script>
                                       <span id="btnDescripcion" class="d-inline-block" tabindex="0" data-toggle="tooltip" data-placement="right"  title="Disabled tooltip" style="margin-top: 28px;">
                                            <button style="pointer-events: none;background-color: white;border-color: white;" class="btn btn-primary"  type="button" disabled><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24"><path d="M13 7.5a1 1 0 11-2 0 1 1 0 012 0zm-3 3.75a.75.75 0 01.75-.75h1.5a.75.75 0 01.75.75v4.25h.75a.75.75 0 010 1.5h-3a.75.75 0 010-1.5h.75V12h-.75a.75.75 0 01-.75-.75z"></path><path fill-rule="evenodd" d="M12 1C5.925 1 1 5.925 1 12s4.925 11 11 11 11-4.925 11-11S18.075 1 12 1zM2.5 12a9.5 9.5 0 1119 0 9.5 9.5 0 01-19 0z"></path></svg></button>
                                        </span>
                                        <label for="txtDescripcion"></label>
                                        <label hidden style="color:black"> Descripción Estado</label>
                                        <div hidden id="selDiv">
                                            <textarea  disabled id="txtDescripcion" name="txtDescripcion" class='form-control'><%= ViewData["Observacion"] %></textarea>
                                        </div>
                                        <div class="invalid-feedback">Seleccione una opción</div>
                                        <br />
                                    </div>
                                </div>
                                <div id="divEstados">
                                    <div class="row">
                                    <div class="col">

<%--                                            <label for="txtTecnica"></label>
                                                Técnica
                                                <label style="color: white"> *</label>
                                                <select name="txtTecnica" id="txtTecnica" class="selectpicker col-md-12" data-live-search="true" multiple data-actions-box="true" required style="background-color: white;border-color: darkgrey;">
                                                    <%= ViewData["opcionesTecnicas"] %>
                                                </select>--%>
                                       <style>
                                           .bootstrap-select .dropdown-toggle .filter-option-inner-inner {
                                                overflow: hidden !important;
                                                background-color: white !important;
                                            }
                                           .bootstrap-select[class*=col-] .dropdown-toggle {
                                                width: 100% !important;
                                                background-color: white !important;
                                                border-color: #ced4da !important;
                                            }
                                           .bootstrap-select .dropdown-menu {
                                                min-width: 94% !important;
                                                -webkit-box-sizing: border-box !important;
                                                -moz-box-sizing: border-box !important;
                                                box-sizing: border-box !important;
                                            }
                                           .bs-searchbox .form-control {
                                                margin-bottom: 0 !important;
                                                width: 95% !important;
                                                float: none !important;
                                            }
                                           .bootstrap-select:not(.input-group-btn), .bootstrap-select[class*=col-] {
                                                float: none;
                                                display: inline-block;
                                                margin-left: 0;
                                                width: 560px !important;
                                                margin-left: -16px !important; 
                                            }
                                       </style>
<%--                                        <label for="txtTecnica"></label>
                                        <label style="color: black">Técnica </label>
                                        <div id="selDiv">
                                            <select name="txtTecnica" id="txtTecnica" class="form-control" >
                                                <%= ViewData["opcionesTecnicas"] %>
                                            </select>                                    </div>
                                        <div class="invalid-feedback">Seleccione una opción</div>--%>
                                        <br />
                                    </div>
                                    <div class="col">
                                        <label for="txtZona"></label>
                                        <label style="color: black">Zona </label>
                                        <div id="selDiv" style="margin-left: -2pc;">
                                            <select name="txtZona" id="txtZona" class="form-control" >
                                                <%= ViewData["opcionesZonas"] %>
                                            </select>                                      </div>
                                        <div class="invalid-feedback">Seleccione una opción</div>
                                        <br />
                                    </div>
                                </div>
<%--                                        <div class="row">
                                    <div class="col">


                                    <select id="multiple" class="selectpicker" multiple data-live-search="true">
                                      <option>Mustard</option>
                                      <option>Ketchup</option>
                                      <option>Relish</option>
                                    </select>
                                    <script>
                                        $(document).ready(function () {
                                            $('#multiple').selectpicker();
                                        });
                                    </script>
                                </div>
                                    </div>--%>
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
                                        <div class="img">
                                        <img id="imagen1MesSeleccionado" class="d-block w-100" src="<%= ViewData["Foto1Mes6"]%>">
                                            </div>
                                        <select id="foto1mes" name="foto1mes" class="form-control">
                                            <%= ViewData["opcionfoto1"] %>
                                        </select>
                                    </div>
                                    <div class="col-4">
                                    <label style="color:black"> Foto tercer mes </label>
                                        <div class="img">
                                        <img id="imagen3MesSeleccionado" class="d-block w-100" src="<%= ViewData["Foto1Mes6"]%>">
                                            </div>
                                    <select id="foto3mes" name="foto3mes" class="form-control">
                                        <%= ViewData["opcionfoto3"] %>
                                    </select>
                                    </div>
                                    <div class="col-4">
                                    <label style="color:black"> Foto sexto mes </label>
                                        <div class="img">
                                    <img id="imagen6MesSeleccionado" class="d-block w-100" src="<%= ViewData["Foto1Mes6"]%>">
                                            </div>
                                    <select id="foto6mes" name="foto6mes" class="form-control">
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