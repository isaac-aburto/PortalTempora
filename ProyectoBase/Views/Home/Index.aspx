<%@ Page Title="" Language="C#" MasterPageFile="~/Views/DisenoBootstrap3.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">

    <script src="https://unpkg.com/gijgo@1.9.13/js/gijgo.min.js" type="text/javascript"></script>
    <link href="https://unpkg.com/gijgo@1.9.13/css/gijgo.min.css" rel="stylesheet" type="text/css" />
    <script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.11.1/jquery.validate.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
    <%-- Script cámara --%>
    <script type="text/javascript">
        $(document).ready(function () {
        var cont = 0;
        console.log("cont antes de la funcion: " + cont)
        //document.getElementById("btnSiguiente").onclick = function () { myFunction() };
        $("#btnSiguiente").click(function () {
            console.log("cont: " + cont)
            if (cont == 1) {
                $(function () {
                    console.log("Entro al tema de la webcam")
                    console.log("Webcam: " + Webcam.set);
                   
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
                                    '<img id="fotografia1" name="fotografia1" width="320" height="238" src="' + data_uri + '"/>';
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
                                    '<img id="fotografia2" name="fotografia2" width="320" height="238" src="' + data_uri2 + '"/>';
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
                                    '<img id="fotografia3" name="fotografia3" width="320" height="238" src="' + data_uri3 + '"/>';
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
                                    '<img id="fotografia4" name="fotografia4" width="320" height="238" src="' + data_uri4 + '"/>';
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
                                    '<img id="fotografia5" name="fotografia5" width="320" height="238" src="' + data_uri5 + '"/>';
                                console.log(data_uri5)
                                document.getElementById('fotoFrente').value = data_uri5;
                            });
                        });
                }); 
                Webcam.on('error', function (err) {
                    console.log(err)
                });
            }
            cont++;
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
    <%-- Pasos --%>
    <script>
        $(document).ready(function () {
            $("#validacionPrimerPaso").prop('hidden', true);
            var cont = 0;
            var pasa = false;
            var pasaPorCorreo = true;
            var pasaPorRut = true;
            var pasoFotos = true;
            $("#inputGuardarDatos").val("true");
            $('#btnEnviar').hide();
            $("#divPaso2").hide();
            $("#divPaso3").hide();
            $("#divPaso4").hide();
            $("#btnSiguiente").click(function () {
                console.log("NUEVO BOTON SIGUIENTE!")
                if (cont == 2) {
                    //const sizes = [];
                    //document.querySelectorAll("#formSolicitud input").forEach(el => {
                    //    if (el.type !== "file") return;
                    //    if (!el.files[0]) return sizes.push({ size: "0", elem: el });
                    //    let _size = el.files[0].size;
                    //    let fSExt = new Array('Bytes', 'KB', 'MB', 'GB'),
                    //        i = 0; while (_size > 900) { _size /= 1024; i++; }
                    //    let exactSize = (Math.round(_size * 100) / 100) + ' ' + fSExt[i];
                    //    sizes.push({ size: exactSize, elem: el });
                    //});
                    //sizes.forEach(el => {
                    //    if (el.size === "0") {
                    //        if (el.elem.getAttribute("data-required")) {

                    //            el.elem.classList.add("needsValidation");
                    //            $("#inputValidacion").prop('hidden', false);
                    //            $("#inputValidacion").addClass("needsValidation2");
                    //            pasoFotos = false;
                    //            $("#btnSiguiente").prop("disabled", true);
                    //        }
                    //    } else {
                    //        $("#inputValidacion").prop('hidden', true);
                    //        pasoFotos = true;
                    //        $("#btnSiguiente").prop("disabled", false);
                    //    }
                    //});
                }
            });

            $("#btnSiguiente").click(function () {
                console.log("PRIMER BOTON SIGUENTE")
                console.log("PASA FOTOS: "  + pasoFotos)
                if (pasa == false || pasaPorCorreo == false || pasaPorRut == false /*|| pasoFotos == false*/) {
                    if ($("#txtFechaNacimiento").val() == "" || $("#txtCelular").val() == "" || $("#txtEmail").val() == "" || $("#txtRut").val() == "" || $("#txtNombre").val() == "" || pasaPorCorreo == false || pasaPorRut == false) {
                        console.log("Hay algo vacío")
                        //$("#btnSiguiente").prop("disabled", true);
                        $("#validacionPrimerPaso").prop('hidden', false);
                        pasa = false;
                    }
                    else {
                        //$("#btnSiguiente").prop("disabled", false);
                        console.log("Esta todo ok")
                        $("#validacionPrimerPaso").prop('hidden', true);
                        pasa = true;
                    }
                } else {
                    $("#divPaso1").hide(500);
                    $("#divPaso2").show(500);
                    $("#validacionPrimerPaso").prop('hidden', true);
                <%-- AJAX Guardar Solicitud no terminada --%>

                    if (($("#inputGuardarDatos").val() == "true") && $("#txtNombre").val() != "" && $("#txtEmail").val() != "" /*&& $("#txtRut").val() != ""*/) {
                        console.log("AJAX Guardar Solicitud no terminada")
                        var Nombre = $("#txtNombre").val();
                        var Email = $("#txtEmail").val();
                        var Telefono = $("#txtNombre").val();
                        $.ajax({
                            url: '<%: Url.Content("~/Home/GuardarSolicitudInconclusa/") %>',
                        data: { Nombre: Nombre, Email: Email, Telefono: Telefono },
                        cache: false,
                        type: "POST",
                        success: function (data) {
                            // data is your result from controller
                            console.log(data);
                            if (data == "false") {
                                console.log("error en Ajax")

                            } else {
                                console.log(data)
                                var Data = data.split(',');
                                $("#idCliente").val(Data[0]);
                                $("#idSolicitud").val(Data[1]);
                            }
                        },
                        error: function (err) {
                            console.log(err);
                        }
                    });
                    }
                    if (pasa != false) {
                        cont++;
                    }
                    console.log("cont2: " + cont);
                    if (cont == 2) {
                        $("#baraDeCarga").css("width", "99%");
                        $("#divPaso2").hide(500);
                        $("#divPaso3").show(500);
                        $("#inputGuardarDatos").val("false");
                    } else {
                        if (cont == 1) {
                            $("#baraDeCarga").css("width", "66%");
                            $("#divPaso1").hide(500);
                            $("#divPaso2").show(500);
                            $('#btnAtras').removeAttr('disabled');
                            $("#inputGuardarDatos").val("false");
                        }
                        else {
                            if (cont == 3) {
                                $("#baraDeCarga").css("width", "99%");
                                $("#divPaso3").hide(500);
                                $("#divPaso4").show(500);
                                $("#divPaso2").hide();
                                $('#btnSiguiente').hide();
                                $('#btnEnviar').show();
                                $("#inputGuardarDatos").val("false");
                            }
                        }
                    }
                    console.log(cont)
                }


            });
            $("#btnAtras").click(function () {
                cont--;
                if (cont == 0) {
                    $("#baraDeCarga").css("width", "33%");
                    $("#divPaso1").show(500);
                    $("#divPaso2").hide(500);
                    $('#btnAtras').attr('disabled', 'disabled');
                    $("#inputGuardarDatos").val("false");

                } else {
                    if (cont == 1) {
                        $("#baraDeCarga").css("width", "66%");
                        $("#divPaso2").show(500);
                        $("#divPaso3").hide(500);
                        $("#inputGuardarDatos").val("false");
                    } else {
                        if (cont == 2) {
                            $("#baraDeCarga").css("width", "66%");
                            $("#divPaso3").show(500);
                            $("#divPaso4").hide(500);
                            $('#btnSiguiente').show();
                            $('#btnEnviar').hide();
                            $('#btnSiguiente').removeAttr('disabled');
                            $("#inputGuardarDatos").val("false");
                        }
                    }

                }
                console.log(cont)
            });
            //if ($("#txtFechaNacimiento").val() == "" || $("#txtCelular").val() == "" || $("#txtEmail").val() == "" || $("#txtRut").val() == "" || $("#txtNombre").val() == "") {
            //    console.log("Hay algo vacío1")
            //   // $("#btnSiguiente").prop("disabled", true);
            //    $("#validacionPrimerPaso").prop('hidden', false);
            //}
            //else {
            //    $("#btnSiguiente").prop("disabled", false);
            //    console.log("Esta todo ok1")
            //    $("#validacionPrimerPaso").prop('hidden', true);
            //}
            $("#txtFechaNacimiento").change(function (event) {
                if ($("#txtFechaNacimiento").val() == "" || $("#txtCelular").val() == "" || $("#txtEmail").val() == "" || $("#txtRut").val() == "" || $("#txtNombre").val() == "") {
                    console.log("Hay algo vacío")
                    pasa = false;
                    //$("#btnSiguiente").prop("disabled", true);
                    //$("#validacionPrimerPaso").prop('hidden', true);
                }
                else {
                    $("#btnSiguiente").prop("disabled", false);
                    console.log("Esta todo ok")
                    pasa = true;
                    //$("#validacionPrimerPaso").prop('hidden', false);
                }
            });
            $("#txtCelular").change(function (event) {
                if ($("#txtFechaNacimiento").val() == "" || $("#txtCelular").val() == "" || $("#txtEmail").val() == "" || $("#txtRut").val() == "" || $("#txtNombre").val() == "") {
                    console.log("Hay algo vacío")
                    pasa = false;
                    //$("#btnSiguiente").prop("disabled", true);
                    //$("#validacionPrimerPaso").prop('hidden', true);
                }
                else {
                    $("#btnSiguiente").prop("disabled", false);
                    console.log("Esta todo ok")
                    pasa = true;
                    //$("#validacionPrimerPaso").prop('hidden', false);
                }
            });
            $("#txtEmail").change(function (event) {
                var correo = $("#txtEmail").val();
                console.log("correo" + correo);
                var respuesta;
                $.ajax({
                    url: '<%: Url.Content("~/Home/ConsultarCorreo/") %>',
                        data: { correo: correo },
                        cache: false,
                        type: "GET",
                        success: function (data) {
                            // data is your result from controller
                            console.log(data);
                            if (data == "false") {
                                console.log("error en Ajax")

                            } else {
                                console.log(data)
                                respuesta = data;
                                if (data == "Existe") {
                                    console.log("El Correo existe!!")
                                }
                                else {
                                    console.log("El Correo no existe")
                                }

                                if (respuesta != "Existe") {
                                    $("#verificarcorreo").hide();
                                    $("#verificarcorreo").text("El correo ingresado es válido :D")
                                    console.log("El rut ingresado es válido :D");
                                    pasaPorCorreo = true;
                                } else {
                                    $("#verificarcorreo").show();
                                    $("#verificarcorreo").text("El correo ya existe en el sistema")
                                    console.log("El correo no es válido :'( ");
                                    pasaPorCorreo = false;
                                }
                            }
                        },
                        error: function (err) {
                            console.log(err);
                        }
                    });

                if ($("#txtFechaNacimiento").val() == "" || $("#txtCelular").val() == "" || $("#txtEmail").val() == "" || $("#txtRut").val() == "" || $("#txtNombre").val() == "") {
                    console.log("Hay algo vacío")
                    $("#btnSiguiente").prop("disabled", true);
                    console.log("Se cambio");
                    pasa = false;
                    //$("#validacionPrimerPaso").prop('hidden', true);
                }
                else {
                    $("#btnSiguiente").prop("disabled", false);
                    console.log("Esta todo ok")
                    //$("#validacionPrimerPaso").prop('hidden', false);
                    pasa = true;

                }
                if (pasa != false && pasaPorCorreo != false && pasaPorRut != false) {
                    $("#validacionPrimerPaso").prop('hidden', false);
                }
            });
            $("#txtRut").change(function (event) {
                var rut = $("#txtRut").val();
                console.log("rutCompleto" + rut);
                //Verificar existencia del rut
                $.ajax({
                    url: '<%: Url.Content("~/Home/ConsultarRut/") %>',
                    data: { rut: rut },
                    cache: false,
                    type: "GET",
                    success: function (data) {
                        // data is your result from controller
                        console.log(data);
                        if (data == "false") {
                            console.log("error en Ajax")

                        } else {
                            console.log(data)
                            respuesta = data;
                            if (data == "Existe") {
                                console.log("El rut existe!!")
                                pasaPorRut = false;
                            }
                            else {
                                console.log("El rut no existe")
                                pasaPorRut = true;
                            }

                            if (respuesta == "Existe") {
                                $("#verificarRut").show();
                                $("#verificarRut").text("El rut ya existe en el sistema")
                                console.log("El rut ingresado no es válido D:");
                            }
                        }
                    },
                    error: function (err) {
                        console.log(err);
                    }
                });

                var Fn = {
                    // Valida el rut con su cadena completa "XXXXXXXX-X"
                    validaRut: function (rut) {
                        if (!/^[0-9]+[-|‐]{1}[0-9kK]{1}$/.test(rut))
                            return false;
                        var tmp = rut.split('-');
                        var digv = tmp[1];
                        var rut = tmp[0];
                        if (digv == 'K') digv = 'k';
                        return (Fn.dv(rut) == digv);
                    },
                    dv: function (T) {
                        var M = 0, S = 1;
                        for (; T; T = Math.floor(T / 10))
                            S = (S + T % 10 * (9 - M++ % 6)) % 11;
                        return S ? S - 1 : 'k';
                    }
                }

                if (Fn.validaRut($("#txtRut").val())) {
                    $("#verificarRut").hide();
                    $("#verificarRut").text("El rut ingresado es válido :D")
                    console.log("El rut ingresado es válido :D");
                    pasaPorRut = true;
                } else {
                    $("#verificarRut").show();
                    $("#verificarRut").text("El Rut no es válido")
                    console.log("El Rut no es válido :'( ");
                    pasaPorRut = false;
                }


                if ($("#txtFechaNacimiento").val() == "" || $("#txtCelular").val() == "" || $("#txtEmail").val() == "" || $("#txtRut").val() == "" || $("#txtNombre").val() == "") {
                    console.log("Hay algo vacío")
                    $("#btnSiguiente").prop("disabled", true);
                    pasa = false;
                    //$("#btnSiguiente").prop("disabled", true);
                    //$("#validacionPrimerPaso").prop('hidden', true);
                }
                else {
                    $("#btnSiguiente").prop("disabled", false);
                    console.log("Esta todo ok")
                    pasa = true;
                    //$("#validacionPrimerPaso").prop('hidden', false);
                }
                if (pasa != false && pasaPorCorreo != false && pasaPorRut != false) {
                    $("#validacionPrimerPaso").prop('hidden', false);
                }
            });
            $("#txtNombre").change(function (event) {
                if ($("#txtFechaNacimiento").val() == "" || $("#txtCelular").val() == "" || $("#txtEmail").val() == "" || $("#txtRut").val() == "" || $("#txtNombre").val() == "") {
                    console.log("Hay algo vacío")
                    pasa = false;
                    //$("#btnSiguiente").prop("disabled", true);
                    //$("#validacionPrimerPaso").prop('hidden', true);
                }
                else {
                    $("#btnSiguiente").prop("disabled", false);
                    console.log("Esta todo ok")
                    pasa = true;
                    //$("#validacionPrimerPaso").prop('hidden', false);
                }
            });


            //$("#btnSiguiente").on('click', function () {
            //    console.log("Se apretó!")
            //    if ($("#txtFechaNacimiento").val() == "" || $("#txtCelular").val() == "" || $("#txtEmail").val() == "" || $("#txtRut").val() == "" || $("#txtNombre").val() == "") {
            //        console.log("Hay algo vacío")
            //        pasa = false;
            //        //$("#btnSiguiente").prop("disabled", true);
            //        //$("#validacionPrimerPaso").prop('hidden', true);
            //    }
            //    else {
            //        $("#btnSiguiente").prop("disabled", false);
            //        console.log("Esta todo ok")
            //        pasa = true;
            //        //$("#validacionPrimerPaso").prop('hidden', false);
            //    }
            //});
        });
    </script>
    <%-- Script Primer paso --%>
            <%--<script>
                $(document).ready(function () {
                    if ($("#txtFechaNacimiento").val() == "" || $("#txtCelular").val() == "" || $("#txtEmail").val() == "" || $("#txtRut").val() == "" || $("#txtNombre").val() == "") {
                        console.log("Hay algo vacío1")
                        $("#btnSiguiente").prop("disabled", true);
                        $("#validacionPrimerPaso").prop('hidden', true);
                    }
                    else {
                        $("#btnSiguiente").prop("disabled", false);
                        console.log("Esta todo ok1")
                        $("#validacionPrimerPaso").prop('hidden', false);
                    }
                    $("#txtFechaNacimiento").change(function (event) {
                        if ($("#txtFechaNacimiento").val() == "" || $("#txtCelular").val() == "" || $("#txtEmail").val() == "" || $("#txtRut").val() == "" || $("#txtNombre").val() == "") {
                            console.log("Hay algo vacío")
                            $("#btnSiguiente").prop("disabled", true);
                            $("#validacionPrimerPaso").prop('hidden', true);
                        }
                        else {
                            $("#btnSiguiente").prop("disabled", false);
                            console.log("Esta todo ok")
                            $("#validacionPrimerPaso").prop('hidden', false);
                        }
                    });
                    $("#txtCelular").change(function (event) {
                        if ($("#txtFechaNacimiento").val() == "" || $("#txtCelular").val() == "" || $("#txtEmail").val() == "" || $("#txtRut").val() == "" || $("#txtNombre").val() == "") {
                            console.log("Hay algo vacío")
                            $("#btnSiguiente").prop("disabled", true);
                            $("#validacionPrimerPaso").prop('hidden', true);
                        }
                        else {
                            $("#btnSiguiente").prop("disabled", false);
                            console.log("Esta todo ok")
                            $("#validacionPrimerPaso").prop('hidden', false);
                        }
                    });
                    $("#txtEmail").change(function (event) {
                        if ($("#txtFechaNacimiento").val() == "" || $("#txtCelular").val() == "" || $("#txtEmail").val() == "" || $("#txtRut").val() == "" || $("#txtNombre").val() == "") {
                            console.log("Hay algo vacío")
                            $("#btnSiguiente").prop("disabled", true);
                            $("#validacionPrimerPaso").prop('hidden', true);
                        }
                        else {
                            $("#btnSiguiente").prop("disabled", false);
                            console.log("Esta todo ok")
                            $("#validacionPrimerPaso").prop('hidden', false);
                        }
                    });
                    $("#txtRut").change(function (event) {
                        if ($("#txtFechaNacimiento").val() == "" || $("#txtCelular").val() == "" || $("#txtEmail").val() == "" || $("#txtRut").val() == "" || $("#txtNombre").val() == "") {
                            console.log("Hay algo vacío")
                            $("#btnSiguiente").prop("disabled", true);
                            $("#validacionPrimerPaso").prop('hidden', true);
                        }
                        else {
                            $("#btnSiguiente").prop("disabled", false);
                            console.log("Esta todo ok")
                            $("#validacionPrimerPaso").prop('hidden', false);
                        }
                    });
                    $("#txtNombre").change(function (event) {
                        if ($("#txtFechaNacimiento").val() == "" || $("#txtCelular").val() == "" || $("#txtEmail").val() == "" || $("#txtRut").val() == "" || $("#txtNombre").val() == "") {
                            console.log("Hay algo vacío")
                            $("#btnSiguiente").prop("disabled", true);
                            $("#validacionPrimerPaso").prop('hidden', true);
                        }
                        else {
                            $("#btnSiguiente").prop("disabled", false);
                            console.log("Esta todo ok")
                            $("#validacionPrimerPaso").prop('hidden', false);
                        }
                    });
                    $("#btnSiguiente").on('click', function () {
                        console.log("Se apretó!")
                        if ($("#txtFechaNacimiento").val() == "" || $("#txtCelular").val() == "" || $("#txtEmail").val() == "" || $("#txtRut").val() == "" || $("#txtNombre").val() == "") {
                            console.log("Hay algo vacío")
                            $("#btnSiguiente").prop("disabled", true);
                            $("#validacionPrimerPaso").prop('hidden', true);
                        }
                        else {
                            $("#btnSiguiente").prop("disabled", false);
                            console.log("Esta todo ok")
                            $("#validacionPrimerPaso").prop('hidden', false);
                        }
                    });
                });
            </script>--%>

    <%-- Checkbox Paso 2 --%>

    <script>
        $(document).ready(function () {
            $("#divSegundaPregunta").hide();
            document.getElementById('chkDermaSi').addEventListener('click', function () {
                console.log('updateText executed')
                if ($("#chkDermaSi").val()) {
                    $("#divSegundaPregunta").show();
                }
                
            });
            document.getElementById('chkDermaNo').addEventListener('click', function () {
                console.log('updateText executed')
                if ($("#chkDermaNo").val()) {
                    $("#divSegundaPregunta").hide();
                }

            });
        });
    </script>

    <%-- AJAX Guardar Solicitud no terminada --%>
