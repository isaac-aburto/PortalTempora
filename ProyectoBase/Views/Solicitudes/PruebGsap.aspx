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


<style>
html,
body {
  height:100%;
}

body {
  width:100%;
}

.headera {
  color: white;
  font-size: 50px;
}

.section {
  height: 50%;
  background: #293744;
  color: #899eb5;
}

.scene {
  height: 100%;
  width: 100%;
  background: #EAEAEA;
}

.center {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100%;
}

.viewer {
  height: 100%;
  margin-left: auto;
  margin-right: auto;
  max-width: 200px;
  width: 100%;
  background-image: url(https://s3-us-west-2.amazonaws.com/s.cdpn.io/210284/doodle-sprite.png);
  background-repeat: no-repeat;
  background-position: 0 50%;
}

</style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<!-- ======= Hero Section ======= -->
<main id="main" style="background-color: white;">

    <header class="headera section">
  <div class="center">&darr;</div>
</header>
<section class="scene section" id="sticky">
  <div class="viewer"></div>
</section>

<section class="section">
  <div class="center">End</div>
</section>


<script>
    gsap.registerPlugin(ScrollTrigger);

    var frame_count = 9,
        offset_value = 100;

    gsap.to(".viewer", {
        backgroundPosition: (-offset_value * frame_count * 2) + "px 50%",
        ease: "steps(" + frame_count + ")", // use a stepped ease for the sprite sheet
        scrollTrigger: {
            trigger: ".scene",
            start: "top top",
            end: "+=" + (frame_count * offset_value),
            pin: true,
            scrub: true
        }
    });
</script>

	<script type="text/javascript" src="<%: Url.Content("~/Styles/js/tracking.js")%>"></script>	
</main><!-- End #main -->
</asp:Content>
