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
    
    <%-- autoplay video --%>
    <script src="/bower_components/play-on-scroll/scripts/play-on-scroll.js"></script>

    
    <script>
        var size = [window.width, window.height];  //public variable

        $(window).resize(function () {
            window.resizeTo(size[0], size[1]);
        });
    </script>
 
    <%-- Video CSS/Script --%>
    <style>
        html {
            resize: none;
            background-color: white;
        }
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

        .pContent2 {
          width: 99%;
          border-radius: 1pc;
          background-color: rgba(78,152,21,0.8);
          color: white;
         
        }

        headera {
          position: relative;
          background-color: black;
          height: 75vh;
          min-height: 25rem;
          width: 80%;
          overflow: hidden;
        }
        headera .pContent2 {
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
        video::after {
              content:"";
              position:absolute;
              top:0;
              left:0;
              width:100%;
              height:100%;
              background:rgba(0,0,0,0.6);
              z-index:-1;      
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
    .navbar-brand {
        margin-top: 1pc;
    }
    .navbar-brand > img {
    max-width: 100%;
    border: 0px solid;
    }
    .mobile-nav-toggle {
        margin-top: 1pc;
    }
    .nav-menu {
    margin-top: 24px;
    }
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
        background: #808080ad;
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
        width: 50%;
        height: 144vh;
        min-width: 118vw;
        max-width: 118vw;
      max-height: 112vw;
      min-height: 140vh;
      position: absolute;
      top: 50%;
      left: 50%;
      resize: none;
      background-image:url(../../Styles/img/notebook.png);
      background-repeat: no-repeat;
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
    .mensaje1 {
        background-image: url(../../Styles/img/mensaje1.png);
    background-position: 1pc 8pc;
    background-repeat: no-repeat;
    background-size: 403px 226px;
    opacity: 0.7654;
    transform: translate3d(0px, 46.9178px, 0px);
    }
        .mensaje2 {
        background-image: url(../../Styles/img/mensaje2.png);
    background-position: 1pc 8pc;
    background-repeat: no-repeat;
    background-size: 403px 226px;
    opacity: 0.7654;
    transform: translate3d(0px, 46.9178px, 0px);
    }
    .mensaje11 {
        background-color: green;
        border-radius: 5px;
        width: 50px;
        height: 100px;
    }
    .circulo {
         width: 100px;
         height: 100px;
         -moz-border-radius: 50%;
         -webkit-border-radius: 50%;
         border-radius: 50%;
         background: #5cb85c;
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
border-radius: 28px;
  position: relative;
  padding-top: 289px;
  padding-bottom: 300px;
}

/*.container {
  padding: 20px;
  margin: 0 auto;
  max-width: 1070px;
  position: relative;
  z-index: 1;
  margin-left: 5pc;
}*/

.pContent {
  width: 99%;
  border-radius: 1pc;
  background-color: rgba(78,152,21,0.8);
  color: white;
  padding: 40px 60px;
}

.pImage {
  width: 67%;
  height: 40pc;
  position: absolute;
  top: 0;
  right: 0;
  max-height: 900px;
}
.wrap{
  position: absolute;
  top: 50%;
  left: 50%;
  width: fit-content;
  overflow:hidden;
}
    </style>


    <style>
/*        .wrap {
    position: absolute;
    top: 50%;
    left: 50%;
    width: fit-content;
    overflow: hidden;
}*/

.wrap h2 {
    position: relative;
    font-family: sans-serif;
    font-size: 8vw;
    margin: 0;
}

.anim-slide {
    background: white;
    width: 100%;
    height: 100%;
}

/*img{
  height: 200px
}*/
main {
    background:#C4C4C4 ;
    display: flex;
    align-items: center;
    justify-content: center;
    flex-direction: column;
}

.animation__section{
    position: relative;
    min-height: 100vh;
    width: 100%;
}

.anim-slide{
    position: absolute;
}

.swiper-slide {
    outline: none;
    background: #C4C4C4;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    position: relative;
    min-height: 100vh;
}

.swiper-wrapper {
    display: flex;
}

.slider__title {
    margin-top: 60px;
    margin-bottom: 20px;
    width: 100%;
    text-align: center;
}

.slider__subtitle {
    margin-bottom: 70px;
    text-align: center;
}

.swiper-container {
    width: 100%;
    height: 100%;
    overflow: hidden;
}

.slide__flex {
    width: 100%;
    height: 11%;
    position: relative;
} 
.slide__flex .slide__animate {
    position: absolute;
    left: 50%;
    top: 50%;
    transform: translate(-50%, -50%);
}

.animate2{
    z-index: 2;
    transform: scale(1.3);
}

body {
    font-family: 'Poppins';font-size: 22px;
        margin-top: -3pc;
}
.circle {
  width: 500px;
  height: 500px;
  line-height: 500px !important;
  border-radius: 50%;
  font-size: 50px !important;
  color: #fff;
  text-align: center;
  background: #000;
     padding-top: 14pc;
}

.circle1 {

  line-height: 500px !important;
  border-radius: 50%;
  font-size: 50px !important;
  text-align: center;
  background: #000;
    padding-top: 14pc;
    background: #b8b8b8; 
    color: #000; margin-left: 11pc; 
    padding-top: 14pc;   
    width: 500px; 
    height: 500px;
}

.h2, h2 {
    font-size: 1rem;
}
#header {
    background: rgba(255, 255, 255, 0.952);
    border-bottom: 1px solid rgba(12, 11, 9, 0.6);
    transition: all 0.5s;
    z-index: 997;
    padding: 14px 0;
    top: 10px;
    height: 103px;
        font-size: 15px;
}
#header.header-scrolled {
    top: -33px;
    background: rgba(0, 0, 0, 0.85);
    border-bottom: 1px solid #37332a;
        font-size: 15px;
}
.circular--portrait {
  position: relative;
  width: 20vw;
  height: 20vw;
  overflow: hidden;
  border-radius: 50%;
}
.circular--portrait img {
  width: 100%;
  height: 100%;
  object-fit: cover;
}
    </style>
    <style>
       
    html, body {
      margin: 0;
      padding: 0;
    }

    section.spacer {
      height: 34vh;
      display: flex;
      align-items: center;
      justify-content: center;
    }

    img {
      max-width: 100%;
      border: 1px solid;
    }

    .grid {
      background: CornflowerBlue no-repeat fixed;
      background-image: url("../../Styles/img/fondo-solicitud.jpg");
      background-size: cover;
      position: relative;
      
      /*background-blend-mode: saturation;*/
      color: #fff;
    }

    .section.--mask {
      height: 100vh;
      display: flex;
      align-items: center;
      justify-content: center;
      overflow: hidden;
      color: #000000;
      z-index: 1000;
    }


    .content {
      display: grid;
      grid-template-columns: minmax(0px, 1fr) repeat(6, [col] minmax(auto, 160px)) minmax(0px, 1fr);
      grid-gap: 20px;
      grid-template-rows: 1fr;
      align-items: center;
      margin: 40px 0;
    }
    .content.--image-right .content__text {
      grid-column: col/span 4;
      margin-right: 20px;
    }
    .content.--image-right .content__image {
      grid-column: 6/-1;
      margin-right: 29px;
    }
    @media (min-width: 1200px) {
      .content.--image-right .content__image {
        grid-column: 7/-1;
        margin-right: 129px;
      }
    }
    .content.--image-right-large .content__text {
      grid-column: col/span 3;
      margin-right: 20px;
    }
    .content.--image-right-large .content__image {
      grid-column: 5/-1;
      margin-left: 20px;
      margin-right: 57px;
    }
    .content.--image-left .content__text {
      grid-column: col 3/span 3;
      margin-left: 20px;
    }
    .content.--image-left .content__image {
      grid-column: 1/span 3;
    }
    @media (min-width: 1200px) {
      .content.--image-left .content__image {
        margin-right: 80px;
        margin-left: 100px;
      }
    }
    .content.--image-full .content__image {
      grid-column: col/span 6;
    }
    .content.--image-overhang {
      min-height: 700px;
    }



    .content__text {
      grid-column: col/span 6;
      grid-row: 1;
    }
    .content__text.--center-4-cols {
      grid-column: col 2/span 4;
      text-align: center;
    }

    .content__image {
      min-height: 50px;
      grid-row: 1;
    }
    .content__image img {
      margin: 0;
      object-fit: cover;
      width: 100%;
      height: auto;
      display: block;
    }

    .content__image--animate,
    .content__image--animate img {
      will-change: transform;
    }

    .mask__title {
      z-index: 100;
    }

    .mask__title {
      font-size: 65px;
      line-height: 1.2;
      text-align: center;
      color: #000000;
      max-width: 20ch;
      margin: auto;
    }


    #svg-mask {
      position: absolute;
      top: 0;
      left: 0;
      right: 0;
      bottom: 0;
      width: 100%;
      height: 100vh;
    }