<%--    <script>
        $(document).ready(function () {
            $("#btnSiguiente").click(function () {
                console.log("Intento AJAX Guardar Solicitud no terminada")
                console.log($("#inputGuardarDatos").val())

            });
        });
    </script>--%>

    <style>
        .progress-bar {
            background-color: #bad305;
        }
    </style>
    <style>
                *{box-sizing: border-box;}

        .video-header {
            height: 100vh;
            display: flex;
            align-items: center;
            color: aliceblue;
        }
        .wrap {
            max-width: 960px;
            padding-left: 2rem;
            padding-right: 2rem;
            margin: auto;
            text-align: center;
        }
        .fullscreen-video-wrap{
            position: absolute;
            top: 0;
            left: 0;
            height: 100vh;
            width: 100%;
        }
        .fullscreen-video-wrap video {
            min-height: 100%;
            min-width: 100%;
        }
        .header-content {
            z-index: 2;
            margin-top: 20%;
            padding: 0 5rem;
        }
            .header-content h1 {
                font-size: 70px;
                margin-bottom: 0;
            }

            .header-content p {
                font-size: 1.5rem;
                display:block
            }
        @media (max-width: 768px) {
            .header-content h1 {
            font-size: 40px;         
            }
            .header-content p {
            font-size: 1rem;
            }
        }
        @media screen and (max-width: 480px) {
            html {
              overflow-x: hidden;
            }
            body {
              position: relative
            }
            .video-header {
                width: calc(100% - 80px);
            }

            .wrap {
                max-width: 960px;
                padding-left: 2rem;
                padding-right: 2rem;
                margin: auto;
                text-align: center;
            }

            .fullscreen-video-wrap {
                position: absolute;
                top: 0;
                left: 0;
                height: 113vh;
                width: 100%;
            }

                .fullscreen-video-wrap video {
                    min-height: 112%;
                    min-width: 341%;
                }

            .header-content {
                z-index: 2;
                margin-top: 20%;
                padding: 0 5rem;
            }

                .header-content h1 {
                    font-size: 70px;
                    margin-bottom: 0;
                }

                .header-content p {
                    font-size: 1.5rem;
                    display: block
                }

            @media (max-width: 768px) {
                .header-content h1 {
                    font-size: 40px;
                }

                .header-content p {
                    font-size: 1rem;
                }
            }
        }

    </style>
    <%-- Boton de celular --%>
    <style>       
    .boton-file{
        display: inline-block;
        background-color: #bad305;
        color: white;
        padding: 0.5rem;
        font-family: sans-serif;
        border-radius: 1.3rem;
        cursor: pointer;
        margin-top: 1rem;
    }
        body {
        background-color: #ebebeb !important;
        }
        .section-title h2::after {
  content: "";
  width: 120px;
  height: 1px;
  display: inline-block;
  background: rgb(85 85 85 / 20%);
  margin: 4px 10px;
}

