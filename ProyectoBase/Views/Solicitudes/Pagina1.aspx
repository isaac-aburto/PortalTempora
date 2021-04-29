<%@ Page Title="" Language="C#" MasterPageFile="~/Views/DisenoBootstrap3.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
   
    

	<link rel="stylesheet" href="<%: Url.Content("~/assets/css/examples.css")%>" type="text/css">
        <link rel="stylesheet" href="<%: Url.Content("~/assets/css/normalize.css")%>" type="text/css">
	<link rel="shortcut icon" href="<%: Url.Content("~/assets/img/favicon.ico")%>" type="image/x-icon">
    <script type="text/javascript" src="<%: Url.Content("~/assets/js/lib/jquery.min.js") %>"></script>
	<script type="text/javascript" src="<%: Url.Content("~/Styles/js/highlight.pack.js") %>"></script>
	<script type="text/javascript" src="<%: Url.Content("~/Styles/js/modernizr.custom.min.js") %>"></script>
	<script type="text/javascript" src="<%: Url.Content("~/Styles/js/examples.js") %>"></script>
	
	<script type="text/javascript" src="<%: Url.Content("~/Styles/js/gsap3/gsap.min.js")%>"></script>
	<script type="text/javascript" src="<%: Url.Content("~/Styles/scrollmagic/uncompressed/ScrollMagic.js")%>"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.6.1/ScrollTrigger.min.js"></script>
	<script type="text/javascript" src="<%: Url.Content("~/Styles/scrollmagic/uncompressed/plugins/animation.gsap.js")%>"></script>
	<script type="text/javascript" src="<%: Url.Content("~/Styles/scrollmagic/uncompressed/plugins/debug.addIndicators.js")%>"></script>




    <%-- Video CSS/Script --%>
    <style>
        .contenedor{
            position: relative;
            display: inline-block;
            text-align: center;
        }
        .centrado{
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
        }
        headera {
          position: relative;
          background-color: black;
          height: 75vh;
          min-height: 25rem;
          width: 100%;
          overflow: hidden;
        }

        headera video {
          position: absolute;
          top: 50%;
          left: 50%;
          min-width: 100%;
          min-height: 100%;
          width: auto;
          height: auto;
          z-index: 0;
          -ms-transform: translateX(-50%) translateY(-50%);
          -moz-transform: translateX(-50%) translateY(-50%);
          -webkit-transform: translateX(-50%) translateY(-50%);
          transform: translateX(-50%) translateY(-50%);
        }

        headera .container {
          position: relative;
          z-index: 2;
        }

        headera .overlay {
          position: absolute;
          top: 0;
          left: 0;
          height: 100%;
          width: 100%;
          background-color: black;
          opacity: 0.5;
          z-index: 1;
        }

        @media (pointer: coarse) and (hover: none) {
          headera {
            background: url('https://source.unsplash.com/XT5OInaElMw/1600x900') black no-repeat center center scroll;
          }
          headera video {
            display: none;
          }
        }
    </style>
    <style type="text/css">
		.digit {
			opacity: 0;
			-webkit-transform: translateX(-40px);
					-moz-transform: translateX(-40px);
					-ms-transform: translateX(-40px);
						-o-transform: translateX(-40px);
							transform: translateX(-40px);
			-webkit-transition: all 0.6s ease-out;
					-moz-transition: all 0.6s ease-out;
					-ms-transition: all 0.6s ease-out;
						-o-transition: all 0.6s ease-out;
							transition: all 0.6s ease-out;
		}
		.digit.visible {
			opacity: 1;
			-webkit-transform: none;
					-moz-transform: none;
					-ms-transform: none;
						-o-transform: none;
							transform: none;
		}
		.digit:nth-child(2) {
			margin-top: 50px;
		}
		.digit:nth-child(3) {
			margin-top: 100px;
		}
		.digit:nth-child(4) {
			margin-top: 150px;
		}
		.digit:nth-child(5) {
			margin-top: 200px;
		}
	</style>
    <style>
        .rectangulo {
            width: 60px; 
            height: 20px; 
            background: #808080;
        }
    </style>
    <script>
        // Get the video
        var video = document.getElementById("myVideo");

        // Get the button
        var btn = document.getElementById("myBtn");

        // Pause and play the video, and change the button text
        function myFunction() {
            if (video.paused) {
                video.play();
                btn.innerHTML = "Pause";
            } else {
                video.pause();
                btn.innerHTML = "Play";
            }
        }
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">


      <!-- ======= Hero Section ======= -->