</style>
<%-- Style para Celular --%>
<style>
    #header {
        background: rgb(0 0 0 / 95%);
    }
    .card1 {
        width: 100pc; margin-left:5pc; background-color: black;    margin-top: -3pc;
        }
    @media screen and (max-width: 480px) {
        html {
            overflow-x: hidden;
        }
        body {
            position: unset;
        }
        .card1 {
            width: calc(100% - 0pc);
            text-align: center;
            margin-left: 10pc;
        }
        .card1 > .card-body > .text-center > h4{
            font-size: 15px;
            margin-left: -10pc;
        }
        .card1 > .card-body > .text-center > h2{
            font-size: 24px;
            margin-left: -10pc;
        }
    }
    @media screen and (max-width: 480px) {
        .headera > h1 {
            width: calc(100% - 0pc);
            font-size: 60px;
        }
    }

    /*Circulos*/
    .section-circulos {
        }
        @media screen and (max-width: 480px) {
            .section-circulos{
                width: calc(100% - 0pc); 
            }
            .section-circulos > .row > .col > .ciruclo1{
                width: calc(100% - 0pc); 
                margin-left: 16pc;
            }
            .section-circulos > .row > .col > .ciruclo1 > .circle1{
                width: 300px;
                height: 300px;
                margin-left: 16pc;
            }
            .section-circulos > .row > .col > .ciruclo1 > .circle1 > h2{
                width: calc(100% - 0pc);
                font-size: 18px;
                margin-top: -10pc;
                padding: 3pc;
            }
            .section-circulos > .row > .col > .circular--portrait{
                margin-left: -7pc;
            }
            .section-circulos > .row > .col > .circle > .ciruclo2{
                width: 300px;
                height: 300px;
                margin-top: -1pc;
                margin-left: 26px;
                padding: 18px;
            }
            .section-circulos > .row > .col > .circle > .ciruclo2 > h2{
                margin-left: -1pc;
                padding-right: 4pc;
            }
            .section-circulos > .row > .col > .foto2 > .circular--portrait {
                margin-left: -46pc;
                width: 8pc;
                height: 8pc;
            }

        }
        .precios {
        }
        @media screen and (max-width: 480px) {
            .col > .row > .col-6 {
                width: calc(100% - 0pc);
                margin-left: 23pc;
                padding: 15px;
            }
            .col > .row > .col-6 > .card > .card-body {
                width: 24pc !important;
                margin-left: 5pc;
            }
        }
        .containera {
        }
    @media screen and (max-width: 480px) {
        .containera > .scaleDowna {
            width: calc(100% - 0pc);
            height: 159vh;
            min-width: 112vw;
            max-width: 112vw;
            max-height: 112vw;
            min-height: 190vh;
            position: absolute;
            top: 50%;
            left: 50%;
            resize: none;
            background-image:url(../../Styles/img/celular.png);
            background-repeat: no-repeat;
            background-size: 46pc;
            padding-left: 24pc;
            /*background-color: black;*/
            transform-origin: 54% 50%;  
        }
        .containera > .scaleDowna > .pantalla{
            width: calc(100% - 0pc);
            background-color: black;
            margin-top: -10pc;
            margin-left: -37pc;
            /*height: 51pc;
            width: 1284px;*/
        }
        .containera > .scaleDowna > .pantalla > video{
            height: 261px !important;
            margin-top: 294px !important;
            margin-left: 344.1px !important;
        }
            
    }
