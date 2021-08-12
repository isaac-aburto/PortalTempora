using System;
using System.Collections.Generic;
using System.IO;
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
                    string URL = Url.Content("~/Admin/EditarArchivo/");
                    filaArchivoVideo +=  archivo.nombreArchivo;
                    filaArchivoVideo += "  </td>";
                    filaArchivoVideo += "  <td>";
                    filaArchivoVideo += archivo.SeccionArchivo.nombreSeccion;
                    filaArchivoVideo += "  </td>";
                    filaArchivoVideo += "  <td>";
                    filaArchivoVideo += archivo.pathArchivo;
                    filaArchivoVideo += "  </td>";
                    filaArchivoVideo += "  <td>";
                    filaArchivoVideo += "<button title='Eliminar' class='btn btn-icon btn-2 btn-danger btnEliminar' type='button'><span class='btn-inner--icon' style='border-radius: 11px;'><i class='fa fa-trash fa-1x'></i></span></button>";
                    filaArchivoVideo += "<button title='Editar' class='btn btn-icon btn-2 btn-primary btnEliminar' type='button'><span class='btn-inner--icon' style='border-radius: 11px;'><a href='" + URL + archivo.idArchivo + "'><i style='color: white'class='fa fa-edit fa-1x'></i></a></span></button>";
                    filaArchivoVideo += "  </td>";
                    filaArchivoVideo += "</tr>";
                }
                ViewData["filaArchivoVideo"] = filaArchivoVideo;
            }
            return View();
        }

        public ActionResult EditarArchivo(int id)
        {
            try
            {

                string valorUsuario = Session["IdUsuario"] != null ? Session["IdUsuario"].ToString() : string.Empty;
                using (ModeloTempora conexionDB = new ModeloTempora())
                {
                    if (int.TryParse(valorUsuario, out int idUsuario))
                    {
                        Usuario usuario = conexionDB.Usuario.Find(idUsuario);
                        if (usuario == null)
                            throw new Exception("El usuario no existe");

                        ArchivoVideo archivo = conexionDB.ArchivoVideo.Find(id);
                        if (archivo == null)
                            throw new Exception("El archivo no existe");

                        ViewData["idArchivo"] = archivo.idArchivo;
                        ViewData["nombreArchivo"] = archivo.nombreArchivo;
                        ViewData["pathArchivo"] = archivo.pathArchivo;
                        //var a = archivo.pathArchivo.ToString().Split('');

                        //string a = archivo.pathArchivo.Replace('\\', '/');
                        string a = archivo.src;
                        ViewData["pathArchivo2"] = a;
                    

                        List<SeccionArchivo> listaSeccion= conexionDB.SeccionArchivo.ToList();
                        string opcionesSeccion = string.Empty;
                        opcionesSeccion += "<option value='0'>-- Selecciona opción --</option>";
                        foreach (SeccionArchivo item in listaSeccion)
                        {
                            if (item.idSeccion == archivo.FK_Seccion)
                            {
                                opcionesSeccion += "<option selected value='" + item.idSeccion + "'>" + item.nombreSeccion + "</option>";
                            }
                            else
                            {
                                opcionesSeccion += "<option  value='" + item.idSeccion + "'>" + item.nombreSeccion + "</option>";
                            }

                        }
                        ViewData["opcionesSeccion"] = opcionesSeccion;


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
        public ActionResult EditarArchivo(IEnumerable<HttpPostedFileBase> files, FormCollection collection)
        {
            int id = int.Parse(collection["txtIdArchivo"]);
            try
            {
                
                string apellido = collection["txtApellido"];
                string Perfil = collection["txtPerfil"];
                string nombreArchivo = collection["txtNombreArchivo"];
                string valorUsuario = Session["IdUsuario"] != null ? Session["IdUsuario"].ToString() : string.Empty;

                string base64FotoFrente = "";
                base64FotoFrente = base64FotoFrente.Replace("data:image/jpeg;base64,", "");

                using (ModeloTempora conexionDB = new ModeloTempora())
                {
                    if (int.TryParse(valorUsuario, out int idUsuario))
                    {
                        Usuario usuario = conexionDB.Usuario.Find(idUsuario);
                        if (usuario == null)
                            throw new Exception("El usuario no existe");

                        ArchivoVideo archivo = conexionDB.ArchivoVideo.Find(id);
                        if (archivo == null)
                            throw new Exception("El archivo no existe");

                        foreach (var file in files)
                        {
                            if (file != null && file.ContentLength > 0)
                            {
                                var nombrearchivo = Path.GetFileName(file.FileName);
                                archivo.nombreArchivo = nombreArchivo;
                                var path = Path.Combine(Server.MapPath("~/Styles/caso/"), nombreArchivo);
                                file.SaveAs(Server.MapPath("~/Styles/caso/" + nombreArchivo));
                                archivo.pathArchivo = path;
                                //System.IO.File.WriteAllBytes(path, Util.ConvertirBase64ABytes(base64FotoFrente));

                            }
                        }

                        conexionDB.SaveChanges();
                    }
                }

            }
            catch (Exception ex)
            {
                Util.escribirLog("AgregarUsuario", "Usuarios", ex.Message);
                return RedirectToAction("Index");
            }

            return RedirectToAction("Index", "Admin");
        }

    }
}
