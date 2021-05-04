<%@ Page Title="" Language="C#" MasterPageFile="~/Views/DisenoBootstrap3.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    

<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.6.1/gsap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.6.1/CSSRulePlugin.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.6.1/Draggable.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.6.1/EaselPlugin.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.6.1/MotionPathPlugin.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.6.1/PixiPlugin.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.6.1/TextPlugin.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.6.1/ScrollToPlugin.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.6.1/ScrollTrigger.min.js"></script>

    <%-- scroll magic --%>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/ScrollMagic/2.0.8/ScrollMagic.min.js" integrity="sha512-8E3KZoPoZCD+1dgfqhPbejQBnQfBXe8FuwL4z/c8sTrgeDMFEnoyTlH3obB4/fV+6Sg0a0XF+L/6xS4Xx1fUEg==" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/ScrollMagic/2.0.8/plugins/animation.gsap.js" integrity="sha512-judXDFLnOTJsUwd55lhbrX3uSoSQSOZR6vNrsll+4ViUFv+XOIr/xaIK96soMj6s5jVszd7I97a0H+WhgFwTEg==" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/ScrollMagic/2.0.8/plugins/debug.addIndicators.js" integrity="sha512-mq6TSOBEH8eoYFBvyDQOQf63xgTeAk7ps+MHGLWZ6Byz0BqQzrP+3GIgYL+KvLaWgpL8XgDVbIRYQeLa3Vqu6A==" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/2.1.3/TimelineMax.min.js" integrity="sha512-0xrMWUXzEAc+VY7k48pWd5YT6ig03p4KARKxs4Bqxb9atrcn2fV41fWs+YXTKb8lD2sbPAmZMjKENiyzM/Gagw==" crossorigin="anonymous"></script>
    
<script src="https://unpkg.com/gijgo@1.9.13/js/gijgo.min.js" type="text/javascript"></script>
    <link href="https://unpkg.com/gijgo@1.9.13/css/gijgo.min.css" rel="stylesheet" type="text/css" />
    
    <%-- Scroll suave --%>