</style>
<%-- Style para Iphone X+ --%>
<%--<style>
    #header {
        background: rgb(0 0 0 / 95%);
    }
    .card1 {
        width: 100pc; margin-left:5pc; background-color: black;    margin-top: -3pc;
        }
    @media screen and (max-width: 375px) {
        html {
            overflow-x: hidden;
        }
        body {
            position: unset;
        }
        .card1 {
            width: calc(100% - 0pc);
            text-align: center;
            margin-left: -8pc;
        }
        .card1 > .card-body > .text-center > h4{
            font-size: 14px;
            margin-left: -10pc;
        }
        .card1 > .card-body > .text-center > h2{
            font-size: 24px;
            margin-left: -10pc;
        }
    }
    @media screen and (max-width: 375px) {
        .headera > h1 {
            width: calc(100% - 0pc);
            font-size: 60px;
        }
    }

    /*Circulos*/
    .section-circulos {
        }
        @media screen and (max-width: 375px) {
            .section-circulos{
                width: calc(100% - 0pc); 
            }
            .section-circulos > .row > .col > .ciruclo1{
                width: calc(100% - 0pc); 
                margin-left: 16pc;
            }
            .section-circulos > .row > .col > .ciruclo1 > .circle1{
                width: 300px;
                height: 300px;
                margin-left: 16pc;
            }
            .section-circulos > .row > .col > .ciruclo1 > .circle1 > h2{
                width: calc(100% - 0pc);
                font-size: 18px;
                margin-top: -10pc;
                padding: 3pc;
            }
            .section-circulos > .row > .col > .circular--portrait{
                margin-left: -7pc;
            }
            .section-circulos > .row > .col > .circle > .ciruclo2{
                width: 300px;
                height: 300px;
                margin-top: -1pc;
                margin-left: 26px;
                padding: 18px;
            }
            .section-circulos > .row > .col > .circle > .ciruclo2 > h2{
                margin-left: -1pc;
                padding-right: 4pc;
            }
            .section-circulos > .row > .col > .foto2 > .circular--portrait {
                margin-left: -46pc;
                width: 8pc;
                height: 8pc;
            }

        }
        .precios {
        }
        @media screen and (max-width: 375px) {
            .col > .row > .col-6 {
                width: calc(100% - 0pc);
                margin-left: 23pc;
                padding: 15px;
            }
            .col > .row > .col-6 > .card > .card-body {
                width: 24pc !important;
                margin-left: 5pc;
            }
        }
        .containera {
        }
    @media screen and (max-width: 375px) {
        .containera > .scaleDowna {
            width: calc(100% - 0pc);
            height: 159vh;
            min-width: 112vw;
            max-width: 112vw;
            max-height: 112vw;
            min-height: 140vh;
            position: absolute;
            top: 50%;
            left: 50%;
            resize: none;
            background-image:url(../../Styles/img/celular.png);
            background-repeat: no-repeat;
            background-size: 46pc;
            padding-left: 24pc;
            /*background-color: black;*/
            transform-origin: 54% 50%;  
        }
        .containera > .scaleDowna > .pantalla{
            width: calc(100% - 0pc);
            background-color: black;
            margin-top: -10pc;
            margin-left: -37pc;
            /*height: 51pc;
            width: 1284px;*/
        }
        .containera > .scaleDowna > .pantalla > video{
            height: 261px !important;
            margin-top: 294px !important;
            margin-left: 344.1px !important;
        }
            
    }
