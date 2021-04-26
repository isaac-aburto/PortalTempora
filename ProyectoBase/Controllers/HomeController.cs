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
using FiftyOne.Foundation.Bases;

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
        public ActionResult Index(/*IEnumerable<HttpPostedFileBase> files,*/ FormCollection collection) {
            try
            {
                //Usuario
                string foto = collection["fotografia"];
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



                    ////Agrego cada Archivo.
                    //foreach (var file in files)
                    //{
                    //    if (file != null && file.ContentLength > 0)
                    //    {
                    //        var filename = Path.GetFileName(file.FileName);
                    //        //var path = Path.GetTempPath();
                    //        var path = Path.Combine(Server.MapPath("~/App_Data/uploadsTickets"), filename);
                    //        file.SaveAs(path);

                    //        Fotos fotos = new Fotos();

                    //        //Ver si existe otro archivo con el mismo nombre.
                    //        List<Fotos> listafotos = conexionDB.Fotos.ToList();
                    //        String opciones = string.Empty;
                    //        int n = 0;
                    //        string segundoNombre = "";
                    //        bool igual = false;
                    //        foreach (Fotos item in listafotos)
                    //        {
                    //            if (item.nombreArchivo == filename)
                    //            {
                    //                n++;
                    //                igual = true;
                    //                if (igual == true)
                    //                {
                    //                    string nombrefile = filename.Split('.').FirstOrDefault();
                    //                    string exten = filename.Split('.').LastOrDefault();
                    //                    if (n != 1)
                    //                    {
                    //                        string nombrefileparnt = nombrefile.Split('(').FirstOrDefault();
                    //                        segundoNombre = nombrefileparnt + "(" + n.ToString() + ")." + exten;
                    //                    }
                    //                    else
                    //                    {
                    //                        segundoNombre = nombrefile + "(" + n.ToString() + ")." + exten;
                    //                    }
                    //                }
                    //            }
                    //        }

                    //        if (igual == false)
                    //        {
                    //            segundoNombre = filename;
                    //        }
                    //        fotos.nombreFalso =
                    //        fotos.nombreArchivo = filename;
                    //        fotos.baseArchivo = Util.ConvertirArchivoABase64(path);
                    //        var ultimoId = solicitud.idSolicitud;
                    //        fotos.FK_idSolicitud = ultimoId;
                    //        conexionDB.Fotos.Add(fotos);
                    //        conexionDB.SaveChanges();
                    //        //respuesta.AdjuntoEvidencias = archivo.id_archivo;
                    //    }
                    //}




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
            return View(); 
        }

        //
        // GET: /Home/Login
        [HttpPost]
        public ActionResult Login(FormCollection collection)
        {
            string usr = collection["inputEmail"];
            string pass = collection["inputPassword"];
            pass = Util.GetSHA1(pass);
            try
            {
                using (ModeloTempora conexionDB = new ModeloTempora())
                {
                    Usuario usuario = conexionDB.Usuario.Where(w => w.Correo == usr && w.Password == pass).FirstOrDefault();
                    if (usuario != null)
                    {
                        Session.Timeout = 60;
                        Session["Conectado"] = true;
                        Session["IdUsuario"] = usuario.idUsuario;
                        Session["IdPerfil"] = usuario.FK_idPerfil;
                        Session["Usuario"] = usuario;
                        Session["Nombre"] = usuario.Nombre + " " + usuario.Apellido;
                        Session["Correo"] = usuario.Correo;
                        Session["Celular"] = usuario.Telefono;
                        Session["Telefono"] = usuario.Celular;
                        //Session["Permisos"] = new HomeController().NivelDePermisos(usuario.id_Usuarios);

                        return RedirectToAction("Index", "Solicitudes");
                    }

                }
            }
            catch (Exception ex)
            {

                Util.escribirLog("Login", "Post", ex.Message);
                Util.escribirLog("Login", "Post", ex.InnerException.Message);
                return RedirectToAction("Index", "Home");


            }
            return View();
        }

        public ActionResult OlvidePassword()
        {
            return View();
        }

        [HttpPost]
        public ActionResult OlvidePassword(FormCollection collection)
        {
            try
            {
                using (ModeloTempora conexionDB = new ModeloTempora())
                {
                    string correo = collection["correo"].ToString();
                    //string CAMBIAR = "isaac.aburto@backspace.cl";
                    string fecha = DateTime.Now.ToString();
                    var objDLL = new Base32();

                    string id = (conexionDB.Usuario.Where(w => w.Correo == correo).Select(s => s.idUsuario).FirstOrDefault()).ToString();
                    if (id != "0")
                    {
                        string urlServidor = Url.Action("SolicitudCambioPass", "Usuarios", null, Request.Url.Scheme);
                        string nombre = conexionDB.Usuario.Where(d => d.Correo == correo).Select(s => s.Nombre).FirstOrDefault().ToString();
                        //string fecha_idurl = /*fecha + ";" + */id;
                        string fecha_idurl = Util.Base64Encode(fecha + ";" + id);
                        string hola = Util.Base64Decode(fecha_idurl);
                        string titulo = "Cambio de Contraseña";
                        string texto = System.IO.File.ReadAllText(HttpContext.Server.MapPath("~/Styles/CorreoCambioPass.html")).Replace("[Nombre]", nombre).Replace("[CodigoUrl]", fecha_idurl);
                        texto = texto.Replace("[URLServidor]", urlServidor);
                        Util.EnviarMail(texto, correo, titulo);
                        ViewData["Bueno"] = "Su correo se envió con éxito";
                    }
                    else
                    {
                        ViewData["Error"] = "El correo no existe";
                        return View();
                    }
                }
            }
            catch (Exception ex)
            {
                ViewData["Error"] = "Error interno, por favor comuníquese con un administrador";
                Util.escribirLog("Usuario", "Activar", ex.Message);
                return View();
            }
            return View();
        }

        public ActionResult Pass(string id)
        {
            try
            {
                string error = string.Empty;
                //string[] fecha_idurl = id.Split(';');
                //string fecha = fecha_idurl[0];
                string[] fecha_idurl = Util.Base64Decode(id).Split(';');
                string fecha = fecha_idurl[0];
                string idurl = fecha_idurl[1];
                //string ID = idurl.Split(';').ToString();
                //DateTime fecha_pasado = Convert.ToDateTime(fecha).AddHours(12);
                //DateTime fecha_abierto = DateTime.Now;
                //if (DateTime.Compare(fecha_pasado, fecha_abierto) > 0)
                //{
                //Guardo el ID en la vista
                ViewData["id"] = idurl;
                return View();
                //}
                //else
                //{
                //    error = "El tiempo expiró";
                //    return RedirectToAction("Pass", "Usuarios");
                //}
            }
            catch (Exception ex)
            {
                Util.escribirLog("Usuario", "Pass", ex.Message);
                return RedirectToAction("Pass", "Usuarios");
            }
        }

        [HttpPost]
        public ActionResult GuardarContraseña(FormCollection collection)
        {
            int id = Int32.Parse(collection["ocultar"]);
            string error = string.Empty;
            string pass1 = collection["pss1"];
            string pass2 = collection["pss2"];
            try
            {
                if (pass1 == pass2)
                {
                    pass1 = Util.GetSHA1(pass1);
                    using (ModeloTempora conexionDB = new ModeloTempora())
                    {
                        Usuario usuario = conexionDB.Usuario.Find(id);
                        if (usuario != null)
                        {
                            usuario.Password = pass1;
                            conexionDB.SaveChanges();
                            // Iniciar Sesión
                            Session.Timeout = 60;
                            Session["Conectado"] = true;
                            Session["IdUsuario"] = usuario.idUsuario;
                            Session["IdPerfil"] = usuario.FK_idPerfil;
                            Session["Usuario"] = usuario;
                            Session["Nombre"] = usuario.Nombre + " " + usuario.Apellido;
                            Session["Correo"] = usuario.Correo;
                            Session["Celular"] = usuario.Telefono;
                            Session["Telefono"] = usuario.Celular;
                            return RedirectToAction("Index", "Solicitudes");
                        }
                        else
                        {
                            ViewData["Error"] = "Error interno";
                            return RedirectToAction("Pass", "Home");
                        }
                    }
                }
                else
                {
                    ViewData["Error"] = "Error - contraseñas distintas";
                    return RedirectToAction("Pass", "Home");
                }
            }
            catch (Exception ex)
            {
                Util.escribirLog("Usuario", "Pass", ex.Message);
                return RedirectToAction("Pass", "Usuarios");
            }
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
