<%@ Page Title="" Language="C#" MasterPageFile="~/Views/DisenoBootstrap3.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <title>Login</title>
    <link href="<%: Url.Content("~/Styles/css/custom.css") %>" rel="stylesheet" />

        <script>
        jQuery.validator.setDefaults({
            debug: true,
            success: "valid"
        });

        // just for the demos, avoids form submit
        $( "#myform" ).validate({
          rules: {
                pss1: "required",
                pss2: {
                    equalTo: "#pss1"
            }
          }
        });
    </script>
    <script>
      ///                    ///
        ///    VALIDACIONES    ///
        ///                    ///
        // Propiedades para bootstrap            
        jQuery.validator.setDefaults({
            errorElement: 'span',
            errorPlacement: function (error, element) {
                error.addClass('invalid-feedback');
                element.closest('.form-group').append(error);
            },
            highlight: function (element, errorClass, validClass) {
                $(element).addClass('is-invalid');
            },
            unhighlight: function (element, errorClass, validClass) {
                $(element).removeClass('is-invalid');
            }
        });
        // Cambiar mensajes por defecto
        jQuery.extend(jQuery.validator.messages, {
            required: "Este campo es requerido.",
            remote: "Este campo necesita correçción.",
            email: "Ingrese un correo válido.",
            url: "Ingrese una URL válida.",
            date: "Ingrese una fecha válida.",
            dateISO: "Ingrese una fecha válida.",
            number: "Ingrese un número válido.",
            digits: "Ingrese solo dígitos.",
            creditcard: "Ingrese un tarjeta de crédito válida.",
            equalTo: "Repita el mismo campo.",
            accept: "Ingrese un archivo con una extensión válida (PDF, DOC, DOCX, JPG o PNG).",
            extension: "Ingrese un archivo con una extensión válida (PDF, DOC, DOCX, JPG o PNG).",
            maxlength: jQuery.validator.format("Ingrese hasta {0} caracteres."),
            minlength: jQuery.validator.format("Ingrese mínimo {0} caracteres."),
            rangelength: jQuery.validator.format("Ingrese un valor en un rango entre {0} y {1}."),
            range: jQuery.validator.format("Ingrese un valor entre {0} y {1}."),
            max: jQuery.validator.format("Ingrese un valor igual o menor a {0}."),
            min: jQuery.validator.format("Ingrese un valor mayor o igual a {0}.")
        });

        // add the rule here
        $.validator.addMethod("selectPorDefecto", function (value, element, arg) {
            return arg !== value;
        }, "Debe seleccionar una opción");
    </script>
    <script>
        $("#InicioSi").hide();
        $(document).ready(function () {
            $("#InicioSi").hide();
            // Botones Siguiente 

            $("#btnConfirmar").on("click", function () {
                $("#InicioSi").show();

            });

            $("#Formulario").submit(function () {
                $("#btnEnviar").attr("disabled", true);
                $("#btnEnviar").text("Enviando...");
            });
        });
    </script>   
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
        <div id="layoutAuthentication">
            <div id="layoutAuthentication_content">
                <main>
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />

                    <form id="Formulario" role="form" action="<%: Url.Content("~/Home/OlvidePassword") %>" method="post" >
                    <div class="container" >
                        <div class="row justify-content-center">
                            <div class="col-lg-5">
                                <div class="card shadow-lg rounded-lg mt-5" style="border-color: aliceblue;">
                                    <div class="card-header" style="background-color: #f7f7f7;"><h3 class=" font-weight-light my-4"><img src="<%: Url.Content("~/Styles/img/logo_tempora.png") %>"/></h3>

                                    </div>
                                    <div class="card-body">
                                        <div class="text-center">
                                            <p>Recuperar contraseña</p>
                                        </div>
                                        
                                        <%--<form class="form-signin" method="post" action="<%: Url.Content("~/Usuarios/Login") %>">--%>
                                            <div class="form-group">
                                                <%--<label class="small mb-1" for="correo">Ingrese su email</label>--%>
                                                <input class="form-control py-4" id="correo" name="correo" type="email" placeholder="Ingrese su correo Tempora" value="<%= ViewData["correo"] %>"/>
                                            </div>
                                            <div style="padding-top: 10px; margin-bottom: -30px;">
                                                <p style="color: red"><%= ViewData["Error"] %></p>
                                            </div>
                                            <div style="padding-top: 10px; margin-bottom: -30px;">
                                                <p style="color: forestgreen"><%= ViewData["Bueno"] %></p>
                                            </div>
                                            <div class="text-center">
                                                <input type="hidden" name="ocultar" id="ocultar" value=" <%= ViewData["id"] %>"/>
                                            </div>
                                            <div class="row mt-3">
                                                <div class="col-6">
                                                </div>
                                            </div>
                                            <div class="form-group d-flex align-items-center justify-content-between mt-4 mb-0">
                                                <button class="btn btn-md btn-primary btn-block btn-signin" type="submit">Enviar</button>
                                            </div>
                                        <%--</form>--%>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    </form>
                </main>
                <br />
                <br />
            </div>
            <div id="layoutAuthentication_footer">
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">Copyright &copy; Tempora 2021</div>
                            <div>
                                <a href="#">Privacy Policy</a>
                                &middot;
                                <a href="#">Terms &amp; Conditions</a>
                            </div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
    <!-- /container -->
</asp:Content>