</style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

   <%-- <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">--%>
      <!-- ======= Hero Section ======= -->
  <section id="home" class="d-flex align-items-center">

      <div class="video-header wrap">
          <div class="fullscreen-video-wrap">
            <video playsinline="playsinline" autoplay="autoplay" muted="muted" loop="loop" style="filter: brightness(0.5);object-fit: scale-down; max-width: 100%; height: auto; background-color: black;">
                <source src="../../assets/video/tempora.mp4" type="video/mp4">
            </video>
          </div>
          <div class="header-overlay">
              <div class="headera-content">
            <div class="container position-relative text-center text-lg-left" data-aos="zoom-in" data-aos-delay="100">
          <h1 style="font-family: 'Poppins';
    font-style: inherit;">Bienvenido a <span style="color: #BAD305">Clínica Tempora</span></h1>
          <h4 style="color: #BAD305;    font-family: -webkit-pictograph;
    font-size: 22px;">Una nueva experiencia en evaluación remota</h4>
<%--          <div class="btns">
            <a href="#menu" class="btn-menu animated fadeInUp scrollto">Quienes somos</a>
            <a href="#book-a-table" class="btn-book animated fadeInUp scrollto">Evaluación</a>
          </div>--%>
        </div>
<%--        <div class="col-lg-4 d-flex align-items-center justify-content-center" data-aos="zoom-in" data-aos-delay="200">
          <a href="https://www.youtube.com/watch?v=gpcZw_XAys4" class="venobox play-btn" data-vbtype="video" data-autoplay="true"></a>
        </div>--%>
              </div>
          </div>
      </div>


  </section><!-- End Hero -->
<main id="main" style="margin-top: -48px;">
<form action="<%: Url.Content("~/Home/Index") %>" method="post" enctype="multipart/form-data" id="formSolicitud" class="needs-validation" novalidate>

    <!-- ======= About Section ======= -->
