<%@ Page Title="" Language="C#" MasterPageFile="~/Views/DisenoBootstrap3.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">

    <script src="https://unpkg.com/gijgo@1.9.13/js/gijgo.min.js" type="text/javascript"></script>
    <link href="https://unpkg.com/gijgo@1.9.13/css/gijgo.min.css" rel="stylesheet" type="text/css" />
    <script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.11.1/jquery.validate.min.js"></script>

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
    <%-- Pasos --%>
    <script>
        $(document).ready(function () {
            var cont = 0;
            $('#btnEnviar').hide();
            $("#divPaso2").hide();
            $("#divPaso3").hide();
            $("#btnSiguiente").click(function () {
                $("#divPaso1").hide(500);
                $("#divPaso2").show(500);
                cont++;
                if (cont == 2) {
                    $("#baraDeCarga").css("width", "99%");
                    $("#divPaso2").hide(500);
                    $("#divPaso3").show(500);
                    $('#btnSiguiente').hide();
                    $('#btnEnviar').show();
                } else {
                    $("#baraDeCarga").css("width", "66%");
                    $("#divPaso1").hide(500);
                    $("#divPaso2").show(500);
                    $('#btnAtras').removeAttr('disabled');
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

                } else {
                    $("#baraDeCarga").css("width", "66%");
                    $("#divPaso2").show(500);
                    $("#divPaso3").hide(500);
                    $('#btnSiguiente').show();
                    $('#btnEnviar').hide();
                    $('#btnSiguiente').removeAttr('disabled');
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
    </script>

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

</style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
      <!-- ======= Hero Section ======= -->
  <section class="d-flex align-items-center">

      <div class="video-header wrap">
          <div class="fullscreen-video-wrap">
            <video playsinline="playsinline" autoplay="autoplay" muted="muted" loop="loop" style="filter: brightness(0.5);object-fit: scale-down; max-width: 100%; height: auto; background-color: black;">
                <source src="../../assets/video/tempora.mp4" type="video/mp4">
            </video>
          </div>
          <div class="header-overlay">
              <div class="headera-content">
            <div class="container position-relative text-center text-lg-left" data-aos="zoom-in" data-aos-delay="100">
          <h1>Bienvenido a <span style="color: #BAD305">Tempora</span></h1>
          <h4 style="color: #BAD305">Portal de solicitudes</h4>
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
<main id="main">
            <form action="<%: Url.Content("~/Home/Index") %>" method="post" enctype="multipart/form-data" id="formSolicitud" class="needs-validation" novalidate>

    <!-- ======= About Section ======= -->
    <section id="about" class="about">
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
    </section><!-- End About Section -->

    <!-- ======= Pasos a seguir ======= -->
    <section id="why-us" class="why-us">
      <div class="container" data-aos="fade-up">

        <div class="section-title">
          <h2>Pasos a seguir</h2>
          <p>¿Desea una evaluación sin costo?</p>
        </div>

        <div class="row">

          <div class="col-lg-4">
            <div class="box" data-aos="zoom-in" data-aos-delay="100">
              <span>01</span>
              <h4>Solicitar evaluación</h4>
              <p>Para poder solicitar una evaluación gratis, sólo debe completar el formulario de solicitud siguiente.</p>
            </div>
          </div>

          <div class="col-lg-4 mt-4 mt-lg-0">
            <div class="box" data-aos="zoom-in" data-aos-delay="200">
              <span>02</span>
              <h4>Evaluación médica</h4>
              <p>Un profesional de nuestra clínica le entregará una propuesta para su solicitud. Si usted lo desea, podrá agendar una hora para el procedimiento adecuado.</p>
            </div>
          </div>

          <div class="col-lg-4 mt-4 mt-lg-0">
            <div class="box" data-aos="zoom-in" data-aos-delay="300">
              <span>03</span>
              <h4>Procedimiento médico</h4>
              <p>Al asistir a la clínica según la hora agendada, usted recibirá el mejor procedimiento para su caso. Poosteriormente, usted seguirá recibiendo páginas personalizadas para su caso.</p>
            </div>
          </div>

        </div>

      </div>
    </section><

    <!-- ======= Events Section ======= -->
    <section id="events" class="events">
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
    </section><!-- End Events Section -->

    <!-- ======= Book A Table Section ======= -->

    <section id="book-a-table" class="book-a-table">
      <div class="container" data-aos="fade-up">

        <div class="section-title">
          <h2>Evaluación Médica</h2>
          <p>¡Solicita tu evaluación en sólo 3 pasos!</p>
            <div class="progress">
              <div id="baraDeCarga" class="progress-bar" role="progressbar" style="width: 33%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
            </div>
        </div>
<%--        <form action="<%: Url.Content("~/Home/Index") %>" method="post" role="form" class="php-email-form" data-aos="fade-up" data-aos-delay="100">--%>
         <%--  Paso 1 --%>
            <div id="divPaso1">
                <h3>Primer Paso: Información Personal</h3>
                <div class="form-row">
                    <div class="col-lg-6 col-md-6 form-group">
                        <input type="text" id="txtNombre" name="txtNombre" class="form-control" placeholder="Nombre" data-rule="minlen:1" data-msg="Please enter at least 4 chars" required>
                        <div class="invalid-feedback">
                            Por favor ingrese su nombre
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6 form-group">
                        <input type="text" id="txtApellido" name="txtApellido" class="form-control" placeholder="Apellido" data-rule="minlen:4" data-msg="Please enter at least 4 chars" required>
                        <div class="invalid-feedback">
                           Por favor ingrese su apellido
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6 form-group">
                        <input type="text" class="form-control" name="txtRut" id="txtRut" placeholder="Rut" required>
                        <div class="invalid-feedback">
                            Por favor ingrese su rut
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6 form-group">
                        <input type="email" class="form-control" name="txtEmail" id="txtEmail" placeholder="Correo" data-rule="email" data-msg="Please enter a valid email" required>
                        <div class="invalid-feedback">
                            Por favor ingrese su correo
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6 form-group">
                        <input type="text" class="form-control" name="txtTelefono" id="txtTelefono" placeholder="Teléfono" data-rule="minlen:4" data-msg="Please enter at least 4 chars" required>
                        <div class="invalid-feedback">
                            Por favor ingrese su telefono
                        </div>
                    </div>
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
          <%--  Paso 2 --%>
            <div id="divPaso2">
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
        <%-- Paso 3 --%>
            <div id="divPaso3">
                <h3>Tercer Paso: Fotografías</h3>
                <p>Estas fotografías deben ser tomadas en un lugar con luz natural, sin flash y con la cámara trasera de su cámara o celular, no con la camara frontal, debido a que la calidad de imagen se ve afectada.</p>
                <p>Es ideal que otra persona le ayude a tomar estas fotografías, posicionandose a un metro de distacia y no en modo selfie.</p>
                <p>El siguiente esquema muestra los ángulos en que se debe fotografiar. En el caso de que su zona a evaluar sean las entradras, por favor tirar su cabello hacia atrás para poder apreciar de mejor manera su complicación.</p>
                <div class="text-center">
                    <%--<img src="../Styles/img/Fotografias.PNG" />--%>
                </div>
                <br />
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
                        <br />
                        <br />
                        <div class="row">
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
          <div class="text-center">
              <div class="row">
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

 
<!-- End Chefs Section -->

    <!-- ======= Contact Section ======= -->
    <section id="contact" class="contact">
      <div class="container" data-aos="fade-up">

        <div class="section-title">
          <h2>Contacto</h2>
          <p>Ubicación</p>
        </div>
      </div>

      <div data-aos="fade-up">
        <iframe style="border:0; width: 100%; height: 350px;" src="https://maps.google.com/maps?q=Cl%C3%ADnica%20T%C3%A9mpora%20-%20Implante%20Capilar%20-%20Suecia,%20Providencia,%20Chile&t=&z=17&ie=UTF8&iwloc=&output=embed" frameborder="0" allowfullscreen></iframe>
      </div>
<%--<div class="mapouter"><div class="gmap_canvas"><iframe width="1033" height="310" id="gmap_canvas" src="https://maps.google.com/maps?q=Cl%C3%ADnica%20T%C3%A9mpora%20-%20Implante%20Capilar%20-%20Suecia,%20Providencia,%20Chile&t=&z=17&ie=UTF8&iwloc=&output=embed" frameborder="0" scrolling="no" marginheight="0" marginwidth="0"></iframe><a href="https://embedgooglemap.net/maps/24"></a><br><style>.mapouter{position:relative;text-align:right;height:310px;width:1033px;}</style><a href="https://www.embedgooglemap.net">google maps generator</a><style>.gmap_canvas {overflow:hidden;background:none!important;height:310px;width:1033px;}</style></div></div>--%>
      <div class="container" data-aos="fade-up">


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
