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
            //Usuario
            string Nombre = collection["txtNombre"];
            string Apellido = collection["txtApellido"];
            string Rut = collection["txtRut"];
            string Correo = collection["txtEmail"];
            string Telefono = collection["txtTelefono"];
            string Celular = collection["txtCelular"];

            string idcliente;
            //Solicitud
            string RespuestaZona = collection["txtZona"];
            string RespuestaDerma = collection["txtDerma"];
            string RespuestaPelones = collection["txtPelones"];
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
                conexionDB.Cliente.Add(cliente);
                conexionDB.SaveChanges();

                //Se guarda la solicitud del usuario
                Solicitud solicitud = new Solicitud();
                solicitud.FK_idCliente = cliente.idCliente;
                idcliente = cliente.idCliente.ToString();
                solicitud.RespDerm = RespuestaDerma;
                solicitud.RespPelo = RespuestaPelones;
                solicitud.RespZona = RespuestaZona;
                solicitud.FechaSolicitud = DateTime.Now;
                conexionDB.Solicitud.Add(solicitud);
                conexionDB.SaveChanges();
            }
            return RedirectToAction("Enviado/" + idcliente, "Solicitudes");
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