<%--    <section id="about" class="about">
      <div class="container" data-aos="fade-up">

        <div class="row">
          <div class="col-lg-6 order-1 order-lg-2" data-aos="zoom-in" data-aos-delay="100">
            <div class="about-img">
              <img src="Styles/img/about.jpg" alt="">
            </div>
          </div>
          <div class="col-lg-6 pt-4 pt-lg-0 order-2 order-lg-1 content">
            <h3 style="color: greenyellow">Sobre nuestra clínica...</h3>
            <p class="font-italic" style="color: white;">
              Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore
              magna aliqua.
            </p>
            <ul>
              <li style="color: white;"><i class="icofont-check-circled"></i> Ullamco laboris nisi ut aliquip ex ea commodo consequat.</li>
              <li style="color: white;"><i class="icofont-check-circled"></i> Duis aute irure dolor in reprehenderit in voluptate velit.</li>
              <li style="color: white;"><i class="icofont-check-circled"></i> Ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate trideta storacalaperda mastiro dolore eu fugiat nulla pariatur.</li>
            </ul>
            <p style="color: white;">
              Ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate
              velit esse cillum dolore eu fugiat nulla pariatur. 
            </p>
          </div>
        </div>

      </div>
    </section>--%><!-- End About Section -->

    <!-- ======= Pasos a seguir ======= -->
    <section id="why-us" class="why-us">
      <div class="container" data-aos="fade-up">

        <div class="section-title">
          <h2>Pasos a seguir</h2>
          <p>¿Desea una evaluación?</p>
        </div>

        <div class="row">
            <style>
                .spanCuadrados {
                    font-size: 2pc;
                    font-weight: bold;
                    color: #bad302;
                    text-align:center;
                }
                .estiloCard {
                    width: 18rem;
                    max-width: 291px;
                    max-height: 20pc;
                    min-height: 21pc;
                    min-width: 22pc;
                }
                .estiloSpan {
                    font-size: 32px;
                    font-family: 'Poppins';
                    text-align:center;
                }
                .numeroSpan {
                    text-align:center;
                }
            </style>
          <div class="col-lg-4 mt-4 mt-lg-0">
<%--            <div class="box" data-aos="zoom-in" data-aos-delay="100">
              <span>01</span>
              <h4>Ingresa tus datos personales para que nos conozcamos.</h4>
              <p></p>
            </div>--%>
              <div class="card border-left-primary shadow estiloCard" style="width: 18rem;" data-aos="zoom-in" data-aos-delay="200">
                <div class="card-body">
                <div style="text-align:center">
                    <span class="spanCuadrados">01</span>
                </div>
                    <div class="estiloSpan">
                        <span>Sobre ti</span>
                    </div>
                <h4>Ingresa tus datos personales para que nos conozcamos.</h4>
                </div>
            </div>
          </div>

          <div class="col-lg-4 mt-4 mt-lg-0">
<%--            <div class="box" data-aos="zoom-in" data-aos-delay="200">
              <span>02</span>
              <h4>Envíanos las fotografías de tu cabeza para evaluar tu  calvicie.</h4>
              <p></p>
            </div>--%>
              <div class="card border-left-primary shadow estiloCard" style="width: 18rem;" data-aos="zoom-in" data-aos-delay="200">
                <div class="card-body">
                <div style="text-align:center">
                    <span class="spanCuadrados">02</span>
                </div>
                <div class="estiloSpan">
                    <span>Tus fotografías</span>
                </div>
                <h4>Envíanos las fotografías de tu cabeza para evaluar tu  calvicie.</h4>
                </div>
            </div>
          </div>

          <div class="col-lg-4 mt-4 mt-lg-0">

            <div class="card border-left-primary shadow estiloCard" style="width: 18rem;" data-aos="zoom-in" data-aos-delay="300">
                <div class="card-body">
                <div style="text-align:center">
                    <span class="spanCuadrados">03</span>
                </div>
                    <div class="estiloSpan">
                    <span>¡Relájate!</span>
                </div>
                <h4>Mira el último capítulo de tu serie favorita mientras te  enviamos tu evaluación.</h4>
                </div>
            </div>
          </div>

        </div>

      </div>
    </section>

    <!-- ======= Events Section ======= -->
<%--    <section id="events" class="events">
      <div class="container" data-aos="fade-up">

        <div class="section-title">
          <br />
            <br />
                  <div id="Container">
    <video></video>
    <div></div>
</div>
            <br />
        </div>

      </div>
    </section>--%><!-- End Events Section -->

    <!-- ======= Book A Table Section ======= -->
    <style>
        .cardBodys {
    padding-left: 55px;
    padding-right: 55px;        
        }
    </style>
    <section id="book-a-table" class="book-a-table">
      <div class="container" data-aos="fade-up">

        <div class="section-title">
          <h2>Evaluación Médica</h2>
          <p>Empecemos con tu <label style="color: #ababab;">evaluación</label></p>
  <%--          <div class="progress" style="height: 8px;">
              <div id="baraDeCarga" class="progress-bar" role="progressbar" style="width: 33%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
            </div>--%>
        </div>
<%--        <form action="<%: Url.Content("~/Home/Index") %>" method="post" role="form" class="php-email-form" data-aos="fade-up" data-aos-delay="100">--%>
         <%--  Paso 1 --%>
          <div data-aos="fade-up">
            <div class="card border-left-primary shadow h-100 py-2"  style="border-radius: 10px">
            <div class="card-title" style="    margin-left: 84px;margin-right: 81px; margin-top: 2pc;">
                    <div class="progress" style="height: 15px;">
              <div id="baraDeCarga" class="progress-bar" role="progressbar" style="width: 33%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
            </div>
          </div>
                <div class="card-body cardBodys" id="divPaso1">
                <h3 style="  font-size:24px;  font-family: 'Poppins'; padding-left: 29px; padding-bottom: 29px;"><label style="color: #bad302;font-family: 'Poppins';font-size:24px;">Paso 1: &nbsp;  </label>  Información Personal</h3>
                <div class="form-row" style="padding-left: 30px;padding-right: 30px;">
                    <div class="col-lg-4 col-md-4 form-group">
                        <label for="txtNombre">Nombre Completo</label>
                        <input type="text" id="txtNombre" name="txtNombre" class="form-control" placeholder="Dominga Relish " data-rule="minlen:1" data-msg="Please enter at least 4 chars" required>
                        <div class="invalid-feedback" >
                            Por favor ingrese su nombre
                        </div>
                    </div>
<%--                    <div class="col-lg-6 col-md-6 form-group">
                        <input type="text" id="txtApellido" name="txtApellido" class="form-control" placeholder="Apellido" data-rule="minlen:4" data-msg="Please enter at least 4 chars" required>
                        <div class="invalid-feedback">
                           Por favor ingrese su apellido
                        </div>
                    </div>--%>
                    <div class="col-lg-4 col-md-4 form-group">
                        <label for="txtRut">Rut</label>
                        <input type="text" class="form-control" name="txtRut" id="txtRut" placeholder="10472378-K" required>
                        <h6 id="verificarRut" style="color: orangered;font-size: 12px;margin-top: 4px;margin-left: 6px;"></h6>
                        <div class="invalid-feedback">
                            
                            Por favor ingrese su rut
                        </div>
                            <script>
