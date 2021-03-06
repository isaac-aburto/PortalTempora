<%@ Page Title="" Language="C#" MasterPageFile="~/Views/DisenoBootstrap3.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
        
        <script src="https://unpkg.com/gijgo@1.9.13/js/gijgo.min.js" type="text/javascript"></script>
    <link href="https://unpkg.com/gijgo@1.9.13/css/gijgo.min.css" rel="stylesheet" type="text/css" />
    <script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.11.1/jquery.validate.min.js"></script>

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
    <%-- Pasos --%>
    <script>
        $(document).ready(function () {
            var cont = 0;
            $("#inputGuardarDatos").val("true");
            $('#btnEnviar').hide();
            $("#divPaso2").hide();
            $("#divPaso3").hide();
            $("#divPaso4").hide();
            $("#btnSiguiente").click(function () {
                $("#divPaso1").hide(500);
                $("#divPaso2").show(500);

                <%-- AJAX Guardar Solicitud no terminada --%>

    <%--            if (($("#inputGuardarDatos").val() == "true") && ($("#txtEmail").val() != "" || $("#txtTelefono").val() != "")) {
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
  --%>              cont++;
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
        });
    </script>
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
    </script>ipt>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">


      <!-- ======= Hero Section ======= -->
    <main id="main">
        <form action="<%: Url.Content("~/Solicitudes/CompletarSolicitud") %>" method="post" enctype="multipart/form-data" id="formSolicitud" class="needs-validation" novalidate>
        <section id="about" class="about" style="margin-top: 5pc;">
            

            <div class="card border-secondary <%--border-0--%> shadow rounded-lg mt-5" style="margin-top: -55px; background-color: #e3e3e3;">
                <div class="container" data-aos="fade-up">
                    <input hidden name="idSolicitud" value="<%= ViewData["idSolicitud"]%>" />
                    <div class="row">
                        <div class="card-body" style="margin-top: -5pc;">
                            <div class="card border-left-warning shadow ">
                                <div class="card-body">            
                                            <div class="section-title">
                                                <h2>Evaluación Médica</h2>
                                                <p>¡Completa tu formulario para poder recibir tu evaluación médica!</p>
                                                <div class="progress">
                                                    <div id="baraDeCarga" class="progress-bar" role="progressbar" style="width: 33%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                                                </div>
                                            </div>
                                            <%--        <form action="<%: Url.Content("~/Home/Index") %>" method="post" role="form" class="php-email-form" data-aos="fade-up" data-aos-delay="100">--%>
                                            <%--  Paso 1 --%>
            <div class="card" id="divPaso1" style="border-radius: 10px">
                <div class="card-body">
                <h3>Primer Paso: Información Personal</h3>
                <div class="form-row">
                    <div class="col-lg-6 col-md-6 form-group">
                        <input type="text" id="txtNombre" name="txtNombre" class="form-control" placeholder="Nombre Completo" data-rule="minlen:1" data-msg="Please enter at least 4 chars" required>
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
                    <div class="col-lg-6 col-md-6 form-group">
                        <input type="text" class="form-control" name="txtRut" id="txtRut" placeholder="Rut" required>
                        <h6 id="verificarRut" style="color: orangered;font-size: 12px;margin-top: 4px;margin-left: 6px;"></h6>
                        <div class="invalid-feedback">
                            
                            Por favor ingrese su rut
                        </div>
                            <script>
                                $(document).ready(function () {
                                    $("#txtRut").change(function (event) {
                                        var rutCompleto = $("#txtRut").val();
                                        console.log("rutCompleto" + rutCompleto);
                                        var Fn = {
                                            // Valida el rut con su cadena completa "XXXXXXXX-X"
                                            validaRut: function (rutCompleto) {
                                                if (!/^[0-9]+[-|‐]{1}[0-9kK]{1}$/.test(rutCompleto))
                                                    return false;
                                                var tmp = rutCompleto.split('-');
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
                                });
                            </script>
                    </div>
                    <div class="col-lg-6 col-md-6 form-group">
                        <input type="email" class="form-control" name="txtEmail" id="txtEmail" placeholder="Correo" data-rule="email" data-msg="Please enter a valid email" required>
                        <div class="invalid-feedback">
                            Por favor ingrese su correo
                        </div>
                    </div>
  <%--                  <div class="col-lg-6 col-md-6 form-group">
                        <input type="text" class="form-control" name="txtTelefono" id="txtTelefono" placeholder="Teléfono" data-rule="minlen:4" data-msg="Please enter at least 4 chars" required>
                        <div class="invalid-feedback">
                            Por favor ingrese su telefono
                        </div>
                    </div>--%>
                    <div class="col-lg-6 col-md-6 form-group">
                        <input type="text" class="form-control" name="txtCelular" id="txtCelular" placeholder="Celular" data-rule="minlen:4" data-msg="Please enter at least 4 chars" required>
                        <div class="invalid-feedback">
                            Por favor ingrese su celular
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6 form-group">
                        <input id="txtFechaNacimiento" placeholder="Fecha de nacimiento" name="txtFechaNacimiento" required/>
                        <script>
                            $('#txtFechaNacimiento').datepicker({
                                uiLibrary: 'bootstrap4',
                                format: 'dd/mm/yyyy'
                            });
                        </script>

                    </div>
                </div>
                </div>
            </div>
                                            <%--  Paso 2 --%>
                                                        <div class="card" id="divPaso2" style="border-radius: 10px">
                <div class="card-body">
                <h3>Segundo Paso: Cuestionario</h3>
                <%-- Primera pregunta --%>
                <h6>1.- ¿Qué zona deseas reparar?</h6>
                <div style="margin-left: 24px">
                    <div class="form-check custom-radio custom-control-inline">
                        <input class="form-check-input" type="checkbox" id="chkZonaCima" name="chkZonaCima">
                        <label class="form-check-label" for="chkZonaCima">
                            Cima
                        </label>

                    </div>
                    <div class="form-check custom-radio custom-control-inline">
                        <input class="form-check-input" type="checkbox" id="chkZonaRegion" name="chkZonaRegion">
                        <label class="form-check-label" for="chkZonaRegion">
                            Región Parietal
                        </label>
                    </div>
                    <div class="form-check custom-radio custom-control-inline">
                        <input class="form-check-input" type="checkbox" id="chkZonaCoronilla" name="chkZonaCoronilla">
                        <label class="form-check-label" for="chkZonaCoronilla">
                           Coronilla
                        </label>
                    </div>
                    <div class="form-check custom-radio custom-control-inline">
                        <input class="form-check-input" type="checkbox" id="chkZonaOccipital" name="chkZonaOccipital">
                        <label class="form-check-label" for="chkZonaOccipital">
                            Hueso Occipital
                        </label>
                    </div>
                    <div class="form-check custom-radio custom-control-inline">
                        <input class="form-check-input" type="checkbox" id="chkZonaNuca" name="chkZonaNuca">
                        <label class="form-check-label" for="chkZonaNuca">
                            Nuca
                        </label>
                    </div>
                    <div class="form-check custom-radio custom-control-inline">
                        <input class="form-check-input" type="checkbox" id="chkZonaSien" name="chkZonaSien"> 
                        <label class="form-check-label" for="chkZonaSien">
                            Sien
                        </label>
                    </div>
                </div>
                <br />
                <%-- Segunda Pregunta --%>
                <h6>2.- ¿Se ha estado tratando con algún dermatologo por alguna enfermedad capilar?</h6>
                <div class="invalid-feedback">
                    You must agree before submitting.
                </div>
                <div class="custom-control custom-radio custom-control-inline">
                                        <label>Si</label>
                    <input type="radio" id="chkDermaSi" name="chkDermaSi" class="custom-control-input">
                  <label class="custom-control-label" for="chkDermaSi"></label>
                </div>
                <div class="custom-control custom-radio custom-control-inline">
                                      <label>No</label>
                  <input type="radio" id="chkDermaNo" name="chkDermaSi" class="custom-control-input" required>
                  <label class="custom-control-label" for="chkDermaNo"></label>

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
                <br />
                <%-- Tercera Pregunta --%>
                <h6>3.- ¿Ha tenido pelones en la cabeza o barba?</h6>
                <div class="custom-control custom-radio custom-control-inline">
                  <label>Si</label>
                    <input type="radio" id="chkPeloSi" name="chkPeloSi" class="custom-control-input" required>
                  <label class="custom-control-label" for="chkPeloSi">
                      
                  </label>
                </div>
                <div class="custom-control custom-radio custom-control-inline">
                  <label>No</label>
                    <input type="radio" id="chkPeloNo" name="chkPeloSi" class="custom-control-input">
                  <label class="custom-control-label" for="chkPeloNo">
                  </label>
                </div>
                </div>
            </div>
                                            <%-- Paso 3 --%>
                                                        <div class="card" id="divPaso3"  style="border-radius: 10px">
                <div class="card-body">
                <h3>Tercer Paso: Fotografías</h3>
                <p>Estas fotografías deben ser tomadas en un lugar con luz natural, sin flash y con la cámara trasera de su cámara o celular, no con la camara frontal, debido a que la calidad de imagen se ve afectada.</p>
                <p>Es ideal que otra persona le ayude a tomar estas fotografías, posicionandose a un metro de distacia y no en modo selfie.</p>
                <p>El siguiente esquema muestra los ángulos en que se debe fotografiar. En el caso de que su zona a evaluar sean las entradras, por favor tirar su cabello hacia atrás para poder apreciar de mejor manera su complicación.</p>
                <div class="text-center">
                    <%--<img src="../Styles/img/Fotografias.PNG" />--%>
                </div>
                <br />
                <br />
                    <div class="text-center">
                        <div class="row">
                            <div class="col-sm">
                                <button type="button" data-toggle="modal" data-target="#ModalArriba" style="background: #BAD305; border: 0; padding: 10px 35px; color: #fff; transition: 0.4s; border-radius: 50px;">Desde Arriba</button>
                                <input type="text"  id="fotoArriba" name="fotoArriba" value="" hidden/>
                            </div>
                            <div class="col-sm">
                                <button type="button" data-toggle="modal" data-target="#ModalIzquierdo" style="background: #BAD305; border: 0; padding: 10px 35px; color: #fff; transition: 0.4s; border-radius: 50px;">Perfil Izquierdo</button>
                                <input type="text"  id="fotoIzquierdo" name="fotoIzquierdo" value="" hidden/>
                            </div>
                            <div class="col-sm">
                                <button type="button" data-toggle="modal" data-target="#ModalDerecho" style="background: #BAD305; border: 0; padding: 10px 35px; color: #fff; transition: 0.4s; border-radius: 50px;">Perfil Derecho</button>
                                <input type="text"  id="fotoDerecho" name="fotoDerecho" value="" hidden/>
                            </div>
                        </div>
                        <div class="row" style="    margin-top: 2pc;">
                            <div class="col-sm">
                                <button type="button" data-toggle="modal" data-target="#ModalAtras" style="background: #BAD305; border: 0; padding: 10px 35px; color: #fff; transition: 0.4s; border-radius: 50px;">De Atrás</button>
                                <input type="text"  id="fotoAtras" name="fotoAtras" value="" hidden/>
                            </div>
                            <div class="col-sm">
                                <button type="button" data-toggle="modal" data-target="#ModalFrente" style="background: #BAD305; border: 0; padding: 10px 35px; color: #fff; transition: 0.4s; border-radius: 50px;">De Frente</button>
                                <input type="text"  id="fotoFrente" name="fotoFrente" value="" hidden/>
                            </div>
                        </div>
                    </div>
                <br />
                <br />

    <%--        <div class="mb-3">
                <div class="loading">Loading</div>
                <div class="error-message"></div>
                <div class="sent-message">Your booking request was sent. We will call back or send an Email to confirm your reservation. Thank you!</div>
              </div>--%>
                </div>
          </div>
                                            <%-- Por donde nos contactamos? --%>
            <div id="divPaso4" class="card" style="border-radius: 10px">
              <div class="card-body">
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
<%--                <div class="col">
                    <img width="50" height="50" src="../../Styles/img/whatsapp.png" />
                    <br />
                    <div class="custom-control custom-checkbox" style="margin-right: 40px;">
                      <input type="checkbox" class="custom-control-input" id="customCheck3">
                      <label class="custom-control-label" for="customCheck3"></label>
                        <a hidden id="btnWsp" class="button" href="https://api.whatsapp.com/send?phone=56953306060&text=Quiero que me contecten por favor." target="_blank">https://api.whatsapp.com/send?phone=56953306060&text=Quiero</a>
                    </div>
                </div>--%>
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
          <div class="text-center">
              <div class="row" style="    margin-top: 2pc;">
                  <div class="col-sm">
                      <button disabled id="btnAtras" type="button" style="background: #BAD305; border: 0; padding: 10px 35px; color: #fff; transition: 0.4s; border-radius: 50px;">Atrás</button>
                        
                  </div>
                  <div class="col-sm">
                    <br />    
                  </div>
                  <div class="col-sm">
                      <button id="btnSiguiente"type="button" style="background: #BAD305; border: 0; padding: 10px 35px; color: #fff; transition: 0.4s; border-radius: 50px;">Siguiente</button>
                      <button id="btnEnviar" type="submit" style="background: #BAD305;border: 0; padding: 10px 35px;color: #fff;transition: 0.4s;border-radius: 50px;">Enviar</button>
                  </div>
              </div>
            </div>
                                            <input id="inputGuardarDatos" hidden value="false" />
                                            <input id="idCliente" name="idCliente"  value="<%= ViewData["idCliente"] %>" hidden />
                                            <input id="idSolicitud2" name="idSolicitud2" value="<%= ViewData["idSolicitud"] %>" hidden />

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
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
           
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