</style>--%>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
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

    <section class="headera" style="margin-top: -7pc;     height: 65pc;">
        <h1  class="ha" style="color: white; z-index: 100; font-style: inherit; text-align: center; margin-top: 16pc;"><span style="color: white; z-index: 100;">REGINA CHIN</span> <span style="font-weight: lighter">tenemos el plan perfecto para ti. </span><br /><span style="    font-size: 27px;">Haz scroll.</span></h1>

        <div class="fullscreen-video-wrap" >
            <video playsinline="playsinline" autoplay="autoplay" muted="muted" loop="loop" style="filter: brightness(0.5);">
                <source src="../../assets/video/tempora.mp4" type="video/mp4">
            </video>
        </div>
    </section>
                <script>
                    gsap.to('headera', { opacity: 0, duration: 1, y: -50, ease: 'elastic(1, 0.3)' })
                </script>
    <script>
        gsap.set('.center', { xPercent: -50, yPercent: -50 })

        // a loop for the other sections '.section'
        var sections = gsap.utils.toArray(".section").forEach(function (elem) {

            // select the relevant elements
            var lines = elem.querySelectorAll(".lines");
            var lines2 = elem.querySelectorAll(".lines2");

            var tl = gsap.timeline({
                scrollTrigger: {
                    trigger: elem,
                    pin: elem,
                    scrub: 0.5,
                    start: "top top",
                    end: '+=1%'
                },
            })
                .to(lines, { xPercent: -100, duration: 1, ease: 'power2.out', stagger: 0.6, opacity: 0 }, 0)
                .from("lines2", { xPercent: -100, duration: 1, ease: 'power2.out', stagger: 0.6, opacity: 0 }, 1)
                .to({}, { duration: 1 }) // a little pause at the end

        })
    </script>
        <br />
        <div class="card card1">
            <div class="card-body" style=" width: 98pc; margin-left:-14pc">
                <div class="text-center" style="margin-left: 28pc;">
                    <h4 data-aos="zoom-in" data-aos-delay="100"style="color:white">Según nuestro análisis capilar, usted padece de</h4>
                    <h2 data-aos="zoom-in" data-aos-delay="100"style="color: white">Alopecia Androgenética</h2>
                    <h4 data-aos="zoom-in" data-aos-delay="100"class="text8" style="color:white">Con una perdida de cabello aproximada a </h4>
                    <h2 data-aos="zoom-in" data-aos-delay="100"class="text8" style="color:white">2000 fóliculos</h2>
                </div>
            </div>
        </div>

        <script>
            gsap.from('card1', {
                scrollTrigger: {
                    opacity: 0,
                    trigger: 'card1',
                    scrub: true,
                    y: -50
                }
            })
        </script>

        <section class="section-circulos" style="margin-left: 16pc;">
            <div class="row">
                <div class="col" data-aos="zoom-in" data-aos-delay="100">
                    <div class="ciruclo1">
                        <div class="circle1">
                            <h2 style="">Lorem Ipsum is simply dummy text of the printing and typesetting industry. </h2>
                        </div>
                    </div>
                </div>
                    <script>
                        gsap.set(".ciruclo1", { xPercent: -10, yPercent: -10 });
                        gsap.to(".ciruclo1", {
                            scale: 1, scrollTrigger: {
                                ease: 'Power2.easeInOut',
                                opacity: 100,
                                trigger: ".ciruclo1",
                                scrub: true,

                            }
                        })
                    </script>
                <div class="col" data-aos="zoom-in" data-aos-delay="100">
                    <div class="circular--portrait" style="    width: 17vw; height: 17vw;">
                        <img class="img1" src="../../Styles/img/alopecia1.jpeg" />
                    </div>
                </div>
                <script>
                    gsap.from('img1', {opacity: 0, duration: 1, y: -50, ease: 'elastic(1, 0.3)'})
                </script>
                <div class="col" style="margin-top: 10pc; margin-left: -15pc;" data-aos="zoom-in" data-aos-delay="100">
                    <div class="circular--portrait">
                        <img style="border-radius: 50%; width: 19pc; height: 19pc;" src="../../Styles/img/alopecia2.jpg" />
                    </div>
                </div>
                <%--<div class="col" style="margin-top: 10pc; margin-left: -15pc;" data-aos="zoom-in" data-aos-delay="100">
                        <img style="border-radius: 50%; width: 19pc; height: 19pc;" src="../../Styles/img/alopecia2.jpg" />
                </div>--%>
            </div>
            <div class="row">
                <div class="col" style="margin-top: 5pc;" data-aos="zoom-in" data-aos-delay="100">
                    <div class="circular--portrait">
                        <img class="img3" src="../../Styles/img/alopecia1.jpeg" />
                    </div>
                </div>
                <div class="col">
                    <div class="circle" style="margin-left: -3pc;" data-aos="zoom-in" data-aos-delay="100">
                        <div class="ciruclo2" style="    margin-left: 5pc;">
                            <h2>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. Distribution of letters, as opposed to using</h2>
                        </div>
                    </div>

                    <script>
                        gsap.set(".ciruclo2", { xPercent: -10, yPercent: -10 });
                        gsap.to(".ciruclo2", {
  
                            scale: 1, scrollTrigger: {
                                opacity: 100,
                                trigger: ".img3",
                                scrub: true,

                            }
                        })
                    </script>
                    
                </div>
                <div class="col" data-aos="zoom-in" data-aos-delay="100" style="    margin-top: 2pc;">
                    <div class="foto2">
                        <div class="circular--portrait">
                            <img  src="../../Styles/img/alopecia3.jpg" />
                        </div>
                        
                    </div>
                </div>
            </div>
        </section>
    <div class="col">
        <div class="row" style="margin-left: 12pc; text-align: center;">
            <div class="col-6 ">
                <div class="card rango1" style=" border-color: transparent; background: transparent;">
                    <div class="card-body" style="background-color: #cfcfcf; border-radius: 14px ; border-color: white; width: 35pc;" >
                        <h5 class="card-title">2000 Fóliculos</h5>
                        <h6 class="card-subtitle mb-2 text-muted">$3.100.000</h6>
                        <p style="color: #000000" class="card-text">Pesos Chilenos</p>
                    </div>
                </div>
            </div>