<%--                                $(document).ready(function () {
                                    $("#txtRut").change(function (event) {
                                        var rut = $("#txtRut").val();
                                        console.log("rutCompleto" + rut);

                                        //Verificar existencia del rut

                                        $.ajax({
                                            url: '<%: Url.Content("~/Home/ConsultarRut/") %>',
                                            data: { rut: rut },
                                            cache: false,
                                            type: "GET",
                                            success: function (data) {
                                                // data is your result from controller
                                                console.log(data);
                                                if (data == "false") {
                                                    console.log("error en Ajax")

                                                } else {
                                                    console.log(data)
                                                    respuesta = data;
                                                    if (data == "Existe") {
                                                        console.log("El rut existe!!")
                                                    }
                                                    else {
                                                        console.log("El rut no existe")
                                                    }

                                                    if (respuesta == "Existe") {
                                                        $("#verificarRut").show();
                                                        $("#verificarRut").text("El rut ya existe en el sistema")
                                                        console.log("El rut ingresado es válido :D");
                                                    }
                                                }
                                            },
                                            error: function (err) {
                                                console.log(err);
                                            }
                                        });

                                        var Fn = {
                                            // Valida el rut con su cadena completa "XXXXXXXX-X"
                                            validaRut: function (rut) {
                                                if (!/^[0-9]+[-|‐]{1}[0-9kK]{1}$/.test(rut))
                                                    return false;
                                                var tmp = rut.split('-');
                                                var digv = tmp[1];
                                                var rut = tmp[0];
                                                if (digv == 'K') digv = 'k';
                                                return (Fn.dv(rut) == digv);
                                            },
                                            dv: function (T) {
                                                var M = 0, S = 1;
                                                for (; T; T = Math.floor(T / 10))
                                                    S = (S + T % 10 * (9 - M++ % 6)) % 11;
                                                return S ? S - 1 : 'k';
                                            }
                                        }

                                        if (Fn.validaRut($("#txtRut").val())) {
                                            $("#verificarRut").hide();
                                            $("#verificarRut").text("El rut ingresado es válido :D")
                                            console.log("El rut ingresado es válido :D");
                                        } else {
                                            $("#verificarRut").show();
                                            $("#verificarRut").text("El Rut no es válido")
                                            console.log("El Rut no es válido :'( ");
                                        }
                                        // Uso de la función
                                        //console.log(Fn.validaRut('11111111-1') ? 'Valido' : 'inválido');
                                    }); 
                                });--%>
                            </script>
                    </div>

                    <script src="https://unpkg.com/gijgo@1.9.13/js/messages/messages.es-es.js" type="text/javascript"></script>
                    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
                    <script src="https://unpkg.com/gijgo@1.9.13/js/gijgo.min.js" type="text/javascript"></script>
                    <link href="https://unpkg.com/gijgo@1.9.13/css/gijgo.min.css" rel="stylesheet" type="text/css" />
                    <div class="col-lg-4 col-md-4 form-group">
                        <label for="txtFechaNacimiento">Fecha de nacimiento</label>
                    <input id="txtFechaNacimiento" placeholder="dd/mm/yyyy" name="txtFechaNacimiento" required/>
                    </div>
                    <script>
                        $(document).ready(function () {
                            $('#txtFechaNacimiento').datepicker({
                                uiLibrary: 'bootstrap4',
                                weekStartDay: 6,
                                locale: 'en-us',
                                maxDate: function () {
                                    var date = new Date();
                                    date.setDate(date.getDate() - 6570);
                                    return new Date(date.getFullYear(), date.getMonth(), date.getDate());
                                },
                                //value: function () {
                                //    var date = new Date();
                                //    date.setDate(date.getDate() - 6570);
                                //    return new Date(date.getFullYear(), date.getMonth(), date.getDate());
                                //},
                            });
                        });
                    </script>

                    <%-- Verificar Correo --%>
                    <script>
                        $(document).ready(function () {
<%--                            $("#txtEmail").change(function (event) {
                                console.log("Se cambio");
                                var correo = $("#txtEmail").val();
                                console.log("correo" + correo);
                                var respuesta; 
                                $.ajax({
                                    url: '<%: Url.Content("~/Home/ConsultarCorreo/") %>',
                                    data: { correo: correo },
                                    cache: false,
                                    type: "GET",
                                    success: function (data) {
                                        // data is your result from controller
                                        console.log(data);
                                        if (data == "false") {
                                            console.log("error en Ajax")

                                        } else {
                                            console.log(data)
                                            respuesta = data;
                                            if (data == "Existe") {
                                                console.log("El Correo existe!!")
                                            }
                                            else {
                                                console.log("El Correo no existe")
                                            }

                                            if (respuesta != "Existe") {
                                                $("#verificarcorreo").hide();
                                                $("#verificarcorreo").text("El correo ingresado es válido :D")
                                                console.log("El rut ingresado es válido :D");
                                            } else {
                                                $("#verificarcorreo").show();
                                                $("#verificarcorreo").text("El correo ya existe en el sistema")
                                                console.log("El correo no es válido :'( ");
                                            }
                                        }
                                    },
                                    error: function (err) {
                                        console.log(err);
                                    }
                                });


                            }); --%>
                        });
                    </script>
                    <div class="col-lg-6 col-md-6 form-group">
                        <label for="txtEmail">Correo</label>
                        <input type="email" class="form-control" name="txtEmail" id="txtEmail" placeholder="tucorreo@mail.com" data-rule="email" data-msg="Please enter a valid email" required>
                        <h6 id="verificarcorreo" style="color: orangered;font-size: 12px;margin-top: 4px;margin-left: 6px;"></h6>
                        <div class="invalid-feedback">
                            Por favor ingrese su correo
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6 form-group">
                        <label for="txtCelular">Celular</label>
                        <div class="input-group">

                            <div class="input-group-prepend">
                              <div class="input-group-text">+56</div>
                            </div>
                            <input type="text" min="10000000" max="99999999" class="form-control" name="txtCelular" id="txtCelular" placeholder="9999999999" data-rule="minlen:4" data-msg="Please enter at least 4 chars" required>
                            <div class="invalid-feedback">
                                Por favor ingrese su celular
                            </div>
                        </div>
                    </div>
                    <script>
                        $(document).ready(function () {
                            var input = document.getElementById('txtCelular');
                            input.addEventListener('input', function () {
                                if (this.value.length > 9)
                                    this.value = this.value.slice(0, 9);
                            });

                            
                            $('#txtCelular')    
                                .keypress(function (event) {
                                    if (event.which < 48 || event.which > 57 || this.value.length === 12) {
                                        return false;
                                    }
                            });
                            

                        });
                    </script>
<%--                    <div class="col-lg-6 col-md-6 form-group">
                        <input  id="txtFechaNacimiento" placeholder="Fecha de nacimiento" name="txtFechaNacimiento" required/>

                        <script>
                            $(function () {
                            $('#txtFechaNacimiento').datepicker({
                                uiLibrary: 'bootstrap4',
                                format: 'dd/mm/yyyy',
                            });
                            $('#txtFechaNacimiento').datepicker("option", "maxDate", '+7D');
                                $('#txtFechaNacimiento').datepicker();
                            });
                        </script>

                    </div>--%>


