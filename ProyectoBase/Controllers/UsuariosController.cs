using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebSolicitudes.Models;

namespace WebSolicitudes.Controllers
{
    public class UsuariosController : Controller
    {
        //
        // GET: /Usuarios/

        [HttpPost]
        public ActionResult Login(FormCollection collection)
        {
            string usr = collection["inputEmail"];
            string pass = collection["inputPassword"];
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
            return View();
        }

    }
}