<main id="main" style="background-color: white;">
    <div class="position-relative text-center text-lg-left"  style="background-color: #C4D600">
        <br />
        <br />
        <br />
        <br />
        <br />
            <div class="row  text-center " data-aos="zoom-in" data-aos-delay="100">
                <div class="" style="margin-left: 9pc;">
                    <h1 class="display-3">¡Regina Chin tenemos el plan perfecto para usted!</h1>
                </div>
            </div>
        <br />
        <br />
    </div>

    <%-- Video --%>
    <div class="contenedor">

        <div class="headera">
          <div class="fullscreen-video-wrap">
            <video playsinline="playsinline" autoplay="autoplay" muted="muted" loop="loop">
                <source src="../../assets/video/tempora.mp4" type="video/mp4">
            </video>
          </div>
            <div class="container h-100">
                <div class="d-flex h-100 text-center align-items-center">
                    <div class="w-100 text-white">
                        <div id="content-wrapper">
		                    <div id="example-wrapper">
			                    <div class="scrollContent">
				                    <section class="demo">
					                    <div class="spacer s2"></div>
                                        <div class="container position-relative text-center text-lg-left" data-aos="zoom-in" data-aos-delay="100">
                                            <div class="row">
                                            <div class="col-lg-8">
                                                <h1 class="digit" style="color: black">Según nuestro análisis capilar, usted padece de <span style="color: #BAD305">Alopecia Androgenética</span></h1>
                                                <h4 class="digit" style="color: dimgray">Aunque los patrones de calvicie en los hombres y en las mujeres son diferentes, amnbos tienen una causa genética común. La calvicie de patrón femenino se caracteriza por la pédidad de cabello en la parte superior y la coronilla de la cabeza. Esta pérdidad de cabello en las mujeres suele comenzar en la parte central sin afectar la línea frontal.</h4>
                                            </div>
                                            </div>
                                        </div>
                                        <script>
                                            // build scenes
                                            var revealElements = document.getElementsByClassName("digit");
                                            for (var i = 0; i < revealElements.length; i++) { // create a scene for each element
                                                new ScrollMagic.Scene({
                                                    triggerElement: revealElements[i], // y value not modified, so we can use element as trigger as well
                                                    offset: 50,												 // start a little later
                                                    triggerHook: 0.9,
                                                })
                                                    .setClassToggle(revealElements[i], "visible") // add class toggle
                                                    .addIndicators({ name: "digit " + (i + 1) }) // add indicators (requires plugin)
                                                    .addTo(controller);
                                            }
                                        </script>
				                    </section>
				                    <section class="demo">
					                    <div class="spacer s2"></div>
					                    <div id="trigger2" class="spacer s0"></div>
					                    <div id="pin2">
                                        <div class="container " data-aos="zoom-in" data-aos-delay="100">
                                            <div class="row">
                                            <div class="col-md-8 col-md-offset-2">
                                                <div class="row">
                                                    <img width="50" height="50" src="https://smilefreshcafe.github.io/img/call.png"/>
                                                </div>
                                                 <div class="row align-self-end">
                                                    <br />
                                                  </div>
                                                <div class="row align-self-end">

                                                    <img width="50" height="50" src="https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Facebook_Logo_%282019%29.png/240px-Facebook_Logo_%282019%29.png"/>
                                                </div>
                                                <div class="row">
                                                    <br />
                                                </div>
                                                <div class="row align-self-end">

                                                    <img width="50" height="50" src="https://logodownload.org/wp-content/uploads/2015/04/whatsapp-logo-1.png"/>
                                                </div>
                                            </div>
                                            </div>
                                        </div>
					                    </div>
					                    <div class="spacer s2"></div>
					                    <script>
                                            $(function () { // wait for document ready
                                                // build scene
                                                var scene = new ScrollMagic.Scene({ triggerElement: "#pin2"})
                                                    .setPin("#pin2")
                                                    .addIndicators({ name: "2 (duration: 0)" }) // add indicators (requires plugin)
                                                    .addTo(controller);
                                            });
                                        </script>
			                        </section>	
		                        </div>
	                        </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>



    <div id="hola" class="content">
        <h1>Hoooola</h1>

    </div>
    <script>
        gsap.to('#hola', { opacity: 0, duration: 1, y: -50, ease: 'elastic(1. 0.3)', scrollTrigger: '#hola', x:500})
    </script>

    <%-- Fondo Estático --%>
    <%--<div class="scrollContent">
	<section class="demo">
		<style type="text/css">
			.parallaxParent {
				height: 100vh;
				overflow: hidden;
			}
			.parallaxParent > * {
				height: 200%;
				position: relative;
				top: -100%;
			}
		</style>
		<div class="spacer s0"></div>
		<div id="parallax1" class="parallaxParent">
			<div style="background-image: url(../../assets/img/imagen_fondo_3.jpg);"></div>
            <a>aaaaaaaa</a>
		</div>
		<script>
            // init controller
            var controller2 = new ScrollMagic.Controller({ globalSceneOptions: { triggerHook: "onEnter", duration: "200%" } });

            // build scenes
            new ScrollMagic.Scene({ triggerElement: "#parallax1" })
                .setTween("#parallax1 > div", { y: "100%", ease: Linear.easeNone })
                .addIndicators()
                .addTo(controller2);
        </script>
	</section>
	<div class="spacer s_viewport"></div>