<%--    https://cdn.jsdelivr.net/npm/locomotive-scroll@3.5.4/dist/locomotive-scroll.min.js
    <script>
        const locoScroll = new LocomotiveScroll({
            el: document.querySelector(".scrollContainer"),
            smooth: true
        }); 
    </script>
    https://cdn.jsdelivr.net/npm/locomotive-scroll@3.5.4/dist/locomotive-scroll.min.js--%>
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

        .headera h1 {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            font-size: 80px;
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
        <%--<style>
        .intro {
            height: 100vh;
        }
        .intro videoabajo {
            height: 100%;
            width: 100%;
            object-fit: contain;
        }
        .intro h1 {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            font-size: 80px;
        }
            section {
                height: 100vh;
                color: black;
            }
                section h1 {
                    padding-top: 300px;
                    text-align: center;
                    font-size: 80px;
                }
    </style>--%>
<style>
    .punto {
            width: 5px;
        height: 5px;
        background: red;
    }
    .box {
        width: 2000px;
        height: 10px;
        background: grey;
        background-color: #C4D600;
        border-radius: 25px;
    }
    .box2 {
    width: 20px;
    height: 20px;
    background: red;
    background-color: red;
    border-radius: 25px;
    }
    .box3 {

        width: 1000px;
        height: 5px;
        background: grey;
        background-color: #C4D600;

    }
    .box4 {
    width: 2000px;
    height: 10px;
    background: grey;
    background-color: #C4D600;
    border-radius: 25px;
    }
    .box5 {
        width: 1000px;
        height: 5px;
        background: grey;
        background-color: #C4D600;
    }
        .box6 {
    width: 2000px;
    height: 10px;
    background: grey;
    background-color: #C4D600;
    border-radius: 25px;
    }
    .box7 {
        width: 1000px;
        height: 5px;
        background: grey;
        background-color: #C4D600;
    }
    .rectangulo {
        width: 60px; 
        height: 20px; 
        background: #808080;
    }
    .dot {
          height: 25px;
          width: 25px;
          background-color: #C4D600;
          border-radius: 50%;
          display: inline-block;
    }
    .containera {
      height: 100vh;
      position: relative;
    }
    .scaleDowna {
      width: 112vw;
      height: 140vh;
      position: absolute;
      top: 50%;
      left: 50%;
      background-image:url(../../Styles/img/notebook.png);
/*    border-radius: 25px;
      border-color: #C4D600;
      border-style:solid;
      border-width:20px;*/
      padding: 280px; 
      /*background-color: black;*/
      transform-origin: 50% 50%;
    }

    .pantalla {
        background-color: black;
        margin-top: -14pc;
        margin-left: -62px;
        height: 51pc;
        width: 1284px;
    }
    .pantallaabajo {
        background-color: black;
        margin-top: -14pc;
        margin-left: -62px;
        height: 43pc;
        width: 1284px;
    }
</style>

    <%-- Comparación de imagenes --%>
    <style>
        .comparisonSection {
          position: relative;
          padding-bottom: 56.25%; /* to maintain aspect ratio (responsive!) */
        }
        .comparisonImage {
          width: 100%;
          height: 100%;
        }
        .afterImage {
          position: absolute;
          overflow: hidden;
          top: 0;
          transform: translate(100%, 0px);
        }
        .afterImage img {
          transform: translate(-100%, 0px);
        }
        .comparisonImage img {
          width: 100%;
          height: 100%;
          position: absolute;
          top: 0;
        }
    </style>

    <style>
    .scroll-container {  
        position: absolute;  
        overflow: hidden;
        z-index: 10;
        backface-visibility: hidden;
        transform-style: preserve-3d;
        width: 100%;
    }
    </style>
       <%-- Parallax --%>
    <style>
        a {
  color: #555;
  font-weight: 400;
}

.pSection {
  position: relative;
  padding-top: 200px;
  padding-bottom: 300px;
}

.container {
  padding: 20px;
  margin: 0 auto;
  max-width: 1070px;
  position: relative;
  z-index: 1;
}

.pContent {
  width: 99%;
  background-color: rgba(78,152,21,0.8);
  color: white;
  padding: 40px 60px;
}

.pImage {
  width: 70%;
  position: absolute;
  top: 0;
  right: 0;
  max-height: 900px;
}
    </style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
<!-- ======= Hero Section ======= -->
<main id="main" style="background-color: white;">
    <div class="scrollContainer">

    <br />
    <br />
    <br />
    <br />
    <br />
    <%--<div class="intro">
        <h1>hola</h1>
        <div class="videoabajo">
            <video src="../../assets/tempora9sec.mp4" controls="controls" />
        </div>
    </div>--%>
<%--    <section>
        <h1>aaaa</h1>
    </section>--%>

    <div class="headera">
        <h1 style="color: white;">¡<span style="color: #BAD305"><%= ViewData["Nombre"] %></span> tenemos el plan perfecto para usted!.</h1>
        <h1></h1>
        <div class="fullscreen-video-wrap">
            <video playsinline="playsinline" autoplay="autoplay" muted="muted" loop="loop">
                <source src="../../assets/video/tempora.mp4" type="video/mp4">
            </video>
        </div>
    </div>
    <br />
    <br />
    <br />
    <div class="box">
    </div>
    <script>
            gsap.to(".box", {
            scrollTrigger: { trigger: ".box", scrub: true}, // start the animation when ".box" enters the viewport (once)
            x: 500,

        });
    </script>
    <div class="box3">
    </div>
    <script>
        gsap.from(".box3", {
            scrollTrigger: { trigger: ".box3", scrub: true }, // start the animation when ".box" enters the viewport (once)
            x: 500,

        });
    </script>
    <br />

    <br />
    <br />
    <br />
    <br />
    <br />
    <div class="containera" >
      <div class="scaleDowna" data-aos="fade-up">
          <div class="pantalla">
              <video src="../../assets/tempora.mp4" controls="controls" style="height: 719.0px;margin-top: 47px;margin-left: 4.1px;"/>  
          </div>
     <br />
<%--          <h1 class="text1" >Su plan es el siguiente:</h1>
            <br />
            <br />
          <h2 class="text1">Según nuestro análisis capilar, usted padece de <span style="color: #BAD305">Alopecia Androgenética</span>, con una perdida de cabello aproximada a 2000 fóliculos</h2>
          <br />
          <div class="precios">
              <div class="row">
                  <div class="col">
                      <div class="card" style="width: 18rem; border-color: white;">
                        <div class="card-body" style="background-color: #C4D600; border-radius: 40px 10px; border-color: white">
                            <h5 class="card-title">2000 Fóliculos</h5>
                            <h6 class="card-subtitle mb-2 text-muted">3.100.000</h6>
                            <p style="color: white" class="card-text">Pesos Chilenos</p>
                        </div>
                      </div>
                  </div>
                <div class="col">
                    <div class="rectangulo" style="margin-top: 4pc; margin-left: 7pc; margin-bottom: 5pc;"></div>
                </div>
                  <div class="col">
                      <div class="card" style="width: 18rem; border-color: white;">
                        <div class="card-body" style="background-color: #C4D600; border-radius: 40px 10px; border-color: white">
                            <h5 class="card-title">2500 Fóliculos</h5>
                            <h6 class="card-subtitle mb-2 text-muted">3.600.000</h6>
                            <p style="color: white" class="card-text">Pesos Chilenos</p>
                        </div>
                      </div>
                  </div>
              </div>
           </div>--%>
          
      </div>
       
    </div>
        <br />
        <br />
    <br />
    <script>
        gsap.set(".scaleDowna", { xPercent: -50, yPercent: -50 });
        gsap.to(".scaleDowna", {
            scale: 0.6667, scrollTrigger: {
                opacity: 100,
                trigger: ".containera",
                pin: ".containera",
                scrub: true,
                
            }
        }),
        gsap.from(".precios", {
            x: 500,
            y: 200,
            duration: 3,
            opacity: 0,
            scrollTrigger: {
                trigger: ".scaleDowna",
                scrub: true,
            }
        })
        gsap.from(".text1", {
            x: 500,
            y: 200,
            duration: 3,
            opacity: 0,
            scrollTrigger: {
                trigger: ".scaleDowna",
                scrub: true,
            }
        })
    </script>
    <br />
    <br />
    <br />
        <section  class="about2">
        <div class="container">
    <div class="box4">
    </div>

    <script>
        gsap.to(".box4", {
            scrollTrigger: { trigger: ".box4", scrub: true }, // start the animation when ".box" enters the viewport (once)
            x: 500,

        });
    </script>
        <br />
    <br />
    <div class="box5">
    </div>
    <script>
        gsap.from(".box5", {
            scrollTrigger: { trigger: ".box5", scrub: true }, // start the animation when ".box" enters the viewport (once)
            x: 500,

        });
    </script>
    <br />
 
    </div>
    </section>
    <br />
    <br />

    <h1 class="textoPropuesta" style="margin-left: 14pc">Nuestra propuesta...</h1>

    <section class="pSection">
        <div class="container">
        <div class="pContent">
            <h1 class="text1" >Su plan es el siguiente:</h1>
            <br />
            <br />
          <h2 class="text1">Según nuestro análisis capilar, usted padece de <span style="color: #BAD305">Alopecia Androgenética</span>, con una perdida de cabello aproximada a 2000 fóliculos</h2>
          <br />
          <div class="precios">
              <div class="row">
                  <div class="col">
                      <div class="card" style="width: 18rem; border-color: transparent; background: transparent;">
                        <div class="card-body" style="background-color: #C4D600; border-radius: 56px 5px; border-color: white">
                            <h5 class="card-title">2000 Fóliculos</h5>
                            <h6 class="card-subtitle mb-2 text-muted">3.100.000</h6>
                            <p style="color: white" class="card-text">Pesos Chilenos</p>
                        </div>
                      </div>
                  </div>
                <div class="col">
                    <div class="rectangulo" style="margin-top: 4pc; margin-left: 7pc; margin-bottom: 5pc;"></div>
                </div>
                  <div class="col">
                      <div class="card" style="width: 18rem; border-color: transparent; background: transparent;">
                        <div class="card-body" style="background-color: #C4D600; border-radius: 56px 5px; border-color: white">
                            <h5 class="card-title">2500 Fóliculos</h5>
                            <h6 class="card-subtitle mb-2 text-muted">3.600.000</h6>
                            <p style="color: white" class="card-text">Pesos Chilenos</p>
                        </div>
                      </div>
                  </div>
              </div>
           </div>
        </div>
        </div>
  
        <img class="pImage" src="../../Styles/img/fondo-plantas.jpg" alt="Filler image">
        <script>
            gsap.from(".textoPropuesta", {
                x: 200,
                duration: 5,
                opacity: 0,
                scrollTrigger: {
                    trigger: ".textoPropuesta",
                    scrub: true,
                }
            })

            gsap.to(".pContent", {
                yPercent: -100,
                ease: "none",
                scrollTrigger: {
                    trigger: ".pSection",
                    // start: "top bottom", // the default values
                    // end: "bottom top",
                    scrub: true
                },
            });

            gsap.to(".pImage", {
                yPercent: 50,
                ease: "none",
                scrollTrigger: {
                    trigger: ".pSection",
                    // start: "top bottom", // the default values
                    // end: "bottom top",
                    scrub: true
                },
            });
        </script>
    </section>


    <br />
    <br />
        <div class="d-flex justify-content-center">
            <h1 data-aos="zoom-in" data-aos-delay="100">En <span style="color: #BAD305">Tempora</span> transformaremos su vida</h1>
        </div>
         <div class="d-flex justify-content-around">
             <div class="texto2">
                 <h2 data-aos-delay="100" style="width: 24pc; margin-left: 60px; margin-top: 10pc;">El 100% de nuestros pacientes están satisfechos con los resultados...</h2>

             </div>
             <script>
                 gsap.from(".texto2", {
                     scrollTrigger: { trigger: ".texto2", scrub: true }, // start the animation when ".box" enters the viewport (once)
                     y: 200,
                     opacity: 0

                 });
             </script>
            <div class="card" style="width: 18rem; border-color: white" >
              <div class="card-body">
                <section class="comparisonSection">
              <div class="comparisonImage beforeImage">
                <img src="../../Styles/img/antes.jpg" alt="before">
              </div>
              <div class="comparisonImage afterImage">
                <img src="../../Styles/img/despues.jpg" alt="after">
              </div>
            </section>
                  <h6 data-aos="zoom-in" data-aos-delay="100" style="color: darkslategrey;">Técnica FUE - 2500 Folículos</h6>
              </div>
            </div>
        </div>

        <div class="d-flex justify-content-around">
            <div class="card" style="width: 18rem; border-color: white" >
              <div class="card-body">
                <section class="comparisonSection">
              <div class="comparisonImage beforeImage">
                <img src="../../Styles/img/antes2.jpg" alt="before">
              </div>
              <div class="comparisonImage afterImage">
                <img src="../../Styles/img/despues2.jpg" alt="after">
              </div>
            </section>
                  <h6 data-aos="zoom-in" data-aos-delay="100" style="color: darkslategrey;">Técnica FUE - 2500 Folículos</h6>
                  
              </div>
            </div>
            <div class="texto3">
                <h2 style="width: 19pc; margin-left: 41px; margin-top: 10pc;">Obtendrás resultados visibles a partir del segundo mes...</h2>
            </div>
            <script>
                gsap.from(".texto3", {
                    scrollTrigger: { trigger: ".texto3", scrub: true }, // start the animation when ".box" enters the viewport (once)
                    y: 200,
                    opacity: 0

                });
            </script>
        </div>
        
        <div class="d-flex justify-content-around">
            <div class="texto4">
                <h2 style="width: 232px; margin-top: 10pc;">Lorem Ipsum is simply dummy text of the printing and typesetting</h2>
            </div>
                <script>
                    gsap.from(".texto4", {
                        scrollTrigger: { trigger: ".texto4", scrub: true }, // start the animation when ".box" enters the viewport (once)
                        y: 200,
                        opacity: 100

                    });
                </script>
            <div class="card" style="width: 18rem; border-color: white" >
              <div class="card-body">
                <section class="comparisonSection">
                  <div class="comparisonImage beforeImage">
                    <img src="../../Styles/img/antes3.jpg" alt="before">
                  </div>
                
                  <div class="comparisonImage afterImage">
                    <img src="../../Styles/img/despues3.jpg" alt="after">
                  </div>
                </section>
                  <h6 data-aos="zoom-in" data-aos-delay="100" style="color: darkslategrey;">Técnica FUE - 1500 Folículos</h6>
              </div>
            </div>
        </div>
    
    <script>
        gsap.utils.toArray(".comparisonSection").forEach(section => {
            let tl = gsap.timeline({
                scrollTrigger: {
                    trigger: section,
                    start: "center center",
                    // makes the height of the scrolling (while pinning) match the width, thus the speed remains constant (vertical/horizontal)
                    end: () => "+=" + section.offsetWidth,
                    scrub: true,
                    pin: true,
                    anticipatePin: 1,
                },
                defaults: { ease: "none" },
                
                
            });
            // animate the container one way...
            tl.fromTo(section.querySelector(".afterImage"), { xPercent: 100, x: 0 }, { xPercent: 0 })
                // ...and the image the opposite way (at the same time)
                .fromTo(section.querySelector(".afterImage img"), { xPercent: -100, x: 0 }, { xPercent: 0 }, 0);
        });
    </script>
        <br />
        <br />
        <br />
    <br />
    <div class="box6">
    </div>
    <script>
        gsap.to(".box6", {
            scrollTrigger: { trigger: ".box6", scrub: true }, // start the animation when ".box" enters the viewport (once)
            x: 500,

        });
    </script>
        <br />
    <br />
    <div class="box7">
    </div>
    <script>
        gsap.from(".box7", {
            scrollTrigger: { trigger: ".box7", scrub: true }, // start the animation when ".box" enters the viewport (once)
            x: 500,

        });
    </script>
    <br />
    <br />
    <br />
    <br />
    <div class="d-flex justify-content-center">
        <h1 data-aos="zoom-in" data-aos-delay="100">Sólo un paso más...</h1>
    </div>
    <br />
    <section id="about" class="about2">
        <div class="container" data-aos="fade-up">

        <div class="row">
            <div class="col-lg-6 order-1 order-lg-2" data-aos="zoom-in" data-aos-delay="100">
                <div style="margin-top: 2pc;">
                    <div class="about-img">
                        <img src="<%: Url.Content("~/Styles/img/logo_tempora.png") %>" alt="" style="margin-left: 91px;">
                    </div>
                </div>
            </div>
            <div class="col-lg-6 pt-4 pt-lg-0 order-2 order-lg-1 content">
                <h3 style="color: greenyellow">Agendemos su visita...</h3>
                <p class="font-italic" style="color: white;">
                    Por favor seleccione el día y hora que más le acomode para que pueda asistir a nuestra clínica
                </p>
                <div class="col-lg-6 col-md-6 form-group" style="margin-left: -1pc">
                    <input id="txtFechaVisita" placeholder="Ingrese fecha" name="txtFechaVisita" required/>
                    <script>
                        $('#txtFechaVisita').datepicker({
                            uiLibrary: 'bootstrap4',
                            format: 'dd/mm/yyyy'
                        });
                    </script>

                </div>
            </div>
        </div>
        </div>
    </section>
        <br />
    <br />
    <br />
	<script type="text/javascript" src="<%: Url.Content("~/Styles/js/tracking.js")%>"></script>	
        <%--<script>
            const intro = document.querySelector('.intro');
            const video = intro.querySelector('video');
            //End Section
            const section = document.querySelector('.box');
            const end = section.querySelector('h1');
            const text = section.querySelector('h1');
            //ScrollMagic
            const controller = new ScrollMagic.Controller();
            //Scenes
            const scene = new ScrollMagic.Scene({
                duration: 9000,
                triggerElement: intro,
                triggerHook: 0
            })
                .addIndicators()
                .setPin(intro)
                .addTo(controller);

            //Video Animation 
            let accelamount = 0.1;
            let scrollpos = 0;
            let delay = 0;

            scene.on('update', e => {
                scrollpos = e.scrollPos / 1000;
            })

            setInterval(() => {
                delay += (scrollpos - delay) * accelamount;
                video.currentTime = delay;
            }, 33.3);

        </script>--%>
        </div>
</main><!-- End #main -->

</asp:Content>
