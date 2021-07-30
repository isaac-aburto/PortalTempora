<%@ Page Title="" Language="C#" MasterPageFile="~/Views/DisenoBootstrap3.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>


<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">

    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.24/css/dataTables.bootstrap.min.css">
      <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.24/js/dataTables.bootstrap.min.js"></script>

    <%-- Scripts de Gestion --%>
    <script>

        $(document).ready(function () {
            var open = false;
            $('#btnInformacion').click();

            
            $("#btnGestionar").click(function () {
                var icon = document.getElementById('icon');
                
                if (open) {
                    icon.className = 'fa fa-angle-down';
                } else {
                    icon.className = 'fa fa-angle-up';
                }
                open = !open;

            });
            var open2 = false;
            $("#btnFotografias").click(function () {
                var icon2 = document.getElementById('icon2');

                if (open2) {
                    icon2.className = 'fa fa-angle-down';
                } else {
                    icon2.className = 'fa fa-angle-up';
                }
                open2 = !open2;

            });
            var open3 = true;
            $("#btnInformacion").click(function () {
                var icon3 = document.getElementById('icon3');

                if (open3) {
                    icon3.className = 'fa fa-angle-down';
                } else {
                    icon3.className = 'fa fa-angle-up';
                }
                open3 = !open3;

            });
            $("#btnSicronizar").click(function () {
                $.ajax({
                    url: '<%: Url.Content("~/Usuarios/Sincronizar/") %>',
                        data: {  },
                    cache: false,
                    type: "GET",
                    success: function (data) {
                        // data is your result from controller

                     },
                     error: function (err) {
                         console.log(err);
                     }
                 });
            });
        });
    </script>
    <style>
        .textarea {
            overflow: auto !important;
        }
        .fa-arrow-down{
          transform: rotate(0deg);
          transition: transform 0.3s linear;
          font-size: 27px;
        }

        .fa-arrow-down.open{
          transform: rotate(180deg);
          transition: transform 0.3s linear;
          font-size: 27px;
}
        .card {
        border-radius: 0.60rem;
        border-color: #00000033;
        }
        .carousel-inner > .item > img {
  width:640px;
  height:360px;
}
        .imgen-carrusel {
            float: left;
            width:  100px;
            height: 500px;
            object-fit: cover;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <main id="main" style="    margin-top: -1pc;">

    <!-- ======= About Section ======= -->


        <form style="background: #F7F7F7;"  method="post" action="<%: Url.Content("~/Solicitudes/GestionSolicitudes") %>">

        <section id="about" class="about" style="    margin-top: 8pc;">
            
            <div class="card border-secondary <%--border-0--%> shadow rounded-lg mt-5" style="margin-top: -55px; background-color: #e3e3e3;">
                <div class="container" data-aos="fade-up">
                    <input hidden name="idUsuario" value="<%= ViewData["id"]%>"/>
                    <div class="row">
                        <div class="card-body" style="    margin-top: -5pc;">
                        <div class="card border-left-warning shadow ">
                        <div class="card-body">
                            <div class="row">
                                <div class="col">
                                    <h1 style="color: #858585; font-family: 'Open Sans', sans-serif; font-style: inherit;">Usuarios Tempora</h1>
                                </div>
                                <div class="col" style="padding-left: 60pc;margin-top: -2pc;">
                                    <button id="btnSicronizar" class="btn btn-primary" type="button"><i class="fas fa-sync"></i>Sincronizar</button>
                                </div>
                            </div>
                            <br />
                            <div style="text-align: center;">
                            </div>                   
                             <div class="card border-left-warning  ">
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered table-hover" id="tablasolicitudes">
                                        <thead>
                                            <tr>
                                                <th class="col-xs-2">ID</th>
                                                <th class="col-xs-1">Nombre</th>
                                                <th class="col-xs-1">Perfil</th>
                                                <th class="col-xs-1">Correo</th>
                                                <th class="col-xs-1">Celular</th>
                                                <th class="col-xs-2">Mantenedor</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%= ViewData["valoresUsuarios"] %>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
         
                        </div>
                        </div>
                    </div>
                    </div>    
                </div> 
            </div> 
        </section>
            </form>
    </main>
</asp:Content>