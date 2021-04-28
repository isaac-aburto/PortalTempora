using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebSolicitudes.Models;


namespace WebSolicitudes.Controllers
{
    public class SolicitudesController : Controller
    {
        //
        // GET: /Solicitudes/

        public ActionResult Index()
        {
            try
            {
                string valorUsuario = Session["IdUsuario"] != null ? Session["IdUsuario"].ToString() : string.Empty;
                using (ModeloTempora conexionDB = new ModeloTempora())
                {
                    if (int.TryParse(valorUsuario, out int idUsuario))
                    {
                        Usuario usuario = conexionDB.Usuario.Find(idUsuario);
                        //Validación de Usuario
                        if (usuario == null)
                            throw new Exception("El usuario no existe");

                        // Filtros


                        List<Tecnica> listaTecnicas = conexionDB.Tecnica.ToList();
                        string opcionesTecnicas = string.Empty;
                        opcionesTecnicas += "<option value='0'>-- Selecciona opción --</option>";
                        foreach (Tecnica item in listaTecnicas)
                        {
                            opcionesTecnicas += "<option  value='" + item.idTecnica + "'>" + item.nombreTecnica + "</option>";
                        }
                        ViewData["opcionesTecnicas"] = opcionesTecnicas;


                        List<EstadoSolicitud> listaEstados = conexionDB.EstadoSolicitud.ToList();
                        string opcionesEstados = string.Empty;
                        opcionesEstados += "<option value='0'>-- Selecciona opción --</option>";
                        foreach (EstadoSolicitud item in listaEstados)
                        {
                            opcionesEstados += "<option  value='" + item.idEstado + "'>" + item.nombreEstado + "</option>";

                        }
                        ViewData["opcionesEstados"] = opcionesEstados;




                        //Lista Solicitudes
                        List<Solicitud> listaSolicitud = conexionDB.Solicitud.ToList();
                        string filaSolicitud = string.Empty;
                        foreach (Solicitud solicitud in listaSolicitud) {
                            filaSolicitud += "<tr>";
                            filaSolicitud += "  <td>";
                            string URL = Url.Content("~/Solicitudes/GestionSolicitudes/");
                            filaSolicitud += "<a href='" + URL + solicitud.idSolicitud + "'>" + solicitud.idSolicitud + "</a>";
                            filaSolicitud += "  </td>";
                            filaSolicitud += "  <td>";
                            filaSolicitud += solicitud.Cliente.nombre + " " +solicitud.Cliente.apellido;
                            filaSolicitud += "  </td>";
                            filaSolicitud += "  <td>";
                            filaSolicitud += solicitud.Cliente.rut;
                            filaSolicitud += "  </td>";
                            filaSolicitud += "  <td>";
                            filaSolicitud += solicitud.FechaSolicitud;
                            filaSolicitud += "  </td>";
                            filaSolicitud += "  <td>";
                            if (solicitud.Fk_idEstado == null)
                            {
                                filaSolicitud += "Sin estado";
                            }
                            else {
                                filaSolicitud += solicitud.EstadoSolicitud.nombreEstado;
                            }
                            filaSolicitud += "  </td>";
                            filaSolicitud += "  <td>";
                            if (solicitud.FK_Tecnica == null)
                            {
                                filaSolicitud += "Sin Técnica";
                            }
                            else
                            {
                                filaSolicitud += solicitud.Tecnica.nombreTecnica;
                            }
                            filaSolicitud += "  </td>";
                            filaSolicitud += "</tr>";
                        }
                        ViewData["valoresSolicitudes"] = filaSolicitud;
                        return View();
                    }
                }
            }
            catch (Exception ex)
            {
                Util.escribirLog("Index", "Solicitudes (GET)", ex.Message);
                return RedirectToAction("Index", "Home");
            }
            return View();
        }
        public ActionResult GestionSolicitudes(int id)
        {
            string valorUsuario = Session["IdUsuario"] != null ? Session["IdUsuario"].ToString() : string.Empty;
            try
            {
                using (ModeloTempora conexionDB = new ModeloTempora())
                {
                    if (int.TryParse(valorUsuario, out int idUsuario))
                    {
                        Usuario usuario = conexionDB.Usuario.Find(idUsuario);
                        //Validación de Usuario
                        if (usuario == null)
                            throw new Exception("El usuario no existe");
                        Solicitud solicitud = conexionDB.Solicitud.Find(id);
                        //Datos Solicitud
                        ViewData["NombreCompleto"] = solicitud.Cliente.nombre + " " +solicitud.Cliente.apellido;
                        ViewData["Rut"] = solicitud.Cliente.rut;
                        ViewData["Correo"] = solicitud.Cliente.correo;
                        ViewData["Telefono"] = solicitud.Cliente.telefono;
                        ViewData["Celular"] = solicitud.Cliente.celular;
                        ViewData["FechaNacimiento"] = solicitud.Cliente.fecha_nacimiento;
                        ViewData["RespuestaZona"] = solicitud.RespZona;
                        ViewData["RespuestaDerma"] = solicitud.RespDerm;
                        ViewData["RespuestaPelo"] = solicitud.RespPelo;
                        ViewData["Observacion"] = solicitud.ObserMed;

                        //Datos de la Gestión
                        List<Tecnica> listaTecnicas = conexionDB.Tecnica.ToList();
                        string opcionesTecnicas = string.Empty;
                        opcionesTecnicas += "<option value='0'>-- Selecciona opción --</option>";
                        foreach (Tecnica item in listaTecnicas) {
                            if (item.idTecnica == solicitud.FK_Tecnica)
                            {
                                opcionesTecnicas += "<option selected value='" + item.idTecnica + "'>" + item.nombreTecnica + "</option>";
                            }
                            else {
                                opcionesTecnicas += "<option  value='" + item.idTecnica + "'>" + item.nombreTecnica + "</option>";
                            }
                            
                        }
                        ViewData["opcionesTecnicas"] = opcionesTecnicas;

                        List<ZonaAReparar> listaZonas = conexionDB.ZonaAReparar.ToList();
                        string opcionesZonas = string.Empty;
                        opcionesZonas += "<option value='0'>-- Selecciona opción --</option>";
                        foreach (ZonaAReparar item in listaZonas) {
                            opcionesZonas += "<option  value='" + item.idZona + "'>" + item.nombreZona + "</option>";
                        }
                        ViewData["opcionesZonas"] = opcionesZonas;

                        List<EstadoSolicitud> listaEstados = conexionDB.EstadoSolicitud.ToList();
                        string opcionesEstados = string.Empty;
                        opcionesEstados += "<option value='0'>-- Selecciona opción --</option>";
                        foreach (EstadoSolicitud item in listaEstados) {
                            if ( item.idEstado == solicitud.Fk_idEstado) {
                                opcionesEstados += "<option selected value='" + item.idEstado + "'>" + item.nombreEstado + "</option>";
                            } else {
                                opcionesEstados += "<option  value='" + item.idEstado + "'>" + item.nombreEstado + "</option>";

                            }
                        }
                        ViewData["opcionesEstados"] = opcionesEstados;

                        List<RangoFoliculos> listaRangos = conexionDB.RangoFoliculos.ToList();
                        string opcionesRangos = string.Empty;

                        foreach (RangoFoliculos item in listaRangos)
                        {
                            if (solicitud.RangoxSolicitud.Count() != 0)
                            {
                                int rango1 = int.Parse(solicitud.RangoxSolicitud.FirstOrDefault().FK_idRango.ToString());
                                if (item.idRango == rango1)
                                {
                                    opcionesRangos += "<option selected value='" + item.idRango + "'>" + item.Rango + "</option>";
                                }
                                else
                                {
                                    opcionesRangos += "<option  value='" + item.idRango + "'>" + item.Rango + "</option>";
                                }

                            }
                            else {
                                opcionesRangos += "<option  value='" + item.idRango + "'>" + item.Rango + "</option>";
                            }
                                

                        }
                        ViewData["opcionesRangos1"] = opcionesRangos;

                        List<RangoFoliculos> listaRangos2 = conexionDB.RangoFoliculos.ToList();
                        string opcionesRangos2 = string.Empty;

                        foreach (RangoFoliculos item in listaRangos)
                        {
                            if (solicitud.RangoxSolicitud.Count() != 0)
                            {
                                int rango2 = int.Parse(solicitud.RangoxSolicitud.LastOrDefault().FK_idRango.ToString());
                                if (item.idRango == rango2)
                                {
                                    opcionesRangos2 += "<option selected value='" + item.idRango + "'>" + item.Rango + "</option>";
                                }
                                else
                                {
                                    opcionesRangos2 += "<option  value='" + item.idRango + "'>" + item.Rango + "</option>";
                                }

                            }
                            else
                            {
                                opcionesRangos2 += "<option  value='" + item.idRango + "'>" + item.Rango + "</option>";
                            }

                        }
                        ViewData["opcionesRangos2"] = opcionesRangos2;


                        //Fotos


                        List<Fotos> listaFotos = conexionDB.Fotos.ToList();
                        int cont = 0;
                        foreach (Fotos item in listaFotos)
                        {
                            if (item.FK_idSolicitud == id)
                            {
                                if (item.FK_idSolicitud == id && cont == 0)
                                {
                                    ViewData["Foto1"] = "data: image/" + "jpeg" + "; base64, " + item.baseArchivo + "";
                                }
                                if (item.FK_idSolicitud == id && cont == 1)
                                {
                                    ViewData["Foto2"] = "data: image/" + "jpeg" + "; base64, " + item.baseArchivo + "";
                                }
                                if (item.FK_idSolicitud == id && cont == 2)
                                {
                                    ViewData["Foto3"] = "data: image/" + "jpeg" + "; base64, " + item.baseArchivo + "";
                                }
                                if (item.FK_idSolicitud == id && cont == 3)
                                {
                                    ViewData["Foto4"] = "data: image/" + "jpeg" + "; base64, " + item.baseArchivo + "";
                                }
                                if (item.FK_idSolicitud == id && cont == 4)
                                {
                                    ViewData["Foto5"] = "data: image/" + "jpeg" + "; base64, " + item.baseArchivo + "";
                                }
                                cont++;
                            }
                        }


                        ViewData["idSolicitud"] = id;
                        return View();


                    }
                }
            }
            catch (Exception ex)
            {
                Util.escribirLog("Solicitudes", "GestionSolicitud (GET)", ex.Message);
                return RedirectToAction("Index", "Solicitudes");
            }
            return View();
        }

