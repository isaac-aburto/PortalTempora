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
    body {
        margin: 0;
        height: 100vh;
    }

    section {
        height: 100vh;
        text-align: center;
    }

    .box {
        background: red;
        width: 200px;
        height: 200px;
    }
</style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">


      <!-- ======= Hero Section ======= -->
<main id="main" style="background-color: white;">
    <section>
        <h1>Scroll down</h1>
    </section>
    <section>
        <div class="box" data-aos="fade-up">
            <h1 id="hola">hola</h1>
        </div>
    </section>
    <section></section>

    <script>
        gsap.to('.box', {
            opacity: 10,
            duration: 1,
            x: 500,
            scrollTrigger: {
                trigger: ".box",
                start: "top 80%",
                end: "top 30%",
                scrub: true,
                toggleActions: "restart none none none",
                markers: true,
            }       
        })
        gsap.grom('#hola', {
            opacity: 0,
            duration: 1,
        })
    </script>

	<script type="text/javascript" src="<%: Url.Content("~/Styles/js/tracking.js")%>"></script>	
</main><!-- End #main -->
</asp:Content>