</div>--%>

    
    <%-- Contenedor principal --%>

    <br />
    <div id="content-wrapper">
		<div id="example-wrapper">
			<div class="scrollContent">
				<section class="demo">
					<div class="spacer s2"></div>
					<div class="spacer s0" id="trigger"></div>
					<div id="imagesequence">
						<img id="myimg"/>
                        <br>
					</div>
					<div class="spacer s2"></div>
					<script>
                        // define images
                        var images = [
                            "../../assets/img/1.png",
                            "../../assets/img/2.png",
                            "../../assets/img/3.png",
                            "../../assets/img/4.png",
                            "../../assets/img/5.png",
                            "../../assets/img/6.png",
                            "../../assets/img/8.png",
                            "../../assets/img/9.png",
                            "../../assets/img/10.png",
                        ];

                        // TweenMax can tween any property of any object. We use this object to cycle through the array
                        var obj = { curImg: 0 };

                        // create tween
                        var tween = TweenMax.to(obj, 0.5,
                            {
                                curImg: images.length - 1,	// animate propery curImg to number of images
                                roundProps: "curImg",				// only integers so it can be used as an array index
                                /*repeat: 3,*/									// repeat 3 times
                                immediateRender: true,			// load first image automatically
                                ease: Linear.easeNone,			// show every image the same ammount of time
                                onUpdate: function () {
                                    $("#myimg").attr("src", images[obj.curImg]); // set the image source
                                }
                            }
                        );

                        // init controller
                        var controller = new ScrollMagic.Controller();

                        // build scene
                        var scene = new ScrollMagic.Scene({ triggerElement: "#trigger", duration: 500 })
                            .setTween(tween)
                            .addIndicators() // add indicators (requires plugin)
                            .addTo(controller);

                        // handle form change
                        $("form.move input[name=duration]:radio").change(function () {
                            scene.duration($(this).val());
                        });
                    </script>
				</section>
				<div class="spacer s_viewport"></div>
			</div>
		</div>
	</div>
    <section class="demo">
	    <div id="reveal-elements" >
		    <div class="digit ">
                <div class="position-relative text-center text-lg-left" data-aos="zoom-in" data-aos-delay="100" style="background-color: #C4D600; margin-left: -3pc;">
                <br />
                <br />
                    <div class="row  text-center " data-aos="zoom-in" data-aos-delay="100">
                        <div class="col-lg-8" style="    margin-left: 22pc;">
                            <h1 >Preguntas Frecuentes</h1>
                            <h5><a style="color:white !important" data-toggle="collapse" data-target="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
                                ¿Qué es un implante capilar?
                            </a></h5>
                            <h6 class="collapse" id="collapseExample">
                                Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident.
                            </h6>
                            <h5><a style="color:white !important" data-toggle="collapse" href="#collapseExample2" role="button" aria-expanded="false" aria-controls="collapseExample">
                                ¿Qué es una unidad folicular?
                            </a></h5>
                            <h6 class="collapse" id="collapseExample2">
                                Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident.
                            </h6>
                            <h5><a style="color:white !important" data-toggle="collapse" href="#collapseExample3" role="button" aria-expanded="false" aria-controls="collapseExample">
                                ¿Quienes pueden someterse a un implante capilar?
                            </a></h5>
                            <h6 class="collapse" id="collapseExample3">
                                Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident.
                            </h6>


                            <div class="form-group">
                            <h5>
                                <a style="color:white !important" data-toggle="collapse" href="#collapseExample4" role="button" aria-expanded="false" aria-controls="collapseExample">
                                    ¿Cuánto tiempo dura la cirugía?
                                </a>
                            </h5>
                            <div id="collapseExample4" class="collapse">
                                <h6>
                                    Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident.
                                </h6>
                            </div>
                            </div>

                            <br />
                        </div>
                    </div>
                </div>
                <br />
                <br /> 
		    </div>

            <%-- Valor estimado --%>
		    <div class=" digit ">
                <div class="position-relative text-center text-lg-left">
                <br />
                <br />
                    <div class="row  text-center " data-aos="zoom-in" data-aos-delay="100">
                        <div class="col-lg-8" style="    margin-left: 21pc;">
                                <h1 style="color: black ">Valor Estimado de su tratamiento</h1>
                            <br />
                        </div>
                    </div>
                </div>

		    </div>
            <div class="row" style=" margin-left: 15pc;">
                <div class="col">
                    <div class=" digit ">
                        <div class="card" style="width: 18rem; border-color: white;">
                            <div class="card-body" style="background-color: #C4D600; border-radius: 40px 10px; border-color: white">
                                <h5 class="card-title">100 Fóliculos</h5>
                                <h6 class="card-subtitle mb-2 text-muted">Card subtitle</h6>
                                <p style="color: white" class="card-text">[Valor total]</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="rectangulo digit" style="margin-top: 4pc; margin-left: 7pc; margin-bottom: 5pc;"></div>
                </div>
                <div class="col">
                    <div class=" digit ">
                        <div class="card" style="width: 18rem; border-color: white;">
                            <div class="card-body" style="background-color: #C4D600; border-radius: 40px 10px; border-color: white">
                                <h5 class="card-title">100 Fóliculos</h5>
                                <h6 class="card-subtitle mb-2 text-muted">Card subtitle</h6>
                                <p style="color: white" class="card-text">[Valor total]</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
	    </div>
	    <script>
            // build scenes
            var revealElements = document.getElementsByClassName("digit");
            for (var i = 0; i < revealElements.length; i++) { // create a scene for each element
                new ScrollMagic.Scene({
                    triggerElement: revealElements[i], // y value not modified, so we can use element as trigger as well
                    offset: 50,												 // start a little later
                    triggerHook: 0.9,
                })
                    .setClassToggle(revealElements[i], "visible") // add class toggle
                    .addIndicators({ name: "digit " + (i + 1) }) // add indicators (requires plugin)
                    .addTo(controller);
            }
        </script>

	<script type="text/javascript" src="<%: Url.Content("~/Styles/js/tracking.js")%>"></script>	
</main><!-- End #main -->
</asp:Content>
