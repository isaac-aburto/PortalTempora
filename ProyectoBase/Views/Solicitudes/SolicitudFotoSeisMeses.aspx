<%@ Page Title="" Language="C#" MasterPageFile="~/Views/DisenoBootstrap3.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>


<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
        <%-- Script cámara --%>
    <script type="text/javascript">
        $(function () {
            Webcam.set({
                width: 320,
                height: 240,
                image_format: 'jpeg',
                jpeg_quality: 90,
                force_flash: false
            });
            Webcam.attach('#idwebcam');
            //Imagen capturada
            $("#btnCapturar1").click(function () {
                Webcam.snap(function (data_uri) {
                    // display results in page
                    var x = "300";
                    var y = "100";
                    document.getElementById('idcaptured').innerHTML =
                        '<img id="fotografia1" name="fotografia1" width="320" height="185" src="' + data_uri + '"/>';
                    console.log(data_uri)
                    document.getElementById('fotoArriba').value = data_uri;
                });

            });
            Webcam.attach('#idwebcam2');
            $("#btnCapturar2").click(function () {
                Webcam.snap(function (data_uri2) {
                    // display results in page
                    var x = "300";
                    var y = "100";
                    document.getElementById('idcaptured2').innerHTML =
                        '<img id="fotografia2" name="fotografia2" width="320" height="185" src="' + data_uri2 + '"/>';
                    console.log(data_uri2)
                    document.getElementById('fotoIzquierdo').value = data_uri2;
                });
            });
            Webcam.attach('#idwebcam3');
            $("#btnCapturar3").click(function () {
                Webcam.snap(function (data_uri3) {
                    // display results in page
                    var x = "300";
                    var y = "100";
                    document.getElementById('idcaptured3').innerHTML =
                        '<img id="fotografia3" name="fotografia3" width="320" height="185" src="' + data_uri3 + '"/>';
                    console.log(data_uri3)
                    document.getElementById('fotoDerecho').value = data_uri3;
                });
            });
            Webcam.attach('#idwebcam4');
            $("#btnCapturar4").click(function () {
                Webcam.snap(function (data_uri4) {
                    // display results in page
                    var x = "300";
                    var y = "100";
                    document.getElementById('idcaptured4').innerHTML =
                        '<img id="fotografia4" name="fotografia4" width="320" height="185" src="' + data_uri4 + '"/>';
                    console.log(data_uri4)
                    document.getElementById('fotoAtras').value = data_uri4;
                });
            });
            Webcam.attach('#idwebcam5');
            $("#btnCapturar5").click(function () {
                Webcam.snap(function (data_uri5) {
                    // display results in page
                    var x = "300";
                    var y = "100";
                    document.getElementById('idcaptured5').innerHTML =
                        '<img id="fotografia5" name="fotografia5" width="320" height="185" src="' + data_uri5 + '"/>';
                    console.log(data_uri5)
                    document.getElementById('fotoFrente').value = data_uri5;
                });
            });

        });
    </script>
    <script>
        $(document).ready(function () {
            $("#btnModalGuardar1").click(function () {
                console.log("hice click");
                console.log($('#fotografia').attr('src'));
                var file = document.getElementById("fotografia").src;

                var formdata = new FormData();
                formdata.append("fotografia", file);
            });
        });
    </script>
    <script>
        $(document).ready(function () {

            //  CAMARA 1 //
            $("#divCamara1").hide();
            $("#Camara1").click(function () {

                if ($("#Camara1").val() == "Activar Cámara") {
                    $("#divCamara1").show();
                    $("#Camara1").html('Desactivar Cámara');
                    $("#Camara1").css('background', "#8d9d17");
                    $("#Camara1").attr("value", "Desactivar Cámara");
                } else {
                    $("#divCamara1").hide();
                    $("#Camara1").html('Activar Cámara');
                    $("#Camara1").css('background', "#bad305");
                    $("#Camara1").attr("value", "Activar Cámara");
                    console.log("aaaa")
                }

            });
            $("#CerrarCamara1").click(function () {
                $("#divCamara1").hide();
                console.log("asdasdoo")
                $("#CerrarCamara1").html('Activar Cámara');
                $("#CerrarCamara1").css('background', "#bad305");
                $("#CerrarCamara1").attr("id", "Camara1");
                console.log("aaaa")
            });

            // CAMARA 2 //

            $("#divCamara2").hide();
            $("#Camara2").click(function () {
                if ($("#Camara2").val() == "Activar Cámara") {
                    $("#divCamara2").show();
                    $("#Camara2").html('Desactivar Cámara');
                    $("#Camara2").css('background', "#8d9d17");
                    $("#Camara2").attr("value", "Desactivar Cámara");
                } else {
                    $("#divCamara2").hide();
                    $("#Camara2").html('Activar Cámara');
                    $("#Camara2").css('background', "#bad305");
                    $("#Camara2").attr("value", "Activar Cámara");
                }
            });


            // CAMARA 3//
            $("#divCamara3").hide();
            $("#Camara3").click(function () {
                if ($("#Camara3").val() == "Activar Cámara") {
                    $("#divCamara3").show();
                    $("#Camara3").html('Desactivar Cámara');
                    $("#Camara3").css('background', "#8d9d17");
                    $("#Camara3").attr("value", "Desactivar Cámara");
                } else {
                    $("#divCamara3").hide();
                    $("#Camara3").html('Activar Cámara');
                    $("#Camara3").css('background', "#bad305");
                    $("#Camara3").attr("value", "Activar Cámara");
                }
            });

            // CAMARA 4 //

            $("#divCamara4").hide();
            $("#Camara4").click(function () {
                if ($("#Camara4").val() == "Activar Cámara") {
                    $("#divCamara4").show();
                    $("#Camara4").html('Desactivar Cámara');
                    $("#Camara4").css('background', "#8d9d17");
                    $("#Camara4").attr("value", "Desactivar Cámara");
                } else {
                    $("#divCamara4").hide();
                    $("#Camara4").html('Activar Cámara');
                    $("#Camara4").css('background', "#bad305");
                    $("#Camara4").attr("value", "Activar Cámara");
                }
            });

            // CAMARA 5 //

            $("#divCamara5").hide();
            $("#Camara5").click(function () {
                if ($("#Camara5").val() == "Activar Cámara") {
                    $("#divCamara5").show();
                    $("#Camara5").html('Desactivar Cámara');
                    $("#Camara5").css('background', "#8d9d17");
                    $("#Camara5").attr("value", "Desactivar Cámara");
                } else {
                    $("#divCamara5").hide();
                    $("#Camara5").html('Activar Cámara');
                    $("#Camara5").css('background', "#bad305");
                    $("#Camara5").attr("value", "Activar Cámara");
                }
            });
        });
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

      <!-- ======= Hero Section ======= -->
