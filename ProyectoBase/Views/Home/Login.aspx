<%@ Page Title="" Language="C#" MasterPageFile="~/Views/DisenoBootstrap3.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">

    <title>Login</title>
    <link href="<%: Url.Content("~/Styles/css/custom.css") %>" rel="stylesheet" />
<%--    <script>
        $(document).ready(function () {
            $("#btnSubmit").click(function () {
                console.log("aaaaa")
                var inputEmail = $("#inputEmail").val();
                $.ajax({
                    url: '<%: Url.Content("~/Home/EnviarWhatsapp/") %>',
                    data: { inputEmail: inputEmail },
                    cache: false,
                    type: "GET",
                    success: function (data) {
                        // data is your result from controller
                        console.log(data);
                      
                    },
                    async: true,
                    error: function (err) {
                        console.log(err);
                    }
                });
            });
        });
    </script>--%>
    <style>
        .box-contenedor {
            background-color: #e3e3e3;
        }
    </style>
    
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
                    <div id="modalCargando" class="modal fade bd-example-modal-lg" data-backdrop="static" data-keyboard="false" tabindex="-1">
            <div class="modal-dialog modal-sm">
                <div class="modal-content" style="width: 48px">
                    <span class="fa fa-spinner fa-spin fa-3x"></span>
                </div>
            </div>
        </div>
        <div id="layoutAuthentication">
            <div id="layoutAuthentication_content">
                <main style="    background-color: #e3e3e3;">
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <div class="container">
                        <div class="row justify-content-center" style="margin-top: -4pc;margin-bottom: 3pc;">
                            <div class="col-lg-5">
                                <div class="card shadow-lg rounded-lg mt-5">
                                    <div class="card-header" style="background-color: #f7f7f7;"><h3 class="text-center font-weight-light my-4" ><img src="<%: Url.Content("~/Styles/img/logo_tempora.png") %>"/></h3></div>
                                    <div class="card-body">
                                        <div class="text-center">
                                            <p>Iniciar Sesión</p>
                                        </div>
                                        <form class="form-signin" method="post" action="<%: Url.Content("~/Home/Login") %>">
                                            <div class="form-group">
                                                <input class="form-control py-4" id="inputEmail" name="inputEmail" type="email" placeholder="Ingresar correo" required/>
                                            </div>
                                            <div class="form-group">
                                                <input class="form-control py-4" id="inputPassword" name="inputPassword" type="password" placeholder="Ingresar contraseña" required/>
                                            </div>
<%--                                            <div class="form-group">
                                                <div class="custom-control custom-checkbox">
                                                    <input class="custom-control-input" id="rememberPasswordCheck" type="checkbox" />
                                                    <label class="custom-control-label" for="rememberPasswordCheck">Recordar Contraseña</label>
                                                </div>
                                            </div>--%>
                                                <p style="color: red"><%= ViewData["Error"] %></p>
                                                <input id="Exp" type="hidden" name="Exp" value="<%= ViewData["Exp"] %>" / >
<%--                                            <div class="d-flex justify-content-center">
                                                <div id="spiner" class="spinner-border text-success" style="width: 3rem; height: 3rem;" role="status">
                                                  <span class="sr-only">Loading...</span>
                                                </div>
                                            </div>--%>
                                            <div class="form-group d-flex align-items-center justify-content-between mt-4 mb-0">
                                                <span class="fa fa-spinner fa-spin fa-3x"></span>
                                                <button class="btn btn-md btn-primary btn-block btn-signin" id="btnSubmit" type="submit"><span id="spiner" class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span> Iniciar sesión</button>

<%--                                                <button class="btn btn-md btn-primary btn-block btn-signin" id="btnSubmit2" type="button">Iniciar sesión2</button>--%>
                                                <script>
                                                    $(document).ready(function () {
                                                        $("#spiner").hide();
                                                        $("#btnSubmit").click(function () {
                                                            $("#spiner").show(100);
                                                        });
                                                    });
                                                 
                                                </script>
<%--                                                <script>
                                                    $(document).ready(function () {
                                                        $("#btnSubmit").click(function () {
                                                            console.log("aaaaa")
                                                            var inputEmail = $("#inputEmail").val();
                                                            var inputPassword = $("#inputPassword").val();
                                                            $.ajax({
                                                                url: '<%: Url.Content("~/Home/Login/") %>',
                                                                data: { inputEmail: inputEmail, inputPassword: inputPassword },
                                                                        cache: false,
                                                                        type: "POST",
                                                                        success: function (data) {
                                                                            // data is your result from controller
                                                                            console.log(data);
                                                                            if (data == "ERROR") {
                                                                                $("#spiner").hide(100);
                                                                            }

                                                                        },
                                                                        async: true,
                                                                        error: function (err) {
                                                                            console.log(err);
                                                                        }
                                                                    });
                                                                });
                                                            });
                                                </script>--%>
                                            </div>
                                            <a class="small" href="<%: Url.Content("~/Home/OlvidePassword") %>">No recuerdo mi contraseña</a>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
<%--            <div id="layoutAuthentication_footer">
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
            </div>--%>
        </div>
        <br />
        <br />

        <script>
            // Example starter JavaScript for disabling form submissions if there are invalid fields
            (function () {
                'use strict';
                window.addEventListener('load', function () {
                    // Fetch all the forms we want to apply custom Bootstrap validation styles to
                    var forms = document.getElementsByClassName('needs-validation');
                    // Loop over them and prevent submission
                    var validation = Array.prototype.filter.call(forms, function (form) {
                        form.addEventListener('submit', function (event) {
                            if (form.checkValidity() === false) {
                                event.preventDefault();
                                event.stopPropagation();
                            }
                            form.classList.add('was-validated');
                        }, false);
                    });
                }, false);
            })();
                                                                    </script>
    <!-- /container -->
</asp:Content>
