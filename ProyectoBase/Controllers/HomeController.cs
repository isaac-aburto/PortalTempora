using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Data;
using System.DirectoryServices;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Hosting;
using System.Web.Mvc;
using System.Web.Routing;
using System.Web.Script.Serialization;
using System.Xml;
using WebSolicitudes.Models;
using System.Globalization;


namespace WebSolicitudes.Controllers
{
    public class HomeController : Controller
    {
        //
        // GET: /Home/

        public ActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Index(/*IEnumerable<HttpPostedFileBase> files*/ FormCollection collection) {
            try
            {
                //Usuario
                string Nombre = collection["txtNombre"];
                string Apellido = collection["txtApellido"];
                string Rut = collection["txtRut"];
                string Correo = collection["txtEmail"];
                string Telefono = collection["txtTelefono"];
                string Celular = collection["txtCelular"];
                string FechaDeNacimiento = collection["txtFechaNacimiento"];

                string idcliente;
                //Solicitud
                //Zonas
                string RespuestaZona = string.Empty;

                string RespuestaZonaCima = collection["chkZonaCima"];
                string RespuestaZonaRegion = collection["chkZonaRegion"];
                string RespuestaZonaCoronilla = collection["chkZonaCoronilla"];
                string RespuestaZonaOccipital = collection["chkZonaOccipital"];
                string RespuestaZonaNuca = collection["chkZonaNuca"];
                string RespuestaZonaSien = collection["chkZonaSien"];

                if (RespuestaZonaCima == "on")
                {
                    RespuestaZona = RespuestaZona + "Cima, ";
                }
                if (RespuestaZonaRegion == "on")
                {
                    RespuestaZona = RespuestaZona + "Región Parietal, ";
                }
                if (RespuestaZonaCoronilla == "on")
                {
                    RespuestaZona = RespuestaZona + "Coronilla, ";
                }
                if (RespuestaZonaOccipital == "on")
                {
                    RespuestaZona = RespuestaZona + "Hueso Occipital, ";
                }
                if (RespuestaZonaNuca == "on")
                {
                    RespuestaZona = RespuestaZona + "Nuca, ";
                }
                if (RespuestaZonaSien == "on")
                {
                    RespuestaZona = RespuestaZona + "Sien, ";
                }
                if (RespuestaZona != string.Empty)
                {
                    int n = RespuestaZona.Length;
                    RespuestaZona = RespuestaZona.TrimEnd(' ').TrimEnd(',');
                }

                //Dermatólogo 
                string RespuestaDerma = string.Empty;

                string RespuestaDermaSi = collection["chkDermaSi"];
                string RespuestaDermaNo = collection["chkDermaNo"];
                if (RespuestaDermaSi == "on")
                {
                    string RespuestaDermaDermatitis = collection["chkDermaDermatitis"];
                    string RespuestaDermaAlopecia = collection["chkDermaAlopecia"];
                    string RespuestaDermaAutoinmunes = collection["chkDermaAutoinmunes"];
                    string RespuestaDermaEsclerodermia = collection["chkDermaEsclerodermia"];
                    string RespuestaDermaOtra = collection["chkDermaOtra"];

                    if (RespuestaDermaDermatitis == "on")
                    {
                        RespuestaDerma = RespuestaDerma + "Dermatitis seborreica, ";
                    }
                    if (RespuestaDermaAlopecia == "on")
                    {
                        RespuestaDerma = RespuestaDerma + "Alopecia areata, ";
                    }
                    if (RespuestaDermaAutoinmunes == "on")
                    {
                        RespuestaDerma = RespuestaDerma + "Enfermedades autoinmunes, ";
                    }
                    if (RespuestaDermaEsclerodermia == "on")
                    {
                        RespuestaDerma = RespuestaDerma + "Esclerodermia, ";
                    }
                    if (RespuestaDermaOtra == "on")
                    {
                        RespuestaDerma = RespuestaDerma + "Otra, ";
                    }
                    if (RespuestaDerma != string.Empty)
                    {
                        int n = RespuestaDerma.Length;
                        RespuestaDerma = RespuestaDerma.TrimEnd(' ').TrimEnd(',');
                    }

                }
                else
                {
                    RespuestaDerma = "No";
                }

                //Pelones
                string RespuestaPelones = string.Empty;

                string RespuestaPeloSi = collection["chkPeloSi"];
                string RespuestaPeloNo = collection["chkPeloNo"];
                if (RespuestaPeloSi == "on")
                {
                    RespuestaPelones = "Sí";
                }
                else
                {
                    RespuestaPelones = "No";
                }


                using (ModeloTempora conexionDB = new ModeloTempora())
                {

                    //Se guarda el Usuario.
                    Cliente cliente = new Cliente();
                    cliente.nombre = Nombre;
                    cliente.apellido = Apellido;
                    cliente.rut = Rut;
                    cliente.telefono = Telefono;
                    cliente.celular = Celular;
                    cliente.correo = Correo;
                    cliente.fecha_nacimiento = DateTime.Parse(FechaDeNacimiento);
                    conexionDB.Cliente.Add(cliente);
                    conexionDB.SaveChanges();

                    //Se guarda la solicitud del usuario
                    Solicitud solicitud = new Solicitud();
                    solicitud.FK_idCliente = cliente.idCliente;
                    idcliente = cliente.idCliente.ToString();
                    solicitud.RespPelo = RespuestaPelones;
                    solicitud.RespDerm = RespuestaDerma;
                    solicitud.RespZona = RespuestaZona;
                    solicitud.FechaSolicitud = DateTime.Now;
                    conexionDB.Solicitud.Add(solicitud);
                    conexionDB.SaveChanges();

                    //Enviar Correo
                    string titulo  = "Nueva Solicitud - Portal Tempora";
                    string nombre  = cliente.nombre + " " + cliente.apellido;
                    string correo  = cliente.correo;
                    string rut     = cliente.rut;
                    string celular = cliente.celular;
                    string textoCorreo = System.IO.File.ReadAllText(HttpContext.Server.MapPath("~/Styles/MensajeSolicitudUsuario.html")).Replace("[Nombre]", nombre).Replace("[Correo]", correo).Replace("[Rut]", rut).Replace("[Celular]", celular);
                    Util.EnviarMail(textoCorreo, "isaac.aburto@backspace.cl", titulo);

                }
                return RedirectToAction("Enviado/" + idcliente, "Solicitudes");
            }
            catch (Exception ex)
            {
                Util.escribirLog("Home", "Solicitud (GET)", ex.Message);
                return RedirectToAction("Index", "Home");
            }
        }



        public ActionResult Index2()
        {
            return View();
        }
        //
        // GET: /Home/Login

        public ActionResult Login()
        {
            return RedirectToAction("Index", "Home"); 
        }

        //
        // GET: /Home/Login
        [HttpPost]
        public ActionResult Login(FormCollection collection)
        {
            return RedirectToAction("Index", "Home"); 
        }
        

        //
        // GET: /Home/CerrarSesion

        public ActionResult CerrarSesion()
        {
            Session.Abandon();
            return RedirectToAction("Login", "Home"); 
        }

        //
        // GET: /Home/Error404

        public ActionResult Error404()
        {
            return View();
        }

    }
}