<main id="main">
    <br />
        <form style="background: #F7F7F7;"  method="post" enctype="multipart/form-data" id="formSolicitud" action="<%: Url.Content("~/Solicitudes/SolicitudFotoSeisMesesEnviar") %>">
            <section id="about" class="about" style="    margin-top: 5pc;">
                <div class="card border-secondary <%--border-0--%> shadow rounded-lg mt-5" style="margin-top: -55px; background-color: #e3e3e3;">
                    <div class="container" data-aos="fade-up">
                        <input hidden name="idSolicitud" value="<%= ViewData["idSolicitud"]%>"/>
                        <div class="row">
                            <div class="card-body" style="    margin-top: -5pc;">
                                <div class="card border-left-warning shadow ">
                                    <div class="card-body">
                                        <div style="text-align: center;">
                                            <h1 style="color: #858585; font-family: 'Open Sans', sans-serif; font-style: inherit;">Fotografías Seis Meses Desupúes Solicitud N°<%= ViewData["idSolicitud"]%> </h1>
                                            <h1 style="color: #b8c517; font-style: inherit;"><%= ViewData["NombreCompleto"]  %></h1>                                 
                                        </div>
                                        <hr />
                                        <div class="row" style="    padding: 2pc;">
                                            <p>Estas fotografías deben ser tomadas en un lugar con luz natural, sin flash y con la cámara trasera de su cámara o celular, no con la camara frontal, debido a que la calidad de imagen se ve afectada. Es ideal que otra persona le ayude a tomar estas fotografías, posicionandose a un metro de distacia y no en modo selfie.</p>
                                            <p>El siguiente esquema muestra los ángulos en que se debe fotografiar. En el caso de que su zona a evaluar sean las entradras, por favor tirar su cabello hacia atrás para poder apreciar de mejor manera su complicación.</p>
                                        </div>
                                        <div class="text-center">
                                            <div class="row">
                                                <div class="col-sm">
                                                    <button type="button" data-toggle="modal" data-target="#ModalArriba" style="background: #999999; border: 0; padding: 10px 35px; color: #fff; transition: 0.4s; border-radius: 50px;">Desde Arriba</button>
                                                    <input type="text"  id="fotoArriba" name="fotoArriba" value="" hidden/>
                                                </div>
                                                <div class="col-sm">
                                                    <button type="button" data-toggle="modal" data-target="#ModalIzquierdo" style="background: #999999; border: 0; padding: 10px 35px; color: #fff; transition: 0.4s; border-radius: 50px;">Perfil Izquierdo</button>
                                                    <input type="text"  id="fotoIzquierdo" name="fotoIzquierdo" value="" hidden/>
                                                </div>
                                                <div class="col-sm">
                                                    <button type="button" data-toggle="modal" data-target="#ModalDerecho" style="background: #999999; border: 0; padding: 10px 35px; color: #fff; transition: 0.4s; border-radius: 50px;">Perfil Derecho</button>
                                                    <input type="text"  id="fotoDerecho" name="fotoDerecho" value="" hidden/>
                                                </div>
                                            </div>
                                            <br />
                                            <br />
                                            <div class="row">
                                                <div class="col-sm">
                                                    <button type="button" data-toggle="modal" data-target="#ModalAtras" style="background: #999999; border: 0; padding: 10px 35px; color: #fff; transition: 0.4s; border-radius: 50px;">De Atrás</button>
                                                    <input type="text"  id="fotoAtras" name="fotoAtras" value="" hidden/>
                                                </div>
                                                <div class="col-sm">
                                                    <button type="button" data-toggle="modal" data-target="#ModalFrente" style="background: #999999; border: 0; padding: 10px 35px; color: #fff; transition: 0.4s; border-radius: 50px;">De Frente</button>
                                                    <input type="text"  id="fotoFrente" name="fotoFrente" value="" hidden/>
                                                </div>
                                            </div>
                                        </div>
                                        <br />
                                        <div class="text-center">
                                            <button id="btnEnviar" type="submit" style="background: #BAD305;border: 0; padding: 10px 35px;color: #fff;transition: 0.4s;border-radius: 50px;">Enviar</button>
                                        </div>
                                        <br />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
                <%-- Modals --%>

    <div class="modal fade" id="ModalArriba" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Fotografía 1</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                </div>
                <div class="modal-body">
                    <div style="margin-left: 5pc;" id="divCamara1">
                        <div id="idwebcam"></div>
                        <div id="idcaptured"></div>
                        <br />
                        <div class="text-center">
                         <input type="button" id="btnCapturar1" value="Capturar" style="background: #BAD305;border-radius: 50px;border: 0;color: #fff; margin-right: 78px;"/>
                        </div>
                        <br />
                    </div>
                    <div class="row align-items-center">
                    <div class="col-sm text-center">
                      
                        <button  type="button" value="Activar Cámara" id="Camara1" style="background: #BAD305;border: 0; padding: 10px 35px;color: #fff;transition: 0.4s;border-radius: 50px;">Activar Cámara</button>
                        <div class="row">
                            <div class="col">
                                o
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <input type="button" id="cancelar1" value="Limpiar" style="margin-bottom: -7.7px"/>
                                <input type="file" id="upload1" name="files" hidden>
                                <label id="labelupload1" class="boton-file" for="upload1">Subir Foto</label>
                                <script>
                                    $(document).ready(function () {
                                        if ($('#upload1').val() == "") {
                                            $("#cancelar1").hide();
                                        } else {
                                            $("#cancelar1").show();
                                            $('#labelupload1').css("background-color", "#8d9d17")
                                        }

                                        $("#cancelar1").click(function () {
                                            $("#upload1").val('');
                                            $('#labelupload1').css("background-color", "#BAD305")
                                            $("#cancelar1").hide();
                                        });
                                        $('#upload1').change(function () {
                                            if ($('#upload1').val() == "") {
                                                $('#labelupload1').css("background-color", "#BAD305")
                                                $("#cancelar1").hide();
                                            } else {
                                                $('#labelupload1').css("background-color", "#8d9d17")
                                                $("#cancelar1").show();
                                            }
                                        });
                                    });
                                </script>
                            </div>
                        </div>
                    </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                    <button id="btnModalGuardar1" type="button" class="btn btn-primary" data-dismiss="modal" style="background-color: #C6D41D; border-color: #C6D41D;">Guardar Cambios</button>
                </div>
            </div>
        </div>
    </div>
        <div class="modal fade" id="ModalIzquierdo" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                </div>
                <div class="modal-body">
                    <div style="margin-left: 5pc;" id="divCamara2">
                        <div id="idwebcam2"></div>
                        <div id="idcaptured2"></div>
                        <br />
                        <div class="text-center">
                         <input type="button" id="btnCapturar2" value="Capturar" style="background: #BAD305;border-radius: 50px;border: 0;color: #fff; margin-right: 78px;"/>
                        </div>
                        <br />
                    </div>
                    <div class="row align-items-center">
                    <div class="col-sm text-center">
                        <button type="button" value="Activar Cámara" id="Camara2" style="background: #BAD305;border: 0; padding: 10px 35px;color: #fff;transition: 0.4s;border-radius: 50px;">Activar Cámara</button>
                        <div class="row">
                            <div class="col">
                                o
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <input type="button" id="cancelar2" value="Limpiar" style="margin-bottom: -7.7px"/>
                                <input type="file" id="upload2" name="files" hidden>
                                <label id="labelupload2" class="boton-file" for="upload2">Subir Foto</label>
                                <script>
                                    $(document).ready(function () {
                                        if ($('#upload2').val() == "") {
                                            $("#cancelar2").hide();
                                        } else {
                                            $("#cancelar2").show();
                                            $('#labelupload2').css("background-color", "#8d9d17")
                                        }

                                        $("#cancelar2").click(function () {
                                            $("#upload2").val('');
                                            $('#labelupload2').css("background-color", "#BAD305")
                                            $("#cancelar2").hide();
                                        });
                                        $('#upload2').change(function () {
                                            if ($('#upload2').val() == "") {
                                                $('#labelupload2').css("background-color", "#BAD305")
                                                $("#cancelar2").hide();
                                            } else {
                                                $('#labelupload2').css("background-color", "#8d9d17")
                                                $("#cancelar2").show();
                                            }
                                        });
                                    });
                                </script>
                            </div>
                        </div>
                    </div>
                    </div>
                </div>
                <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                <button type="button" class="btn btn-primary">Guardar Cambios</button>
                </div>
            </div>
        </div>
    </div>
        <div class="modal fade" id="ModalDerecho" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                </div>
                <div class="modal-body">
                    <div style="margin-left: 5pc;" id="divCamara3">
                        <div id="idwebcam3"></div>
                        <div id="idcaptured3"></div>
                        <br />
                        <div class="text-center">
                         <input type="button" id="btnCapturar3" value="Capturar" style="background: #BAD305;border-radius: 50px;border: 0;color: #fff; margin-right: 78px;"/>
                        </div>
                        <br />
                    </div>
                    <div class="row align-items-center">
                    <div class="col-sm text-center">
                        <button type="button" value="Activar Cámara" id="Camara3" style="background: #BAD305;border: 0; padding: 10px 35px;color: #fff;transition: 0.4s;border-radius: 50px;">Activar Cámara</button>
                        <div class="row">
                            <div class="col">
                                o
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <input type="button" id="cancelar3" value="Limpiar" style="margin-bottom: -7.7px"/>
                                <input type="file" id="upload3" name="files" hidden>
                                <label id="labelupload3" class="boton-file" for="upload3">Subir Foto</label>
                                <script>
                                    $(document).ready(function () {
                                        if ($('#upload3').val() == "") {
                                            $("#cancelar3").hide();
                                        } else {
                                            $("#cancelar3").show();
                                            $('#labelupload3').css("background-color", "#8d9d17")
                                        }

                                        $("#cancelar3").click(function () {
                                            $("#upload3").val('');
                                            $('#labelupload3').css("background-color", "#BAD305")
                                            $("#cancelar3").hide();
                                        });
                                        $('#upload3').change(function () {
                                            if ($('#upload3').val() == "") {
                                                $('#labelupload3').css("background-color", "#BAD305")
                                                $("#cancelar3").hide();
                                            } else {
                                                $('#labelupload3').css("background-color", "#8d9d17")
                                                $("#cancelar3").show();
                                            }
                                        });
                                    });
                                </script>
                            </div>
                        </div>
                    </div>
                    </div>
                </div>
                <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                <button type="button" class="btn btn-primary">Guardar Cambios</button>
                </div>
            </div>
        </div>
    </div>
        <div class="modal fade" id="ModalAtras" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                </div>
                <div class="modal-body">
                    <div style="margin-left: 5pc;" id="divCamara4">
                        <div id="idwebcam4"></div>
                        <div id="idcaptured4"></div>
                        <br />
                        <div class="text-center">
                         <input type="button" id="btnCapturar4" value="Capturar" style="background: #BAD305;border-radius: 50px;border: 0;color: #fff; margin-right: 78px;"/>
                        </div>
                        <br />
                    </div>
                    <div class="row align-items-center">
                    <div class="col-sm text-center">
                        <button type="button" value="Activar Cámara" id="Camara4" style="background: #BAD305;border: 0; padding: 10px 35px;color: #fff;transition: 0.4s;border-radius: 50px;">Activar Cámara</button>
                        <div class="row">
                            <div class="col">
                                o
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <input type="button" id="cancelar4" value="Limpiar" style="margin-bottom: -7.7px"/>
                                <input type="file" id="upload4" name="files" hidden>
                                <label id="labelupload4" class="boton-file" for="upload4">Subir Foto</label>
                                <script>
                                    $(document).ready(function () {
                                        if ($('#upload4').val() == "") {
                                            $("#cancelar4").hide();
                                        } else {
                                            $("#cancelar4").show();
                                            $('#labelupload4').css("background-color", "#8d9d17")
                                        }

                                        $("#cancelar4").click(function () {
                                            $("#upload4").val('');
                                            $('#labelupload4').css("background-color", "#BAD305")
                                            $("#cancelar4").hide();
                                        });
                                        $('#upload4').change(function () {
                                            if ($('#upload4').val() == "") {
                                                $('#labelupload4').css("background-color", "#BAD305")
                                                $("#cancelar4").hide();
                                            } else {
                                                $('#labelupload4').css("background-color", "#8d9d17")
                                                $("#cancelar4").show();
                                            }
                                        });
                                    });
                                </script>
                            </div>
                        </div>
                    </div>
                    </div>
                </div>
                <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                <button type="button" class="btn btn-primary">Guardar Cambios</button>
                </div>
            </div>
        </div>
    </div>
        <div class="modal fade" id="ModalFrente" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                </div>
                <div class="modal-body">
                    <div style="margin-left: 5pc;" id="divCamara5">
                        <div id="idwebcam5"></div>
                        <div id="idcaptured5"></div>
                        <br />
                        <div class="text-center">
                         <input type="button" id="btnCapturar5" value="Capturar" style="background: #BAD305;border-radius: 50px;border: 0;color: #fff; margin-right: 78px;"/>
                        </div>
                        <br />
                    </div>
                    <div class="row align-items-center">
                    <div class="col-sm text-center">
                        <button type="button" value="Activar Cámara" id="Camara5" style="background: #BAD305;border: 0; padding: 10px 35px;color: #fff;transition: 0.4s;border-radius: 50px;">Activar Cámara</button>
                        <div class="row">
                            <div class="col">
                                o
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <input type="button" id="cancelar5" value="Limpiar" style="margin-bottom: -7.7px"/>
                                <input type="file" id="upload5" name="files" hidden>
                                <label id="labelupload5" class="boton-file" for="upload5">Subir Foto</label>
                                <script>
                                    $(document).ready(function () {
                                        if ($('#upload5').val() == "") {
                                            $("#cancelar5").hide();
                                        } else {
                                            $("#cancelar5").show();
                                            $('#labelupload5').css("background-color", "#8d9d17")
                                        }

                                        $("#cancelar5").click(function () {
                                            $("#upload5").val('');
                                            $('#labelupload5').css("background-color", "#BAD305")
                                            $("#cancelar5").hide();
                                        });
                                        $('#upload5').change(function () {
                                            if ($('#upload5').val() == "") {
                                                $('#labelupload5').css("background-color", "#BAD305")
                                                $("#cancelar5").hide();
                                            } else {
                                                $('#labelupload5').css("background-color", "#8d9d17")
                                                $("#cancelar5").show();
                                            }
                                        });
                                    });
                                </script>
                            </div>
                        </div>
                    </div>
                    </div>
                </div>
                <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                <button type="button" class="btn btn-primary">Guardar Cambios</button>
                </div>
            </div>
        </div>
    </div>
        </form>

</main><!-- End #main -->
</asp:Content>