        [HttpPost, ValidateInput(false)]
        public ActionResult GestionSolicitudes(/*IEnumerable<HttpPostedFileBase> files,*/ FormCollection collection) {

            int idSolicitud = int.Parse(collection["idSolicitud"].ToString());

            string Estado = collection["txtEstado"];
            string Tecnica = collection["txtTecnica"];
            string Zona = collection["txtZona"];
            string Obsrevación = collection["txtObservacion"];
            int Rango1 = int.Parse(collection["txtFoliculo1"]);
            int Rango2 = int.Parse(collection["txtFoliculo2"]);
            string enviar = collection["enviar"];

            try
            {
                string valorUsuario = Session["IdUsuario"] != null ? Session["IdUsuario"].ToString() : string.Empty;
                using (ModeloTempora conexionDB = new ModeloTempora())
                {
                    if (int.TryParse(valorUsuario, out int idUsuario))
                    {

                        Usuario usuario = conexionDB.Usuario.Find(idUsuario);
                        //Validación de Usuario
                        if (usuario == null)
                            throw new Exception("El usuario no existe");

                        //Buscar Rangos                      
                        Solicitud solicitud = conexionDB.Solicitud.Find(idSolicitud);
                        solicitud.Fk_idEstado = int.Parse(Estado);
                        solicitud.FK_Tecnica = int.Parse(Tecnica);
                        if (solicitud.RangoxSolicitud.Count() == 0)
                        {
                            RangoxSolicitud rango1 = new RangoxSolicitud();
                            rango1.FK_idRango = Rango1;
                            rango1.FK_idSolicitud = idSolicitud;
                            conexionDB.RangoxSolicitud.Add(rango1);

                            RangoxSolicitud rango2 = new RangoxSolicitud();
                            rango2.FK_idRango = Rango2;
                            rango2.FK_idSolicitud = idSolicitud;
                            conexionDB.RangoxSolicitud.Add(rango2);
                        }
                        else {
                            solicitud.RangoxSolicitud.FirstOrDefault().FK_idRango = Rango1;
                            solicitud.RangoxSolicitud.LastOrDefault().FK_idRango = Rango2;
                        }
                        solicitud.ObserMed = Obsrevación;
                        conexionDB.SaveChanges();

                        //Guardar Rangos
                        if (enviar == "1") {
                            //Enviar Correo
                            string titulo = "He aquí tu evaluación - Portal Tempora";
                            string nombre = solicitud.Cliente.nombre + " " + solicitud.Cliente.apellido;
                            string textoCorreo = System.IO.File.ReadAllText(HttpContext.Server.MapPath("~/Styles/MensajeSolicitudPaso1.html")).Replace("[Nombre]", nombre);
                            Util.EnviarMail(textoCorreo, "isaac.aburto@backspace.cl", titulo);

                        }

                        return RedirectToAction("GestionSolicitudes/" + idSolicitud.ToString()/*, "Tickets"*/);

                    }
                }
            }
            catch (Exception ex)
            {
                Util.escribirLog("Index", "Solicitudes (GET)", ex.Message);
                return RedirectToAction("Index", "Home");
            }

            return View();
        }
        public ActionResult Enviado(string idcliente)
        {
          
            ViewData["Correo"] = Session["Correo"];
            return View();
        }
        public ActionResult Pagina1(string idcliente)
        {  
            return View();
        }
        public ActionResult PruebGsap()
        {
            return View();
        }
    }

}
