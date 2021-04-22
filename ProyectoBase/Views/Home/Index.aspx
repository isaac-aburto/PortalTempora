<%@ Page Title="" Language="C#" MasterPageFile="~/Views/DisenoBootstrap3.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">

        <script src="https://unpkg.com/gijgo@1.9.13/js/gijgo.min.js" type="text/javascript"></script>
    <link href="https://unpkg.com/gijgo@1.9.13/css/gijgo.min.css" rel="stylesheet" type="text/css" />

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
            $("#btnCapturar").click(function () {
                Webcam.snap(function (data_uri) {
                    // display results in page
                    var x = "300";
                    var y = "100";
                    document.getElementById('idcaptured').innerHTML =
                        '<img width="320" height="185" src="' + data_uri + '"/>';
                });
            });
        });
    </script>
    <script>
        $(document).ready(function () {
            $("#divCamara1").hide();
            $("#Camara1").click(function () {
                $("#divCamara1").show();
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

    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">


      <!-- ======= Hero Section ======= -->
  <section class="d-flex align-items-center">

      <div class="video-header wrap">
          <div class="fullscreen-video-wrap">
            <video playsinline="playsinline" autoplay="autoplay" muted="muted" loop="loop">
                <source src="../../assets/video/tempora.mp4" type="video/mp4">
            </video>
          </div>
          <div class="header-overlay">
              <div class="header-content">
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
        <form action="<%: Url.Content("~/Home/Index") %>" method="post">
<%--        <form action="<%: Url.Content("~/Home/Index") %>" method="post" role="form" class="php-email-form" data-aos="fade-up" data-aos-delay="100">--%>
         <%--  Paso 1 --%>
            <div id="divPaso1">
                <h3>Primer Paso: Información Personal</h3>
                <div class="form-row">
                    <div class="col-lg-6 col-md-6 form-group">
                        <input type="text" id="txtNombre" name="txtNombre" class="form-control" placeholder="Nombre" data-rule="minlen:1" data-msg="Please enter at least 4 chars">
                        <div class="validate"></div>
                    </div>
                    <div class="col-lg-6 col-md-6 form-group">
                        <input type="text" id="txtApellido" name="txtApellido" class="form-control" placeholder="Apellido" data-rule="minlen:4" data-msg="Please enter at least 4 chars">
                        <div class="validate"></div>
                    </div>
                    <div class="col-lg-6 col-md-6 form-group">
                        <input type="text" class="form-control" name="txtRut" id="txtRut" placeholder="Rut">
                        <div class="validate"></div>
                    </div>
                    <div class="col-lg-6 col-md-6 form-group">
                        <input type="email" class="form-control" name="txtEmail" id="txtEmail" placeholder="Correo" data-rule="email" data-msg="Please enter a valid email">
                        <div class="validate"></div>
                    </div>
                    <div class="col-lg-6 col-md-6 form-group">
                        <input type="text" class="form-control" name="txtTelefono" id="txtTelefono" placeholder="Teléfono" data-rule="minlen:4" data-msg="Please enter at least 4 chars">
                        <div class="validate"></div>
                    </div>
                    <div class="col-lg-6 col-md-6 form-group">
                        <input type="text" class="form-control" name="txtCelular" id="txtCelular" placeholder="Celular" data-rule="minlen:4" data-msg="Please enter at least 4 chars">
                        <div class="validate"></div>
                    </div>
                    <div class="col-lg-6 col-md-6 form-group">
                        <input id="txtFechaNacimiento" placeholder="Fecha de nacimiento" name="txtFechaNacimiento" />
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
                <div class="custom-control custom-radio custom-control-inline">
                  <input type="radio" id="chkDermaSi" name="chkDermaSi" class="custom-control-input">
                  <label class="custom-control-label" for="chkDermaSi">Sí</label>
                </div>
                <div class="custom-control custom-radio custom-control-inline">
                  <input type="radio" id="chkDermaNo" name="chkDermaSi" class="custom-control-input">
                  <label class="custom-control-label" for="chkDermaNo">No</label>
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
                  <input type="radio" id="chkPeloSi" name="chkPeloSi" class="custom-control-input">
                  <label class="custom-control-label" for="chkPeloSi">
                      Sí
                  </label>
                </div>
                <div class="custom-control custom-radio custom-control-inline">
                  <input type="radio" id="chkPeloNo" name="chkPeloNo" class="custom-control-input">
                  <label class="custom-control-label" for="chkPeloNo">
                      No
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
                            </div>
                            <div class="col-sm">
                                <button type="button" data-toggle="modal" data-target="#ModalIzquierdo" style="background: #BAD305; border: 0; padding: 10px 35px; color: #fff; transition: 0.4s; border-radius: 50px;">Perfil Izquierdo</button>
                            </div>
                            <div class="col-sm">
                                <button type="button" data-toggle="modal" data-target="#ModalDerecho" style="background: #BAD305; border: 0; padding: 10px 35px; color: #fff; transition: 0.4s; border-radius: 50px;">Perfil Derecho</button>
                            </div>
                        </div>
                        <br />
                        <br />
                        <div class="row">
                            <div class="col-sm">
                                <button type="button" data-toggle="modal" data-target="#ModalAtras" style="background: #BAD305; border: 0; padding: 10px 35px; color: #fff; transition: 0.4s; border-radius: 50px;">De Atrás</button>
                            </div>
                            <div class="col-sm">
                                <button type="button" data-toggle="modal" data-target="#ModalFrente" style="background: #BAD305; border: 0; padding: 10px 35px; color: #fff; transition: 0.4s; border-radius: 50px;">De Frente</button>
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
                      <button id="btnSiguiente"type="button" style="background: #BAD305; border: 0; padding: 10px 35px; color: #fff; transition: 0.4s; border-radius: 50px;">Siguiente</button>
                      <button id="btnEnviar" type="submit" style="background: #BAD305;border: 0; padding: 10px 35px;color: #fff;transition: 0.4s;border-radius: 50px;">Enviar</button>
                  </div>
              </div>
        </div>
        </form>
      </div>
    </section>
       
        <!-- End Book A Table Section -->

    <!-- ======= Testimonials Section ======= -->
<%--    <section id="testimonials" class="testimonials section-bg">
      <div class="container" data-aos="fade-up">

        <div class="section-title">
          <h2>Testimonials</h2>
          <p>What they're saying about us</p>
        </div>--%>

        <%--<div class="owl-carousel testimonials-carousel" data-aos="zoom-in" data-aos-delay="100">

          <div class="testimonial-item">
            <p>
              <i class="bx bxs-quote-alt-left quote-icon-left"></i>
              Proin iaculis purus consequat sem cure digni ssim donec porttitora entum suscipit rhoncus. Accusantium quam, ultricies eget id, aliquam eget nibh et. Maecen aliquam, risus at semper.
              <i class="bx bxs-quote-alt-right quote-icon-right"></i>
            </p>
            <img src="Styles/img/testimonials/testimonials-1.jpg" class="testimonial-img" alt="">
            <h3>Saul Goodman</h3>
            <h4>Ceo &amp; Founder</h4>
          </div>

          <div class="testimonial-item">
            <p>
              <i class="bx bxs-quote-alt-left quote-icon-left"></i>
              Export tempor illum tamen malis malis eram quae irure esse labore quem cillum quid cillum eram malis quorum velit fore eram velit sunt aliqua noster fugiat irure amet legam anim culpa.
              <i class="bx bxs-quote-alt-right quote-icon-right"></i>
            </p>
            <img src="Styles/img/testimonials/testimonials-2.jpg" class="testimonial-img" alt="">
            <h3>Sara Wilsson</h3>
            <h4>Designer</h4>
          </div>

          <div class="testimonial-item">
            <p>
              <i class="bx bxs-quote-alt-left quote-icon-left"></i>
              Enim nisi quem export duis labore cillum quae magna enim sint quorum nulla quem veniam duis minim tempor labore quem eram duis noster aute amet eram fore quis sint minim.
              <i class="bx bxs-quote-alt-right quote-icon-right"></i>
            </p>
            <img src="Styles/img/testimonials/testimonials-3.jpg" class="testimonial-img" alt="">
            <h3>Jena Karlis</h3>
            <h4>Store Owner</h4>
          </div>

          <div class="testimonial-item">
            <p>
              <i class="bx bxs-quote-alt-left quote-icon-left"></i>
              Fugiat enim eram quae cillum dolore dolor amet nulla culpa multos export minim fugiat minim velit minim dolor enim duis veniam ipsum anim magna sunt elit fore quem dolore labore illum veniam.
              <i class="bx bxs-quote-alt-right quote-icon-right"></i>
            </p>
            <img src="Styles/img/testimonials/testimonials-4.jpg" class="testimonial-img" alt="">
            <h3>Matt Brandon</h3>
            <h4>Freelancer</h4>
          </div>

          <div class="testimonial-item">
            <p>
              <i class="bx bxs-quote-alt-left quote-icon-left"></i>
              Quis quorum aliqua sint quem legam fore sunt eram irure aliqua veniam tempor noster veniam enim culpa labore duis sunt culpa nulla illum cillum fugiat legam esse veniam culpa fore nisi cillum quid.
              <i class="bx bxs-quote-alt-right quote-icon-right"></i>
            </p>
            <img src="Styles/img/testimonials/testimonials-5.jpg" class="testimonial-img" alt="">
            <h3>John Larson</h3>
            <h4>Entrepreneur</h4>
          </div>

        </div>--%>

<%--      </div>
    </section>--%><!-- End Testimonials Section -->

    <!-- ======= Gallery Section ======= -->
  <%--  <section id="gallery" class="gallery">

      <div class="container" data-aos="fade-up">
        <div class="section-title">
          <h2>Gallery</h2>
          <p>Some photos from Our Restaurant</p>
        </div>
      </div>

      <div class="container-fluid" data-aos="fade-up" data-aos-delay="100">

        <div class="row no-gutters">

          <div class="col-lg-3 col-md-4">
            <div class="gallery-item">
              <a href="Styles/img/gallery/gallery-1.jpg" class="venobox" data-gall="gallery-item">
                <img src="Styles/img/gallery/gallery-1.jpg" alt="" class="img-fluid">
              </a>
            </div>
          </div>

          <div class="col-lg-3 col-md-4">
            <div class="gallery-item">
              <a href="Styles/img/gallery/gallery-2.jpg" class="venobox" data-gall="gallery-item">
                <img src="Styles/img/gallery/gallery-2.jpg" alt="" class="img-fluid">
              </a>
            </div>
          </div>

          <div class="col-lg-3 col-md-4">
            <div class="gallery-item">
              <a href="Styles/img/gallery/gallery-3.jpg" class="venobox" data-gall="gallery-item">
                <img src="Styles/img/gallery/gallery-3.jpg" alt="" class="img-fluid">
              </a>
            </div>
          </div>

          <div class="col-lg-3 col-md-4">
            <div class="gallery-item">
              <a href="Styles/img/gallery/gallery-4.jpg" class="venobox" data-gall="gallery-item">
                <img src="Styles/img/gallery/gallery-4.jpg" alt="" class="img-fluid">
              </a>
            </div>
          </div>

          <div class="col-lg-3 col-md-4">
            <div class="gallery-item">
              <a href="Styles/img/gallery/gallery-5.jpg" class="venobox" data-gall="gallery-item">
                <img src="Styles/img/gallery/gallery-5.jpg" alt="" class="img-fluid">
              </a>
            </div>
          </div>

          <div class="col-lg-3 col-md-4">
            <div class="gallery-item">
              <a href="Styles/img/gallery/gallery-6.jpg" class="venobox" data-gall="gallery-item">
                <img src="Styles/img/gallery/gallery-6.jpg" alt="" class="img-fluid">
              </a>
            </div>
          </div>

          <div class="col-lg-3 col-md-4">
            <div class="gallery-item">
              <a href="Styles/img/gallery/gallery-7.jpg" class="venobox" data-gall="gallery-item">
                <img src="Styles/img/gallery/gallery-7.jpg" alt="" class="img-fluid">
              </a>
            </div>
          </div>

          <div class="col-lg-3 col-md-4">
            <div class="gallery-item">
              <a href="Styles/img/gallery/gallery-8.jpg" class="venobox" data-gall="gallery-item">
                <img src="Styles/img/gallery/gallery-8.jpg" alt="" class="img-fluid">
              </a>
            </div>
          </div>

        </div>

      </div>
    </section>--%><!-- End Gallery Section -->

    <!-- ======= Chefs Section ======= -->
    <%--<section id="chefs" class="chefs">
      <div class="container" data-aos="fade-up">

        <div class="section-title">
          <h2>Chefs</h2>
          <p>Our Proffesional Chefs</p>
        </div>

        <div class="row">

          <div class="col-lg-4 col-md-6">
            <div class="member" data-aos="zoom-in" data-aos-delay="100">
              <img src="Styles/img/chefs/chefs-1.jpg" class="img-fluid" alt="">
              <div class="member-info">
                <div class="member-info-content">
                  <h4>Walter White</h4>
                  <span>Master Chef</span>
                </div>
                <div class="social">
                  <a href=""><i class="icofont-twitter"></i></a>
                  <a href=""><i class="icofont-facebook"></i></a>
                  <a href=""><i class="icofont-instagram"></i></a>
                  <a href=""><i class="icofont-linkedin"></i></a>
                </div>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6">
            <div class="member" data-aos="zoom-in" data-aos-delay="200">
              <img src="Styles/img/chefs/chefs-2.jpg" class="img-fluid" alt="">
              <div class="member-info">
                <div class="member-info-content">
                  <h4>Sarah Jhonson</h4>
                  <span>Patissier</span>
                </div>
                <div class="social">
                  <a href=""><i class="icofont-twitter"></i></a>
                  <a href=""><i class="icofont-facebook"></i></a>
                  <a href=""><i class="icofont-instagram"></i></a>
                  <a href=""><i class="icofont-linkedin"></i></a>
                </div>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6">
            <div class="member" data-aos="zoom-in" data-aos-delay="300">
              <img src="Styles/img/chefs/chefs-3.jpg" class="img-fluid" alt="">
              <div class="member-info">
                <div class="member-info-content">
                  <h4>William Anderson</h4>
                  <span>Cook</span>
                </div>
                <div class="social">
                  <a href=""><i class="icofont-twitter"></i></a>
                  <a href=""><i class="icofont-facebook"></i></a>
                  <a href=""><i class="icofont-instagram"></i></a>
                  <a href=""><i class="icofont-linkedin"></i></a>
                </div>
              </div>
            </div>
          </div>

        </div>

      </div>
    </section>--%><!-- End Chefs Section -->

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
                <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
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
                         <input type="button" id="btnCapturar" value="Capturar" style="background: #BAD305;border-radius: 50px;border: 0;color: #fff; margin-right: 78px;"/>
                        </div>
                        <br />
                    </div>
                    <div class="row align-items-center">
                    <div class="col-sm text-center">
                        <button type="button" value="Activar Cámara" id="Camara1" style="background: #BAD305;border: 0; padding: 10px 35px;color: #fff;transition: 0.4s;border-radius: 50px;">Activar Cámara</button>
                    </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                    <button type="button" class="btn btn-primary" data-dismiss="modal" style="background-color: #C6D41D; border-color: #C6D41D;">Guardar Cambios</button>
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
                s
                </div>
                <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary">Save changes</button>
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
                d
                </div>
                <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary">Save changes</button>
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
                f
                </div>
                <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary">Save changes</button>
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
                g
                </div>
                <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary">Save changes</button>
                </div>
            </div>
        </div>
    </div>

  </main><!-- End #main -->
</asp:Content>
