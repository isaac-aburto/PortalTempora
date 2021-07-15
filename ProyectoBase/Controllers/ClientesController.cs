using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebSolicitudes.Models;

namespace WebSolicitudes.Controllers
{
    public class ClientesController : Controller
    {
        //
        // GET: /Clientes/

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

                        //Lista Clientes
                        List<Cliente> listaclientes = conexionDB.Cliente.ToList();
                        string filaCliente = string.Empty;
                        foreach (Cliente clientes in listaclientes)
                        {
                            filaCliente += "<tr>";
                            filaCliente += "  <td>";
                            string URL = Url.Content("~/Solicitudes/GestionSolicitudes/");
                            filaCliente += "<a href='" + URL + clientes.idCliente + "'>" + clientes.idCliente + "</a>";
                            filaCliente += "  </td>";
                            filaCliente += "  <td>";
                            filaCliente += clientes.nombre + " " + clientes.apellido;
                            filaCliente += "  </td>";
                            filaCliente += "  <td>";
                            filaCliente += clientes.correo;
                            filaCliente += "  </td>";
                            filaCliente += "  <td>";
                            filaCliente += clientes.celular;
                            filaCliente += "  </td>";
                            filaCliente += "  <td>";
                            filaCliente += "<button title='Delete' class='btn btn-icon btn-2 btn-danger btnEliminar' type='button'><span class='btn-inner--icon' style='border-radius: 11px;'><i class='fa fa-trash fa-1x'></i></span></button>";
                            filaCliente += "<button title='Delete' class='btn btn-icon btn-2 btn-primary btnEliminar' type='button'><span class='btn-inner--icon' style='border-radius: 11px;'><i class='fa fa-edit fa-1x'></i></span></button>";
                            filaCliente += "  </td>";
                            filaCliente += "</tr>";
                        }
                        ViewData["valoresclientes"] = filaCliente;
                        return View();

                    }
                }
            }
            catch (Exception ex)
            {
                Util.escribirLog("Index", "Clientes", ex.Message);
                return RedirectToAction("Solicitudes");
            }
            return View();
        }

    }
}
