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
    .box {
        width: 20px;
        height: 20px;
        background: blue;
        background-color: blue;
    }
    .box2 {
    width: 20px;
    height: 20px;
    background: red;
    background-color: red;
    }
    .containera {
      height: 100vh;
      position: relative;
    }
    .scaleDowna {
      width: 120vw;
      height: 120vh;
      position: absolute;
      top: 50%;
      left: 50%;
      background-color: black;
      transform-origin: 50% 50%;
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

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<!-- ======= Hero Section ======= -->
<main id="main" style="background-color: white;">
    <br />
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
        <div class="fullscreen-video-wrap">
            <video playsinline="playsinline" autoplay="autoplay" muted="muted" loop="loop">
                <source src="../../assets/video/tempora.mp4" type="video/mp4">
            </video>
        </div>
    </div>
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
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <div class="containera">
      <div class="scaleDowna">
          <br />
          <br />
          <br />
          <br />
          <br />
          <br />
          <br />
          <h1 class="text1" style="color: white">Segun nuestro presupuesto...</h1>
          <div class="precios">
              <div class="row">
                  <div class="col">
                      <div class="card" style="width: 18rem; border-color: white;">
                        <div class="card-body" style="background-color: #C4D600; border-radius: 40px 10px; border-color: white">
                            <h5 class="card-title">100 Fóliculos</h5>
                            <h6 class="card-subtitle mb-2 text-muted">Card subtitle</h6>
                            <p style="color: white" class="card-text">[Valor total]</p>
                        </div>
                      </div>
                  </div>
                  <div class="col">
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
    </div>
    <script>
        gsap.set(".scaleDowna", { xPercent: -50, yPercent: -50 });
        gsap.to(".scaleDowna", {
            scale: 0.6667, scrollTrigger: {
                trigger: ".containera",
                pin: ".containera",
                scrub: true,
                markers: true
            }
        }),
        gsap.from(".precios", {
            x: 3500,
            y: 500,
            duration: 3,
            opacity: 0,
            scrollTrigger: {
                trigger: ".box2",
                scrub: true,
                markers: true
            }
        })
        gsap.from(".text1", {
            x: 3500,
            y: 500,
            duration: 3,
            opacity: 0,
            scrollTrigger: {
                trigger: ".box2",
                scrub: true,
                markers: true
            }
        })
    </script>
    <br />
    <div class="d-flex justify-content-center">
    <h1>En clínica tempora...</h1>
    <div class="card" style="width: 18rem;">
      <div class="card-body">
        <section class="comparisonSection">
      <div class="comparisonImage beforeImage">
        <img src="../../Styles/img/antes.jpg" alt="before">
      </div>
      <div class="comparisonImage afterImage">
        <img src="../../Styles/img/despues.jpg" alt="after">
      </div>
    </section>
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
                    anticipatePin: 1
                },
                defaults: { ease: "none" }
            });
            // animate the container one way...
            tl.fromTo(section.querySelector(".afterImage"), { xPercent: 100, x: 0 }, { xPercent: 0 })
                // ...and the image the opposite way (at the same time)
                .fromTo(section.querySelector(".afterImage img"), { xPercent: -100, x: 0 }, { xPercent: 0 }, 0);
        });
    </script>



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
</main><!-- End #main -->
</asp:Content>
