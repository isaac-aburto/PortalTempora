<%@ Page Title="" Language="C#" MasterPageFile="~/Views/DisenoBootstrap3.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">


      <!-- ======= Hero Section ======= -->
<main id="main">
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />

    <section id="book-a-table" class="book-a-table">
      <div class="container" data-aos="fade-up">
            <div class="section-title">
              <h2>Evaluación Médica</h2>
              <p>¡Pronto nos pondremos en contacto!</p>
            </div>
            <p>Hemos resivido con éxito el formulario. En los próximos días un experto de Tempora evaluará y enviará un diagnostico adecuado y personalizado sólo para usted. </p>
            <p>Si lo desea puede crear una contraseña para su usuario <%= ViewData["Correo"] %> y usar este portal para ver en tiempo real estado de su solicitud. </p>
        </div>
    </section>
    <br />
    <br />
    <br />
</main><!-- End #main -->
</asp:Content>
