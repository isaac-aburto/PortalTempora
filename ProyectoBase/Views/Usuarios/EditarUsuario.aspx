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


        <form style="background: #F7F7F7;"  method="post" action="<%: Url.Content("~/Usuarios/EditarUsuario") %>">

        <section id="about" class="about" style="    margin-top: 8pc;">
            
            <div class="card border-secondary <%--border-0--%> shadow rounded-lg mt-5" style="margin-top: -55px; background-color: #e3e3e3;">
                <div class="container" data-aos="fade-up">
                    <input hidden name="idUsuario" value="<%= ViewData["id"]%>"/>
                    <div class="row">
                        <div class="card-body" style="    margin-top: -5pc;">
                        <div class="card border-left-warning shadow ">
                        <div class="card-body">
                            <h1 style="color: #858585; font-family: 'Open Sans', sans-serif; font-style: inherit;">Editar Usuario</h1>
                            <br />
                            <div style="text-align: center;"></div>                                                
                            <div class="form-row">
                                <input hidden name="txtIdUsuario" value="<%= ViewData["txtIdUsuario"] %>"/>
                                <div class="col-lg-6 col-md-6 form-group">
                                    <label for="txtNombre">Nombre</label>
                                    <input value="<%= ViewData["txtNombre"] %>" type="text" id="txtNombre" name="txtNombre" class="form-control" placeholder="Nombre" data-rule="minlen:1" data-msg="Please enter at least 4 chars" required>
                                    <div class="invalid-feedback">
                                        Por favor ingrese su nombre
                                    </div>
                                </div>
                                
                                <div class="col-lg-6 col-md-6 form-group">
                                    <label for="txtApellido">Apellido</label>
                                    <input value="<%= ViewData["txtApellido"] %>" type="text" id="txtApellido" name="txtApellido" class="form-control" placeholder="Apellido" data-rule="minlen:4" data-msg="Please enter at least 4 chars" required>
                                    <div class="invalid-feedback">
                                       Por favor ingrese su apellido
                                    </div>
                                </div>
                                
                                <div class="col-lg-6 col-md-6 form-group">
                                    <label for="txtPerfil">Perfil</label>
                                          <select class="custom-select mr-sm-2" name="txtPerfil"  id="txtPerfil" required>
                                            <%= ViewData["opcionesPerfil"] %>
                                          </select>
                                </div>
                                
                                <div class="col-lg-6 col-md-6 form-group">
                                    <label for="txtEmail">Correo</label>
                                    <input value="<%= ViewData["txtCorreo"] %>" type="email" class="form-control" name="txtEmail" id="txtEmail" placeholder="Correo" data-rule="email" data-msg="Please enter a valid email" required>
                                    <div class="invalid-feedback">
                                        Por favor ingrese su correo
                                    </div>
                                </div>
                                
                                <div class="col-lg-6 col-md-6 form-group">
                                    <label for="txtTelefono">Teléfono</label>
                                    <input value="<%= ViewData["txtTelefono"] %>" type="text" class="form-control" name="txtTelefono" id="txtTelefono" placeholder="Teléfono" data-rule="minlen:4" data-msg="Please enter at least 4 chars" required>
                                    <div class="invalid-feedback">
                                        Por favor ingrese su telefono
                                    </div>
                                </div>
                                
                                <div class="col-lg-6 col-md-6 form-group">
                                    <label for="txtCelular">Celular</label>
                                    <input value="<%= ViewData["txtCelular"] %>" type="text" class="form-control" name="txtCelular" id="txtCelular" placeholder="Celular" data-rule="minlen:4" data-msg="Please enter at least 4 chars" required>
                                    <div class="invalid-feedback">
                                        Por favor ingrese su celular
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-6 form-group">
                                    <label for="txtPipeDrive">ID Pipedrive</label>
                                    <input value="<%= ViewData["txtPipeDrive"] %>" type="text" class="form-control" name="txtPipeDrive" id="txtPipeDrive" placeholder="123456" data-rule="minlen:4" data-msg="Please enter at least 4 chars" >
                                    <div class="invalid-feedback">
                                        Por favor ingrese su celular
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-6 form-group">
                                </div>
                                <div class="col">
                                <div style="text-align: center;">
                                    <button class="btn btn-primary" onclick="location.href ='';" style="background-color: grey; border-color: grey;" type="button">Volver</button>
                                    <button class="btn btn-primary"style="background-color: #C6D41D; border-color: #C6D41D;" type="submit">Agregar</button>
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