<%--            <script>
                gsap.from(".rango1", {
                    duration: 1,
                    opacity: 0,
                    scrollTrigger: {
                        y: 500,
                        trigger: ".ciruclo1",
                        scrub: true,
                    }
                })
            </script>--%>
            <div class="col-6">
                <div class="card rango2" style=" border-color: transparent; background: transparent;">
                    <div class="card-body" style="background-color: #cfcfcf; border-radius: 14px ; border-color: white; width: 35pc;">
                        <h5 class="card-title">2500 Fóliculos</h5>
                        <h6 class="card-subtitle mb-2 text-muted">$3.600.000</h6>
                        <p style="color: #000000" class="card-text">Pesos Chilenos</p>
                    </div>
                </div>
            </div>
<%--            <script>
                gsap.from(".rango2", {
                    duration: 1,
                    opacity: 0,
                    scrollTrigger: {
                        y: 500,
                        trigger: ".ciruclo1",
                        scrub: true,
                    }
                })
            </script>--%>
        </div>
    </div>
    </div>
        <br />
        <br />
        <br />
        <br />
        <br />
        <script>
            console.clear();

            gsap.set('.center', { xPercent: -50, yPercent: -50 })
            var sections = gsap.utils.toArray(".animation__section").forEach(function (elem) {

                // select the relevant elements
                var first = elem.querySelector(".animate1");
                var second = elem.querySelector(".animate2");
                var third = elem.querySelector(".animate3");

                var tl = new TimelineMax({
                    scrollTrigger: {
                        trigger: elem,
                        pin: elem,
                        scrub: 1,
                        start: "end end",
                        end: '+=10%'
                    },
                })
                    //.fromTo(".anim-slide-fourth", { opacity: 0, duration: 3, ease: 'power2.out' }, { opacity: 1, duration: 3, ease: 'power2.out' })
                    //.fromTo(".animate1", { x: 0, y: 0, duration: 3, ease: 'power2.out' }, { x: 300, y: 0, duration: 3, ease: 'power2.out' })
                    .fromTo(".animate3", { x: 0, y: 0, duration: 3, ease: 'power2.out' }, { x: -300, y: 0, duration: 1, ease: 'power2.out' })
                    .fromTo(".animate2", { css: { scale: 1.1 }, x: 0, y: 0, duration: 1, ease: 'power2.out' }, { css: { scale: 1 }, x: -300, y: 0, duration: 1, ease: 'power2.out' })
            })
        </script>
    <br />
    <br />
    <div class="containera" >
      <div class="scaleDowna" data-aos="fade-up" style="    margin-left: -2pc;">
          <div class="pantalla">
              <video id="video"  src="../../Styles/caso/2561.mp4" controls="controls" style="height: 719.0px;margin-top: 47px;margin-left: 4.1px;"/>  
          </div>
        <script>
            let playAfterThisHeight = 2200
            let playAfterThisHeight2 = 3600
            $(document).scroll(function () {
                if ($(document).scrollTop() > playAfterThisHeight && $(document).scrollTop() < playAfterThisHeight2) {
                    $('#video').prop('volume', 0.50);
                    $('#video').trigger('play');

                } else {
                    if ($(document).scrollTop() > 3700) {
                        $('#video').prop('volume', 0.40);
                    }
                    if ($(document).scrollTop() > 3800) {
                        $('#video').prop('volume', 0.30);
                    }
                    if ($(document).scrollTop() > 3900) {
                        $('#video').prop('volume', 0.20);
                    }
                    if ($(document).scrollTop() > 4000) {
                        $('#video').prop('volume', 0.10);
                    }
                    if ($(document).scrollTop() > 4100) {
                        $('#video').prop('volume', 0.05);
                    }
                    if ($(document).scrollTop() > 4200) {
                        $('#video').trigger('pause');
                    }


                                  
                }
            })
        </script>
     <br />
          
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

            duration: 6,
            opacity: 0,
            scrollTrigger: {
                trigger: ".textoPropuesta",
                scrub: true,
            }
        })
        gsap.from(".text1", {
            duration: 6,
            opacity: 0,
            scrollTrigger: {
                trigger: ".textoPropuesta",
                scrub: true,
            }
        })
    </script>
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
<div class="grid">
    <section class="section --mask">
        <svg id="svg-mask" width="100%" height="100%" viewBox="0 0 1920 1080" preserveAspectRatio="xMidYMid slice">
            <defs>
                <mask id="mask">
                    <rect width="100%" height="100%" fill="#fff"></rect>
                    <circle id="inner-mask" stroke="green" stroke-width="3" cx="50%" cy="50%" r="100" fill="black"></circle>
                </mask>
            </defs>
            <g>
                <rect mask="url(#mask)" width="100%" height="100%" fill="#fff"></rect>
            </g>
        </svg>
        <h1 class="mask__title">Bienvenido a Tempora</h1>
    </section>
    <section class="section --fixed">
        <div class="content --image-right-large">
            
            <div class="content__text">
                <div class="eyebrow gt-Sectra-Regular fs-20 c-purple-2">
                    <h1 style="font-family: 'Poppins';font-size: 22px; font-style: inherit;">El mejor equipo</h1>
                </div>
                <div class="title fs-24 c-white">
                    En Tempora contamos con el mejor equipo para cirujías de la región.
                </div>
            </div>
            <div class="content__image content__image--animate o-image-1" data-offset-y="25" data-scrub="0.1">
                <div class="content__image-inner">
                    <img src="https://via.placeholder.com/788x473/" alt="">
                </div>
            </div>
        </div>
        <div class="content --image-right">
            <div class="content__text">
                <div class="fs-40 c-purple-3 fw-semi">
                    Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco  
                </div>
            </div>
            <div class="content__image content__image--animate o-image-2" data-offset-y="-25" data-scrub="0.1">
                <div class="content__image-inner">
                    <img src="https://via.placeholder.com/408/" alt="">
                </div>
            </div>
        </div>

        <div class="content --image-full">
            <div class="content__image">
                <div class="content__image-inner">
                    <img src="https://via.placeholder.com/1060x400/" alt="">
                </div>
            </div>
        </div>

        <div class="content --image-left">
            <div class="content__text">
                <p class="fs-24">Lorem ipsum dolor sit amet, consectetur adipiscing elitullamco</p>
                <p class="fs-24">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco</p>
            </div>
            <div class="content__image content__image--animate o-image-3" data-offset-y="12" data-scrub="0.7">
                <div class="content__image-inner">
                    <img src="https://via.placeholder.com/510/" alt="">
                </div>
            </div>
        </div>
        <div class="content">
            <div class="content__text --center-4-cols">
                <div class="eyebrow gt-Sectra-Regular fs-20 c-purple-2">
                    Tempora
                </div>
                <div class="title fs-65 fw-semi">
                    Lorem ipsum dolor sit amet
                </div>
            </div>
        </div>


        <div class="content">
            <div class="content__text">
                Lorem ipsum dolor sit amet, consectetur adipisicing elit. Accusamus commodi, consectetur cumque dignissimos eos excepturi expedita maiores modi, molestiae molestias nihil nisi officiis, perferendis provident quibusdam reprehenderit rerum totam ut?
              <br><br><br><br><br><br>
            </div>
        </div>
    </section>