<%--                                            <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
                        <script src="https://unpkg.com/gijgo@1.9.13/js/gijgo.min.js" type="text/javascript"></script>
                        <link href="https://unpkg.com/gijgo@1.9.13/css/gijgo.min.css" rel="stylesheet" type="text/css" />
                        <script src="https://unpkg.com/gijgo@1.9.13/js/messages/messages.es-es.js" type="text/javascript"></script>
                    <input name="txtFechaNacimiento2" id="txtFechaNacimiento2" />
                    <script>
                        $('#txtFechaNacimiento').datetimepicker({ uiLibrary: 'bootstrap4', footer: true, modal: true, locale: 'es-es', });
                    </script>--%>



                </div>
                    <div style="text-align: center;">
                        <label id="validacionPrimerPaso" style="color: red">Por favor complete o verfique sus datos.</label>
                    </div>
                </div>
    
          <%--  Paso 2 --%>
          <%--<div class="card border-left-primary shadow h-100 py-2"  style="border-radius: 10px">--%>
            <%--<div class="card" id="divPaso2" style="border-radius: 10px">--%>
                <div class="card-body" id="divPaso2">
                <h3>Segundo Paso: Cuestionario</h3>
                <%-- Primera pregunta --%>
                <h6>1.- ¿Qué zona deseas reparar?</h6>
                <div style="margin-left: 24px">

                    <div class="row" style="margin-left: -24px;">
                        <div class="custom-control custom-checkbox">
                            <input type="checkbox" class="custom-control-input" id="chkZonaCima" name="chkZonaCima">
                            <label class="custom-control-label" for="chkZonaCima" style="padding-left: 20px;">Cima</label>
                        </div>

                        <div class="custom-control custom-checkbox">
                            <input class="custom-control-input" type="checkbox" id="chkZonaRegion" name="chkZonaRegion">
                            <label class="custom-control-label" for="chkZonaRegion" style="padding-left: 20px;">Región Parietal</label>
                        </div>
                        <div class="custom-control custom-checkbox">
                            <input class="custom-control-input" type="checkbox" id="chkZonaCoronilla" name="chkZonaRegion">
                            <label class="custom-control-label" for="chkZonaCoronilla" style="padding-left: 20px;">Coronilla</label>
                        </div>
                        <div class="custom-control custom-checkbox">
                            <input class="custom-control-input" type="checkbox" id="chkZonaOccipital" name="chkZonaRegion">
                            <label class="custom-control-label" for="chkZonaOccipital" style="padding-left: 20px;">Hueso Occipital</label>
                        </div>
                        <div class="custom-control custom-checkbox">
                            <input class="custom-control-input" type="checkbox" id="chkZonaNuca" name="chkZonaRegion">
                            <label class="custom-control-label" for="chkZonaNuca" style="padding-left: 20px;">Nuca</label>
                        </div>
                        <div class="custom-control custom-checkbox">
                            <input class="custom-control-input" type="checkbox" id="chkZonaSien" name="chkZonaRegion">
                            <label class="custom-control-label" for="chkZonaSien" style="padding-left: 20px;">Sien</label>
                        </div>
                    </div>
                </div>
                <br />
                <%-- Segunda Pregunta --%>
                <h6>2.- ¿Se ha estado tratando con algún dermatologo por alguna enfermedad capilar?</h6>
                <div class="invalid-feedback">
                    You must agree before submitting.
                </div>
                <div class="custom-control custom-checkbox custom-control-inline"> 
                    <input type="radio" id="chkDermaSi" name="chkDermaSi" class="custom-control-input">
                    <label class="custom-control-label" for="chkDermaSi">Sí</label>
                    <label style="padding-left: 7px;">Si</label>
                </div>
                <div class="custom-control custom-checkbox custom-control-inline">
                    <div>
                    <input type="radio" id="chkDermaNo" name="chkDermaSi" class="custom-control-input" required>
                    <label class="custom-control-label" for="chkDermaNo"></label>
                    <label style="padding-left: 15px;">No</label>
                    </div>
                </div>

                <%-- Chk Si --%>
                <div id="divSegundaPregunta" style="margin-left: 24px">
                     <h6>¿Cuál?</h6>
                    <div class="form-check custom-radio custom-control-inline">
                        <input class="form-check-input" type="checkbox" id="chkDermaDermatitis" name="chkDermaDermatitis">
                        <label class="form-check-label" for="chkDermaDermatitis">
                            Dermatitis seborreica
                        </label>
                    </div>
                    <div class="form-check custom-radio custom-control-inline">
                        <input class="form-check-input" type="checkbox" id="chkDermaAlopecia" name="chkDermaAlopecia">
                        <label class="form-check-label" for="chkDermaAlopecia">
                            Alopecia areata
                        </label>
                    </div>
                    <div class="form-check custom-radio custom-control-inline">
                        <input class="form-check-input" type="checkbox" id="chkDermaAutoinmunes" name="chkDermaAutoinmunes">
                        <label class="form-check-label" for="chkDermaAutoinmunes">
                            Enfermedades autoinmunes
                        </label>
                    </div>
                    <div class="form-check custom-radio custom-control-inline">
                        <input class="form-check-input" type="checkbox" id="chkDermaEsclerodermia" name="chkDermaEsclerodermia">
                        <label class="form-check-label" for="chkDermaEsclerodermia">
                            Esclerodermia
                        </label>
                    </div>
                    <div class="form-check custom-radio custom-control-inline">
                        <input class="form-check-input" type="checkbox" id="chkDermaOtra" name="chkDermaOtra">
                        <label class="form-check-label" for="chkDermaOtra">
                            Otra
                        </label>
                    </div>
                </div>
                <br />
                <%-- Tercera Pregunta --%>
                <h6>3.- ¿Ha tenido pelones en la cabeza o barba?</h6>
                <div  class="custom-control custom-checkbox custom-control-inline">
                  
                    <input type="radio" id="chkPeloSi" name="chkPeloSi" class="custom-control-input" required>
                  <label class="custom-control-label" for="chkPeloSi"></label>
                    <label style="padding-left: 19px;">Si</label>
                </div>
                <div class="custom-control custom-checkbox custom-control-inline">
                    <input type="radio" id="chkPeloNo" name="chkPeloSi" class="custom-control-input" required>
                  <label class="custom-control-label" for="chkPeloNo"></label>
                    <label style="padding-left: 19px;">No</label>
                </div>
                </div>
                <script>
                    $(document).ready(function () {
                        $('#chkDermaNo').prop('checked', true);
                        $('#chkPeloNo').prop('checked', true);
                    });
                </script>
            <%--</div>--%>
          <%-- Script Segundo paso --%>
          <script>
              $(document).ready(function () {

              });
          </script>
          <style>
            .custom-control-label::before {
                position: absolute;
                top: .25rem;
                left: 0;
                display: block;
                width: 1rem;
                height: 1rem;
                pointer-events: none;
                content: "";
                -webkit-user-select: none;
                -moz-user-select: none;
                -ms-user-select: none;
                user-select: none;
                background-color: #ffffff;
            }

          </style>
        <%-- Paso 3 --%>
            <%--<div class="card border-left-primary shadow h-100 py-2"  style="border-radius: 10px">--%>
            <%--<div class="card" id="divPaso3"  style="border-radius: 10px">--%>
                <div class="card-body" id="divPaso3">
                <h3>Tercer Paso: Fotografías</h3>
                <p>Estas fotografías deben ser tomadas en un lugar con luz natural, sin flash y con la cámara trasera de su cámara o celular, no con la camara frontal, debido a que la calidad de imagen se ve afectada.</p>
                <p>Es ideal que otra persona le ayude a tomar estas fotografías, posicionandose a un metro de distacia y no en modo selfie.</p>
                <p>El siguiente esquema muestra los ángulos en que se debe fotografiar. En el caso de que su zona a evaluar sean las entradras, por favor tirar su cabello hacia atrás para poder apreciar de mejor manera su complicación.</p>
                <div class="text-center">
                </div>
                <br />
                <br />
                    <div class="text-center">
                        <div class="row">
                            <div class="col-sm">
                                <button type="button" data-toggle="modal" data-target="#ModalArriba" style="background: #BAD305; border: 0; padding: 10px 35px; color: #fff; transition: 0.4s; border-radius: 50px;">Desde Arriba</button>
                                <input type="text"  id="fotoArriba" name="fotoArriba" value="" hidden/>
                                <input type="text"  id="fotoArribaIs" name="fotoArribaIs" value="" hidden/>
                            </div>
                            <div class="col-sm">
                                <button type="button" data-toggle="modal" data-target="#ModalIzquierdo" style="background: #BAD305; border: 0; padding: 10px 35px; color: #fff; transition: 0.4s; border-radius: 50px;">Perfil Izquierdo</button>
                                <input type="text"  id="fotoIzquierdo" name="fotoIzquierdo" value="" hidden/>
                                <input type="text"  id="fotoIzquierdoIs" name="fotoIzquierdoIs" value="" hidden/>
                            </div>
                            <div class="col-sm">
                                <button type="button" data-toggle="modal" data-target="#ModalDerecho" style="background: #BAD305; border: 0; padding: 10px 35px; color: #fff; transition: 0.4s; border-radius: 50px;">Perfil Derecho</button>
                                <input type="text"  id="fotoDerecho" name="fotoDerecho" value="" hidden/>
                                <input type="text"  id="fotoDerechoIs" name="fotoDerechoIs" value="" hidden/>
                            </div>
                        </div>
                        <div class="row" style="    margin-top: 2pc;">
                            <div class="col-sm">
                                <button type="button" data-toggle="modal" data-target="#ModalAtras" style="background: #BAD305; border: 0; padding: 10px 35px; color: #fff; transition: 0.4s; border-radius: 50px;">De Atrás</button>
                                <input type="text"  id="fotoAtras" name="fotoAtras" value="" hidden/>
                                <input type="text"  id="fotoAtrasIs" name="fotoAtrasIs" value="" hidden/>
                            </div>
                            <div class="col-sm">
                                <button type="button" data-toggle="modal" data-target="#ModalFrente" style="background: #BAD305; border: 0; padding: 10px 35px; color: #fff; transition: 0.4s; border-radius: 50px;">De Frente</button>
                                <input type="text"  id="fotoFrente" name="fotoFrente" value="" hidden/>
                                <input type="text"  id="fotoFrenteIs" name="fotoFrenteIs" value="" hidden/>
                            </div>
                        </div>
                        <label id="inputValidacion"></label>
                    </div>
                <br />
                <br />
                <%--</div>--%>
          </div>
          <%-- Por donde nos contactamos? --%>
          <%--<div class="card border-left-primary shadow h-100 py-2"  style="border-radius: 10px">--%>
          <%--<div id="divPaso4" class="card" style="border-radius: 10px">--%>
              <div class="card-body" id="divPaso4">
            <h3>Cuarto Paso: Contacto</h3>
            <%-- Primera pregunta --%>
            <h6>¿Por dónde nos contactamos?</h6>
            <div style="text-align: center;">
                <br />
            <div class="row" style="    width: 30pc;margin-left: 20pc;padding-bottom: 3pc;">
