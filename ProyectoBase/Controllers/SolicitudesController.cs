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
                        Solicitud solicitud = conexionDB.Solicitud.Find(idSolicitud);

                        solicitud.Fk_idEstado = int.Parse(Estado);
                        solicitud.FK_Tecnica = int.Parse(Tecnica);
                        solicitud.ObserMed = Obsrevación;
                        conexionDB.SaveChanges();
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
    }

}