</div>

<section class="spacer"></section><script>


    const svg = document.querySelector("#svg-mask");
    const img = document.querySelector("#fixed-image");
    const maskTitle = document.querySelector(".mask__title");
    const chevron = document.querySelector("#inner-mask");

    gsap.set(maskTitle, {
        y: chevron.getBoundingClientRect().height / 2
    });
    gsap.set(chevron, {
        transformOrigin: "center center"
    });

    //I don't know if I should just get the elements I want to animate and add them to a timeline
    // const image1 = document.querySelector('.o-image-1');
    // const image2 = document.querySelector('.o-image-2');
    // const image3 = document.querySelector('.o-image-3');

    //At the moment I am grabbing them all and then looping through them, this feels like it could be done using .batch?
    const imageContainers = document.querySelectorAll(".content__image--animate");
    imageContainers.forEach(imageContainer => {
        const imageAnim = gsap.to(imageContainer.querySelector('img'), {
            // ease: 'none',
            paused: true,
            yPercent: parseFloat(imageContainer.dataset.offsetY) || 0,
            duration: parseFloat(imageContainer.dataset.scrub) || 0.1
        });

        ScrollTrigger.create({
            animation: imageAnim,
            scrub: true,
            trigger: imageContainer,
            start: "top center",
            end: "bottom top"
        });
    });

    // Setup a timeline for the Mask and text
    var tl = gsap.timeline({
        scrollTrigger: {
            trigger: '.--mask',
            pin: true,
            start: "top top",
            end: '+=925',
            scrub: 0.2,
            pinSpacing: false
        },
        defaults: {
            duration: 2,
            ease: "power3"
        }
    }).to(maskTitle, {
        opacity: 0,
        duration: 0.15
    }, 0).to(chevron, {
        scale: 35,
        yPercent: -550,
        duration: 4
    }, 0);


    // Fade in the text
    gsap.set(".content__text", {
        y: 50
    });

    ScrollTrigger.batch(".content__text", {
        interval: 0.2,
        batchMax: 2,
        onEnter: batch => gsap.to(batch, {
            opacity: 1,
            y: 0,
            overwrite: true
        }),
        onLeave: batch => gsap.set(batch, {
            opacity: 0,
            y: -50,
            overwrite: true
        }),
        onEnterBack: batch => gsap.to(batch, {
            opacity: 1,
            y: 0,
            stagger: 0.15,
            overwrite: true
        }),
        onLeaveBack: batch => gsap.set(batch, {
            opacity: 0,
            y: 50,
            overwrite: true
        }),
        start: "top bottom",
        end: "bottom top",
        // markers: true
    });

    window.addEventListener("load", init);
    window.addEventListener("resize", resize);

    function init() {
        resize();
    }

    function resize() {
        tl.progress(0);
        tl.invalidate();
        ScrollTrigger.refresh();
    }

    ScrollTrigger.addEventListener("refreshInit", () => gsap.set(".content__text", {
        y: 0
    }));


