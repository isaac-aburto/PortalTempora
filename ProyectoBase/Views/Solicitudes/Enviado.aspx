﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/DisenoBootstrap3.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">


      <!-- ======= Hero Section ======= -->
    <main id="main">
        <section id="about" class="about" style="    margin-top: 5pc;">
            <div class="card border-secondary <%--border-0--%> shadow rounded-lg mt-5" style="margin-top: -55px; background-color: #e3e3e3;">
                <div class="container" data-aos="fade-up">
                    <input hidden name="idSolicitud" value="<%= ViewData["idSolicitud"]%>"/>
                    <div class="row">
                        <div class="card-body" style="    margin-top: -5pc;">
                            <div class="card border-left-warning shadow ">
                                <div class="card-body">
                                <div class="section-title">
                                <h2>Evaluación Médica</h2>
                                <p>¡Pronto nos pondremos en contacto!</p>
                                </div>
                                <p>Hemos resivido con éxito el formulario. En los próximos días un experto de Tempora evaluará y enviará un diagnostico adecuado y personalizado sólo para usted. </p>
                                <p>Si lo desea puede crear una contraseña para su usuario <%= ViewData["Correo"] %> y usar este portal para ver en tiempo real estado de su solicitud. </p>
                                <br />
                                <br />
                                <br />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </main><!-- End #main -->
</asp:Content>
