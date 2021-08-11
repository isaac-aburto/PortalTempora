using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebSolicitudes.Models;

namespace WebSolicitudes.Controllers
{
    public class AdminController : Controller
    {
        //
        // GET: /Admin/

        public ActionResult Index()
        {
            using (ModeloTempora conexionDB = new ModeloTempora())
            {
                List<ArchivoVideo> listaArchivo = conexionDB.ArchivoVideo.ToList();
                string filaArchivoVideo = string.Empty;
                foreach (ArchivoVideo archivo in listaArchivo)
                {
                    filaArchivoVideo += "<tr>";
                    filaArchivoVideo += "  <td>";
                    string URL = Url.Content("~/Clientes/Perfil/");
                    filaArchivoVideo += "<a href='" + URL + archivo.idArchivo + "'>" + archivo.nombreArchivo + "</a>";
                    filaArchivoVideo += "  </td>";
                    filaArchivoVideo += "  <td>";
                    filaArchivoVideo += archivo.SeccionArchivo.nombreSeccion;
                    filaArchivoVideo += "  </td>";
                    filaArchivoVideo += "  <td>";
                    filaArchivoVideo += archivo.pathArchivo;
                    filaArchivoVideo += "  </td>";
                    filaArchivoVideo += "  <td>";
                    filaArchivoVideo += "<button title='Delete' class='btn btn-icon btn-2 btn-danger btnEliminar' type='button'><span class='btn-inner--icon' style='border-radius: 11px;'><i class='fa fa-trash fa-1x'></i></span></button>";
                    filaArchivoVideo += "<button title='Delete' class='btn btn-icon btn-2 btn-primary btnEliminar' type='button'><span class='btn-inner--icon' style='border-radius: 11px;'><i class='fa fa-edit fa-1x'></i></span></button>";
                    filaArchivoVideo += "  </td>";
                    filaArchivoVideo += "</tr>";
                }
                ViewData["filaArchivoVideo"] = filaArchivoVideo;
            }
            return View();
        }

    }
}
