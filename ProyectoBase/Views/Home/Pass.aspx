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
        $("#myform").validate({
            rules: {
                pss1: "required",
                pss2: {
                    equalTo: "#pss1"
                }
            }
        });
    </script>
        <script>
            $(document).ready(function () {
                $("#pss1").keyup(function () {
                    if ($("#pss2").val() != $("#passw3").val()) {
                        $("#msg").html("Las contraseñas no coinciden").css("color", "red");
                    } else {
                        $("#msg").html("Las contraseñas coinciden").css("color", "green");;
                    }
                });
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
        $(document).ready(function () {
            $("#pss2").keyup(function () {
                if ($("#pss1").val() != $("#pss2").val()) {
                    $("#msg").html("Las contraseñas no coinciden").css("color", "red");
                } else {
                    $("#msg").html("Las contraseñas coinciden").css("color", "green");;
                }
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
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-5">
                                <div class="card  shadow-lg rounded-lg mt-5">
                                    <div class="card-header" style="background-color: #f7f7f7;"><h3 class=" font-weight-light my-4"><img src="<%: Url.Content("~/Styles/img/logo_tempora.png") %>"/></h3>

                                    </div>
                                    <div class="card-body">
                                        <form id="myform" role="form" action="<%: Url.Content("~/Home/GuardarContraseña") %>" method="post">
                                            <div class="form-group mb-3">
                                                <div class="input-group input-group-alternative">
                                                    <div class="input-group-prepend">
                                                        <span class="input-group-text"><i class="ni ni-lock-circle-open""></i></span>
                                                    </div>
                                                    <input class="form-control" placeholder="Nueva Contraseña" type="password" name="pss1" id="pss1" >
                                                </div>
                                            </div>
                                            <div class="form-group focused">
                                                <div class="input-group input-group-alternative">
                                                    <div class="input-group-prepend">
                                                        <span class="input-group-text"><i class="ni ni-lock-circle-open"></i></span>
                                                    </div>
                                                    <input class="form-control" placeholder="Confirmar Contraseña" type="password" name="pss2" id="pss2" >
                                                </div>
                                            </div>
                                            <div id="msg"></div>
                                            <div style="padding-top: 10px; margin-bottom: -30px;">
                                                <p style="color: red"><%= ViewData["Error"] %></p>
                                                <p style="color: greenyellow"><%= ViewData["Bueno"] %></p>
                                            </div>
                                            <div class="text-center">
                                                <button type="submit" class="btn btn-primary my-4">Confirmar</button>
                                                <input type="hidden" name="ocultar" id="ocultar" value="<%= ViewData["id"] %>"/>
                                            </div>
                                            <div class="row mt-3">
                                                <div class="col-6">
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
            <div id="layoutAuthentication_footer">
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">Copyright &copy; Your Website 2020</div>
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