<%--                <div class="col">
                    <img width="50" height="50" src="../../Styles/img/correo.png" />
                    <div class="custom-control custom-checkbox" style="margin-right: 40px;">
                      <input type="checkbox" class="custom-control-input" id="customCheck1" checked disabled>
                      <label class="custom-control-label" for="customCheck1"></label>
                    </div>
                </div>--%>
                <div class="col">
                    <img width="50" height="50" src="../../Styles/img/facebook.png" />
                    <div class="custom-control custom-checkbox" style="margin-right: 40px;">
                      <input type="checkbox" class="custom-control-input" id="customCheck2" >
                      <label class="custom-control-label" for="customCheck2"></label>
                    </div>

                <%--<button id="btnFacebook" hidden onclick="onLogin();">Iniciar Sesión</button>--%>
                </div>
              <div class="col">
                    <img width="50" height="50" src="../../Styles/img/whatsapp.png" />
                    <br />
                    <div class="custom-control custom-checkbox" style="margin-right: 40px;">
                      <input type="checkbox" class="custom-control-input" id="customCheck3">
                      <label class="custom-control-label" for="customCheck3"></label>
                        <a hidden id="btnWsp" class="button" href="https://api.whatsapp.com/send?phone=56953306060&text=Quiero que me contecten por favor." target="_blank">https://api.whatsapp.com/send?phone=56953306060&text=Quiero</a>
                    </div>
                </div>
                </div>
                <%--<fb:login-button 
                  scope="public_profile,email"
                  onlogin="checkLoginState();">
                </fb:login-button>--%>
            
            
<%--            <script>
                window.fbAsyncInit = function () {
                    FB.init({
                        appId: '2596657497293255',
                        cookie: true,
                        xfbml: true,
                        version: 'v10.0'
                    });

                    FB.AppEvents.logPageView();

                };

                (function (d, s, id) {
                    var js, fjs = d.getElementsByTagName(s)[0];
                    if (d.getElementById(id)) { return; }
                    js = d.createElement(s); js.id = id;
                    js.src = "https://connect.facebook.net/en_US/sdk.js";
                    fjs.parentNode.insertBefore(js, fjs);
                }(document, 'script', 'facebook-jssdk'));

                function onLogin() {
                    FB.login((response) => {
                        if (response.authResponse) {
                            FB.api('/me?fields=email,name,picture,accessToken', (response) => {
                                console.log(response)
                                console.log(response.name)
                                console.log(response.id)
                            })
                        }
                    })
                }

                //FB.getLoginStatus(function (response) {
                //    statusChangeCallback(response);
                //});
            </script>--%>
<%--                          <script>
                              $("#customCheck2").change(function () {
                                  if (this.checked) {
                                      console.log("hola")
                                      $('#btnFacebook').trigger('click');
                                  }
                              });
                              $("#customCheck3").change(function () {
                                  if (this.checked) {
                                      console.log("hola")
                                      $('#btnWsp')[0].click();
                                  }
                              });
                          </script>--%>
            </div>
              </div>
         </div> 
              </div>
         <%-- </div>--%>
        <style>
            #btnSiguiente {
                border: 37px !important;
                /* border-width: initial; */
                border-color: #b9d101 !important;
                transition: 1s;
            }

            #btnSiguiente:hover{
                background-color: #9cb100 !important;
                color: white !important;
                box-shadow: 0px 1px 10px 0.2px rgba(0, 0, 0, 0.2);
            }
            #btnSiguiente img{
                width: 7px; 
                margin-left: 8px;
                transition: 1s;
            }
            #btnSiguiente:hover img{
                margin-left: 9px; 
                
            }
            .inforContaco {
                    margin-bottom: 20px;
                    color: #727272;
                    font-size: 17px;
            }
            .logoContacto {
                color: #bad302 !important;
            }
            .divContacto {
                margin-left: 25px;
            }
        </style>
          <div class="text-center">
              <div class="row" style="margin-top: 2pc;">
                  <div class="col-sm">
                      <button disabled id="btnAtras" type="button" style="background: #BAD305; border: 0; padding: 10px 35px; color: #fff; transition: 0.4s; border-radius: 50px;"><i class="bi bi-chevron-left"></i> Atrás</button>
                  </div>
                  <div class="col-sm">
                    <br />    
                  </div>
                  <div class="col-sm">
                      <button id="btnSiguiente"type="button" style="background: #BAD305; border: 0; padding: 10px 35px; color: #fff; border-radius: 50px;">Siguiente<i class="bi bi-chevron-right"></i></button>
                      <button id="btnEnviar" type="submit" style="background: #BAD305;border: 0; padding: 10px 35px;color: #fff;transition: 0.4s;border-radius: 50px;">Enviar</button>
                  </div>
              </div>
            </div>
        <input id="inputGuardarDatos" hidden value="false"/>
          <input id="idCliente" name="idCliente" hidden/>
          <input id="idSolicitud" name="idSolicitud" hidden/>
        
          <script>
                                    // Example starter JavaScript for disabling form submissions if there are invalid fields
              (function () {
                  'use strict';
                  window.addEventListener('load', function () {
                      // Fetch all the forms we want to apply custom Bootstrap validation styles to
                      var forms = document.getElementsByClassName('needs-validation');
                      // Loop over them and prevent submission
                      var validation = Array.prototype.filter.call(forms, function (form) {
                          form.addEventListener('submit', function (event) {
                              if (form.checkValidity() === false) {
                                  event.preventDefault();
                                  event.stopPropagation();
                              } else {

                              }
                              form.classList.add('was-validated');
                          }, false);
                      });
                  }, false);
              })();
          </script>
      </div>
    </section>

<%--    <section class="book-a-table">
        <div class="container" data-aos="fade-up">
            <div class="section-title">
                <h2>Facebook</h2>
                <p>Prueba Integración</p>   
            </div>
           
            
        </div>
    </section>--%>
<!-- End Chefs Section -->

    <!-- ======= Contact Section ======= -->
<section id="contact" class="contact" style="margin-top: -43px;">
    <div class="container" data-aos="fade-up">
        <div class="container" data-aos="fade-up">
            <div class="section-title">
                <h2>Hablemos</h2>
                <p>Contacto</p>
            </div>
        </div>
    <div data-aos="fade-up">
        <div class="card border-left-primary shadow h-100 py-2 " style="border-radius: 10px;/* margin-left: 13pc;margin-right: 12pc;*/">
            <div class="row">
                <div class="col-lg-6 col-md-6 form-group" style="    padding: 3pc;">
                    <h5 style="font-size: 18px" class="inforContaco"> Más información en nuestro sitio </h5>
                    <div class="divContacto">
                        <h6 class="inforContaco"><a style="color: #727272  !important;" href="https://clinicatempora.cl/" target="_blank"><i class="bi bi-globe2 logoContacto"></i> clinicatempora.cl</a></h6>
                    </div>
                    <h5 style="font-size: 18px" class="inforContaco">Visitenos en </h5>
                    <div class="divContacto">
                        <h6 class="inforContaco"><i class="bi bi-signpost-2 logoContacto"></i> <a href="https://www.google.com/maps?ll=-33.419544,-70.609112&z=17&t=m&hl=en-US&gl=US&mapclient=embed&cid=6733047197633270011" target="_blank">Suecia 0142, of 603, Providencia, Santiago, Chile.</a></h6>
                    </div>
                    <h5 style="font-size: 18px" class="inforContaco"> Contáctenos por</h5>
                    <div class="divContacto">
                        <h6 class="inforContaco"><i class="bi bi-mailbox logoContacto"></i> <a href="mailto:example@email.com?subject=Email%20Subjec">contacto@clinicatempora.cl</a></h6>
                        <h6 class="inforContaco"><i class="bi bi-telephone logoContacto"></i> <a href="tel:+56954230344">+56 2 2846 5820</a></h6>
                        <h6 style="margin-bottom: -16px;" class="inforContaco"><i class="bi bi-whatsapp logoContacto"></i> <a href="https://wa.me/56954230344" target="_blank"> +56 9 5423 0344</a></h6>
                    </div>

                </div>
                <div class="col" style="margin-right: 10px; margin-top: 4px;"> 
                        <iframe data-aos="zoom-in" data-aos-delay="100" style="border:0; width: 100%; height: 392px;" src="https://maps.google.com/maps?q=Cl%C3%ADnica%20T%C3%A9mpora%20-%20Implante%20Capilar%20-%20Suecia,%20Providencia,%20Chile&t=&z=17&ie=UTF8&iwloc=&output=embed" frameborder="0" allowfullscreen></iframe>
                    </div>  
                </div>
            </div>
  
        </div>
