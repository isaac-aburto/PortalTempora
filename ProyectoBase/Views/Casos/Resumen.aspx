<%@ Page Title="" Language="C#" MasterPageFile="~/Views/DisenoBootstrap3.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <title>Resumen de caso</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<h2>Resumen caso <%= ViewData["txtNroCaso"] %></h2>

    <%--CABECERA--%>
        <div class="panel panel-primary">
            <div class="panel-heading">Información solicitante</div>
            <div class="panel-body">
                <div class="row">
                    <fieldset class="form-group col-md-4">
                        <label for="txtNombreSolicitante">Nombre solicitante</label>
                        <input type="text" class="form-control" id="txtNombreSolicitante" name="txtNombreSolicitante" readonly="readonly" placeholder="Nombre solicitante" value="<%= ViewData["txtNombreSolicitante"] %>" />
                    </fieldset>
                    <fieldset class="form-group col-md-4">
                        <label for="txtUnidadResponsable">Correo solicitante</label>
                        <input type="text" class="form-control" id="txtCorreoSolicitante" name="txtCorreoSolicitante" placeholder="Correo solicitante" readonly="readonly" value="<%= ViewData["txtCorreoSolicitante"] %>" />
                    </fieldset>
                    <fieldset class="form-group col-md-4">
                        <label for="txtFechaCreacion">Fecha creación de solicitud</label>
                        <input type="text" class="form-control" id="txtFechaCreacion" name="txtFechaCreacion" placeholder="Fecha creación" readonly="readonly" value="<%= ViewData["txtFechaCreacion"] %>" />
                    </fieldset>
                </div>
            </div>
        </div>

        <%--FORMULARIO--%>
        <div class="panel panel-primary">
            <div class="panel-heading">Datos solicitud</div>
            <div class="panel-body">
                <div class="row">
                    <fieldset class="form-group col-md-4">
                        <label for="txtNombres">
                            Nombres
                            </label>
                        <input type="text" name="txtNombres" id="txtNombres" placeholder="Nombres" class="form-control" readonly="readonly" value="<%= ViewData["txtNombres"] %>"/>
                    </fieldset>
                    <fieldset class="form-group col-md-4">
                        <label for="txtApellidoPaterno">
                            Apellido paterno
                            </label>
                        <input type="text" name="txtApellidoPaterno" id="txtApellidoPaterno" placeholder="Apellido paterno" class="form-control" readonly="readonly" value="<%= ViewData["txtApellidoPaterno"] %>" />
                    </fieldset>
                    <fieldset class="form-group col-md-4">
                        <label for="txtApellidoMaterno">
                            Apellido materno
                            </label>
                        <input type="text" name="txtApellidoMaterno" id="txtApellidoMaterno" placeholder="Apellido materno" class="form-control"  readonly="readonly" value="<%= ViewData["txtApellidoMaterno"] %>"/>
                    </fieldset>
                </div>
                <div class="row">
                    <fieldset class="form-group col-md-4">
                        <label for="txtFechaNacimiento">
                            Fecha de nacimiento
                            </label>
                        <input type="text" name="txtFechaNacimiento" id="txtFechaNacimiento" placeholder="01/01/2019" class="form-control" readonly="readonly" value="<%= ViewData["txtFechaNacimiento"] %>" />
                    </fieldset>
                    <fieldset class="form-group col-md-4">
                        <label for="txtNacionalidad">
                            Nacionalidad
                            </label>
                        <input type="text" name="txtNacionalidad" id="txtNacionalidad" placeholder="Nacionalidad" class="form-control"  readonly="readonly" value="<%= ViewData["txtNacionalidad"] %>"/>
                    </fieldset>
                </div>
            </div>
        </div>

</asp:Content>