</script>

          <section style=" margin-top: -16pc;">
        <div class="d-flex justify-content-center">
            <h2 style="font-size: 42px;"data-aos="zoom-in" data-aos-delay="100">En <span style="color: #BAD305">Tempora</span> transformaremos tu vida</h2>
        
        </div>
         <div class="d-flex justify-content-around">
             <div class="texto2 mensaje1" >
                 <h2 data-aos-delay="100" style="width: 24pc; margin-left: 60px; margin-top: 10pc; color:white">El 100% de nuestros pacientes están satisfechos con los resultados...</h2>

             </div>
             <script>
                 gsap.from(".texto2", {
                     scrollTrigger: { trigger: ".texto2", scrub: true }, // start the animation when ".box" enters the viewport (once)
                     y: 200,
                     duration: 1,
                     opacity: 0
  

                 });
             </script>
            <div class="card" style="width: 18rem; border-color: white" >
              <div class="card-body">
                <section class="comparisonSection">
              <div class="comparisonImage beforeImage">
                <img src="../../Styles/img/antes.jpg" alt="before" style="border-radius: 3%;">
              </div>
              <div class="comparisonImage afterImage">
                <img src="../../Styles/img/despues.jpg" alt="after" style="border-radius: 3%;">
                  
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
                <img src="../../Styles/img/antes2.jpg" alt="before" style="border-radius: 3%;">
              </div>
              <div class="comparisonImage afterImage">
                <img src="../../Styles/img/despues2.jpg" alt="after" style="border-radius: 3%;">
                  
              </div>
            </section>
                  <h6 data-aos="zoom-in" data-aos-delay="100" style="color: darkslategrey;">Técnica FUE - 2500 Folículos</h6>
                  
              </div>
            </div>
            <div class="texto3 mensaje2" style="width: 26pc;">
                <h2 style="width: 19pc; margin-left: 76px; margin-top: 10pc; color: white">Obtendrás resultados visibles a partir del segundo mes...</h2>
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
            <div class="texto4 mensaje1" style="    width: 33pc;">
                <h2 style="width: 19pc; margin-left: 4pc;margin-top: 10pc; color:white">Lorem Ipsum is simply dummy text of the printing and typesetting</h2>
            </div>
                <script>
                    gsap.from(".texto4", {
                        scrollTrigger: { trigger: ".texto4", scrub: true }, // start the animation when ".box" enters the viewport (once)
                        y: 200,
                        opacity: 0

                    });
                </script>
            <div class="card" style="width: 18rem; border-color: white" >
              <div class="card-body">
                <section class="comparisonSection">
                  <div class="comparisonImage beforeImage">
                    <img src="../../Styles/img/antes3.jpg" alt="before" style="border-radius: 3%;">
                  </div>
                
                  <div class="comparisonImage afterImage">
                    <img src="../../Styles/img/despues3.jpg" alt="after" style="border-radius: 3%;">
                      
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
            </section>          </div>
       
        <br />
        <br />
    <br />
<%--    <div class="box6">
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
    </script>--%>
    <br />
    <br />
    <br />
    <br />
    <div class="d-flex justify-content-center">
        <h1 data-aos="zoom-in" data-aos-delay="100">Sólo un paso más...</h1>
    </div>
    <br />
    <section id="about" class="about2" style="    width: 100pc;">
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
                <h3 style="color: greenyellow">Agendemos su visita</h3>
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
                    <br />
                    <br />
                    
                </div>
                <button type="button" data-toggle="modal" data-target="#ModalArriba" style="background: #8aaf32; border: 0; padding: 10px 35px; color: #fff; transition: 0.4s; border-radius: 50px;">Agendar</button>
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
