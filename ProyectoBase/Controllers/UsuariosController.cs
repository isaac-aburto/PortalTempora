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
            pass = Util.GetSHA1(pass);
            string consultaApi = string.Empty;
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

        public ActionResult Perfil()
        {
            try
            {
                string valorUsuario = Session["IdUsuario"] != null ? Session["IdUsuario"].ToString() : string.Empty;
                using (ModeloTempora conexionDB = new ModeloTempora()) {
                    if (int.TryParse(valorUsuario, out int idUsuario))
                    {
                        Usuario usuario = conexionDB.Usuario.Find(idUsuario);
                        //Validación de Usuario
                        if (usuario == null)
                            throw new Exception("El usuario no existe");
                        ViewData["id"] = usuario.idUsuario;
                        ViewData["Nombre"] = usuario.Nombre + " " + usuario.Apellido;
                        ViewData["Correo"] = usuario.Correo;
                        ViewData["Telefono"] = usuario.Celular;
                    }
                }
            }
            catch (Exception ex)
            {
                Util.escribirLog("Perfil", "Usuarios", ex.Message);
                return RedirectToAction("Tickets");
            }
            return View();
        }

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
                       
                        //Lista Usuarios
                        List<Usuario> listausuarios = conexionDB.Usuario.ToList();
                        string filaUsuario = string.Empty;
                        foreach (Usuario usuarios in listausuarios) {
                            filaUsuario += "<tr>";
                            filaUsuario += "  <td>";
                            string URL = Url.Content("~/Usuarios/EditarUsuario/");
                            filaUsuario += "<a href='" + URL + usuarios.idUsuario + "'>" + usuarios.idUsuario + "</a>";
                            filaUsuario += "  </td>";
                            filaUsuario += "  <td>";
                            filaUsuario += usuarios.Nombre+ " " + usuarios.Apellido;
                            filaUsuario += "  </td>";
                            filaUsuario += "  <td>";
                            filaUsuario += usuarios.Perfil.nombrePerfil;
                            filaUsuario += "  </td>";
                            filaUsuario += "  <td>";
                            filaUsuario += usuarios.Correo;
                            filaUsuario += "  </td>";
                            filaUsuario += "  <td>";
                            filaUsuario += usuarios.Celular;
                            filaUsuario += "  </td>";
                            filaUsuario += "  <td>";
                            filaUsuario += "<button title='Borrar' class='btn btn-icon btn-2 btn-danger btnEliminar' type='button' data-toggle='modal' data-target='#exampleModal' ><span class='btn-inner--icon' style='border-radius: 11px;'><i class='fa fa-trash fa-1x'></i></span></button>";
                            filaUsuario += "<button title='Editar' class='btn btn-icon btn-2 btn-primary btnEditar' type='button'><span class='btn-inner--icon' style='border-radius: 11px;'><a href='" + URL + usuarios.idUsuario + "'><i style='color: white'class='fa fa-edit fa-1x'></i></a></span></button>";
                            filaUsuario += "  </td>";
                            filaUsuario += "</tr>";
                        }
                        ViewData["valoresUsuarios"] = filaUsuario;
                        return View();

                    }
                }
            }
            catch (Exception ex)
            {
                Util.escribirLog("Index", "Usuarios", ex.Message);
                return RedirectToAction("Tickets");
            }
            return View();
        }
        public ActionResult AgregarUsuario()
        {
            return View();
        }

        [HttpPost]
        public ActionResult AgregarUsuario(FormCollection collection)
        {
            try
            {
                string nombre = collection["txtNombre"];
                string apellido = collection["txtApellido"];
                string Perfil = collection["txtPerfil"];
                string Correo = collection["txtEmail"];
                string Telefono = collection["txtTelefono"];
                string Celular = collection["txtCelular"];
                string PipeDrive = collection["txtPipeDrive"];

                string valorUsuario = Session["IdUsuario"] != null ? Session["IdUsuario"].ToString() : string.Empty;
                using (ModeloTempora conexionDB = new ModeloTempora())
                {
                    if (int.TryParse(valorUsuario, out int idUsuario))
                    {
                        Usuario usuario = new Usuario();
                        //Validación de Usuario
                        usuario.Nombre = nombre;
                        usuario.Apellido = apellido;
                        usuario.FK_idPerfil = int.Parse(Perfil);
                        usuario.Correo = Correo;
                        usuario.Telefono = Telefono;
                        usuario.Celular = Celular;
                        usuario.idPipeDrive = PipeDrive;
                        conexionDB.Usuario.Add(usuario);
                        conexionDB.SaveChanges();
                    }
                }
            }
            catch (Exception ex)
            {
                Util.escribirLog("AgregarUsuario", "Usuarios", ex.Message);
                return RedirectToAction("AgregarUsuario");
            }
            return RedirectToAction("Index"); 
        }

        public ActionResult EditarUsuario(int id)
        {
            try
            {
                
                string valorUsuario = Session["IdUsuario"] != null ? Session["IdUsuario"].ToString() : string.Empty;
                using (ModeloTempora conexionDB = new ModeloTempora())
                {
                    if (int.TryParse(valorUsuario, out int idUsuario))
                    {
                        Usuario usuario = conexionDB.Usuario.Find(id);
                        if (usuario == null)
                            throw new Exception("El usuario no existe");

                        List<Perfil> listaPerfiles = conexionDB.Perfil.ToList();
                        string opcionesPerfiles = string.Empty;
                        opcionesPerfiles += "<option value='0'>-- Selecciona opción --</option>";
                        foreach (Perfil item in listaPerfiles)
                        {
                            if (item.idPerfil == usuario.FK_idPerfil)
                            {
                                opcionesPerfiles += "<option selected value='" + item.idPerfil + "'>" + item.nombrePerfil + "</option>";
                            }
                            else
                            {
                                opcionesPerfiles += "<option  value='" + item.idPerfil + "'>" + item.nombrePerfil + "</option>";
                            }

                        }
                        ViewData["txtIdUsuario"] = id.ToString();
                        ViewData["opcionesPerfil"] = opcionesPerfiles;
                        ViewData["txtNombre"] = usuario.Nombre;
                        ViewData["txtApellido"] = usuario.Apellido;
                        ViewData["txtPerfil"] = usuario.Perfil.nombrePerfil;
                        ViewData["txtCorreo"] = usuario.Correo;
                        ViewData["txtTelefono"] = usuario.Telefono;
                        ViewData["txtCelular"] = usuario.Celular;
                        ViewData["txtPipeDrive"] = usuario.idPipeDrive;

                    }
                }
            }
            catch (Exception ex)
            {
                Util.escribirLog("AgregarUsuario", "Usuarios", ex.Message);
                return RedirectToAction("AgregarUsuario");
            }
 
            return View();
        }

        [HttpPost]
        public ActionResult EditarUsuario(FormCollection collection)
        {
            int idusuario = int.Parse(collection["txtIdUsuario"]);
            try
            {
                
                
                string nombre = collection["txtNombre"];
                string apellido = collection["txtApellido"];
                string Perfil = collection["txtPerfil"];
                string Correo = collection["txtEmail"];
                string Telefono = collection["txtTelefono"];
                string Celular = collection["txtCelular"];
                string PipeDrive = collection["txtPipeDrive"];

                string valorUsuario = Session["IdUsuario"] != null ? Session["IdUsuario"].ToString() : string.Empty;
                using (ModeloTempora conexionDB = new ModeloTempora())
                {
                    if (int.TryParse(valorUsuario, out int idUsuario))
                    {
                        Usuario usuario = conexionDB.Usuario.Find(idusuario);
                        if (usuario == null)
                            throw new Exception("El usuario no existe");
                        usuario.Nombre = nombre;
                        usuario.Apellido = apellido;
                        usuario.Correo = Correo;
                        usuario.FK_idPerfil = int.Parse(Perfil);
                        usuario.Telefono = Telefono;
                        usuario.Celular = Celular;
                        usuario.idPipeDrive = PipeDrive;
                        conexionDB.SaveChanges();
                    }
                }

            }
            catch (Exception ex)
            {
                Util.escribirLog("AgregarUsuario", "Usuarios", ex.Message);
                return RedirectToAction("AgregarUsuario");
            }

            return RedirectToAction("EditarUsuario/" + idusuario.ToString(), "Usuarios");
        }
    }
}