<%--<div class="mapouter"><div class="gmap_canvas"><iframe width="1033" height="310" id="gmap_canvas" src="https://maps.google.com/maps?q=Cl%C3%ADnica%20T%C3%A9mpora%20-%20Implante%20Capilar%20-%20Suecia,%20Providencia,%20Chile&t=&z=17&ie=UTF8&iwloc=&output=embed" frameborder="0" scrolling="no" marginheight="0" marginwidth="0"></iframe><a href="https://embedgooglemap.net/maps/24"></a><br><style>.mapouter{position:relative;text-align:right;height:310px;width:1033px;}</style><a href="https://www.embedgooglemap.net">google maps generator</a><style>.gmap_canvas {overflow:hidden;background:none!important;height:310px;width:1033px;}</style></div></div>--%>
       </div>
    </section><!-- End Contact Section -->


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
                                <input type="button" id="cancelar1" value="Limpiar" style="margin-top: 1pc; margin-left: 196px;"/>
                                <input type="file" id="upload1" name="files" hidden required data-required="t">
                                <label id="labelupload1" class="boton-file" for="upload1">Subir Foto</label>
                                
                                <script>
                                    $("#upload1").on('change', function () {
                                        // this.files[0].size recupera el tamaño del archivo
                                        // alert(this.files[0].size);

                                        var fileName = this.files[0].name;
                                        var fileSize = this.files[0].size;

                                        if (fileSize > 20000000) {
                                            alert('El archivo no debe superar los 20MB');
                                            this.value = '';
                                            this.files[0].name = '';
                                        }
                                    });
                                </script>
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
                                                //$("#fotoArribaIs").val("");

                                            } else {
                                                $('#labelupload1').css("background-color", "#8d9d17")
                                                $("#cancelar1").show();
                                                //$("#fotoArribaIs").val("true");        
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
                <h5 class="modal-title" id="exampleModalLabel">Fotografía 2</h5>
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
                                <input type="button" id="cancelar2" value="Limpiar" style="margin-top: 1pc;margin-left: 196px;"/>
                                <input type="file" id="upload2" name="files" hidden required>
                                <label id="labelupload2" class="boton-file" for="upload2">Subir Foto</label>
                                <script>
                                    $("#upload2").on('change', function () {
                                        // this.files[0].size recupera el tamaño del archivo
                                        // alert(this.files[0].size);

                                        var fileName = this.files[0].name;
                                        var fileSize = this.files[0].size;

                                        if (fileSize > 20000000) {
                                            alert('El archivo no debe superar los 20MB');
                                            this.value = '';
                                            this.files[0].name = '';
                                        }
                                    });
                                </script>
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
                    <button id="btnModalGuardar2" type="button" class="btn btn-primary" data-dismiss="modal" style="background-color: #C6D41D; border-color: #C6D41D;">Guardar Cambios</button>
                </div>             
            </div>
        </div>
    </div>
        <div class="modal fade" id="ModalDerecho" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Fotografía 3</h5>
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
                                <input type="button" id="cancelar3" value="Limpiar" style="margin-top: 1pc;margin-left: 196px;"/>
                                <input type="file" id="upload3" name="files" hidden required >
                                <label id="labelupload3" class="boton-file" for="upload3">Subir Foto</label>
                                <script>
                                    $("#upload3").on('change', function () {
                                        // this.files[0].size recupera el tamaño del archivo
                                        // alert(this.files[0].size);

                                        var fileName = this.files[0].name;
                                        var fileSize = this.files[0].size;

                                        if (fileSize > 20000000) {
                                            alert('El archivo no debe superar los 20MB');
                                            this.value = '';
                                            this.files[0].name = '';
                                        }
                                    });
                                </script>
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
                    <button id="btnModalGuardar3" type="button" class="btn btn-primary" data-dismiss="modal" style="background-color: #C6D41D; border-color: #C6D41D;">Guardar Cambios</button>
                </div>  
            </div>
        </div>
    </div>
        <div class="modal fade" id="ModalAtras" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Fotografía 4</h5>
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
                                <input type="button" id="cancelar4" value="Limpiar" style="margin-top: 1pc;margin-left: 196px;"/>
                                <input type="file" id="upload4" name="files" hidden required>
                                <label id="labelupload4" class="boton-file" for="upload4">Subir Foto</label>
                                <script>
                                    $("#upload4").on('change', function () {
                                        // this.files[0].size recupera el tamaño del archivo
                                        // alert(this.files[0].size);

                                        var fileName = this.files[0].name;
                                        var fileSize = this.files[0].size;

                                        if (fileSize > 20000000) {
                                            alert('El archivo no debe superar los 20MB');
                                            this.value = '';
                                            this.files[0].name = '';
                                        }
                                    });
                                </script>
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
                    <button id="btnModalGuardar4" type="button" class="btn btn-primary" data-dismiss="modal" style="background-color: #C6D41D; border-color: #C6D41D;">Guardar Cambios</button>
                </div>  

            </div>
        </div>
    </div>
        <div class="modal fade" id="ModalFrente" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Fotografía 5</h5>
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
                                <input type="button" id="cancelar5" value="Limpiar" style="margin-top: 1pc;margin-left: 196px;"/>
                                <input type="file" id="upload5" name="files" hidden required>
                                <label id="labelupload5" class="boton-file" for="upload5">Subir Foto</label>
                                <script>
                                    $("#upload5").on('change', function () {
                                        // this.files[0].size recupera el tamaño del archivo
                                        // alert(this.files[0].size);

                                        var fileName = this.files[0].name;
                                        var fileSize = this.files[0].size;

                                        if (fileSize > 20000000) {
                                            alert('El archivo no debe superar los 20MB');
                                            this.value = '';
                                            this.files[0].name = '';
                                        }
                                    });
                                </script>
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
                    <button id="btnModalGuardar5" type="button" class="btn btn-primary" data-dismiss="modal" style="background-color: #C6D41D; border-color: #C6D41D;">Guardar Cambios</button>
                </div>  
                <%-- Validación de fotos --%>
                <script>
                    $(document).ready(function () {
                        document.querySelector("#formSolicitud").addEventListener("submit", e => {
                            const sizes = [];
                            document.querySelectorAll("#formSolicitud input").forEach(el => {
                                if (el.type !== "file") return;
                                if (!el.files[0]) return sizes.push({ size: "0", elem: el });
                                let _size = el.files[0].size;
                                let fSExt = new Array('Bytes', 'KB', 'MB', 'GB'),
                                    i = 0; while (_size > 900) { _size /= 1024; i++; }
                                let exactSize = (Math.round(_size * 100) / 100) + ' ' + fSExt[i];
                                sizes.push({ size: exactSize, elem: el });
                            });
                            sizes.forEach(el => {
                                if (el.size === "0") {
                                    if (el.elem.getAttribute("data-required")) {
                                        e.preventDefault();
                                        el.elem.classList.add("needsValidation");
                                        $("#inputValidacion").prop('hidden', false);
                                        $("#inputValidacion").addClass("needsValidation2");

                                    }
                                } else {
                                    $("#inputValidacion").prop('hidden', true);
                                }

                                
                                //if ((el.size.replace(" MB", "")) - 0 >= 2) {
                                //    e.preventDefault();
                                //    el.elem.classList.add("fileSizeExceded");
                                //}
                            });
                        });
                    });
                </script>
                <style>
                    input {
                      padding:8px;
                      border:solid 1px #c6c6c6c1;
                      border-radius:8px;
                      display:block;
                      transition:0.3s;
                      -webkit-transition:0.3s;
                      -moz-transition:0.3s;
                      -o-transition:0.3s;
                    }

                    .needsValidation,.fileSizeExceded {
                      border:solid 1px red;
                    }

                    .needsValidation::after {
                      content:"Este campo es obligatorio";
                      color:red;
                      display:inline-block;
                      position:absolute;
                      margin-left:25px;
                    }
                    .needsValidation2,.fileSizeExceded {
                      border:solid 1px red;
                    }

                    .needsValidation2::after {
                      content:"Por favor suba todas las fotogragías.";
                        color: red;
                        /* display: inline-block; */
                        position: absolute;
                        margin-left: -130px;
                    }
                    .fileSizeExceded::after {
                      content:"Solo se admiten archivos menores a 20MB";
                      color:red;
                      display:inline-block;
                      position:absolute;
                      margin-left:25px;
                    }

                    @media screen and (max-width:980px) {
                      .needsValidation::after,.fileSizeExceded::after {
                        margin:0;
                        position:relative;
                        display:block;
                      }
                        .needsValidation2::after,.fileSizeExceded::after {
                        margin:0;
                        position:relative;
                        display:block;
                      }
                    }
                </style>
            </div>
        </div>
    </div>
</form>
  </main><!-- End #main -->
</asp:Content>
