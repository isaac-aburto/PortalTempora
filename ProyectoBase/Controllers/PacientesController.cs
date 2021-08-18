using SpreadsheetLight;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebSolicitudes.Models;
using Newtonsoft.Json.Linq;

using System.Data;
using System.Text;
using System.Threading.Tasks;
using OfficeOpenXml;
using System.IO;
using System.Drawing;
using OfficeOpenXml.Style;

namespace WebSolicitudes.Controllers
{
    public class PacientesController : Controller
    {
        //
        // GET: /Pacientes/

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
                            string URL = Url.Content("~/Clientes/Perfil/");
                            filaCliente += "<a href='" + URL + clientes.idCliente + "'>" + clientes.idCliente + "</a>";
                            filaCliente += "  </td>";
                            filaCliente += "  <td>";
                            filaCliente += clientes.nombre + " " + clientes.apellido;
                            filaCliente += "  </td>";
                            filaCliente += "  <td>";
                            filaCliente += clientes.rut;
                            filaCliente += "  </td>";
                            filaCliente += "  <td>";
                            filaCliente += clientes.correo;
                            filaCliente += "  </td>";
                            filaCliente += "  <td>";
                            filaCliente += clientes.Solicitud.Select(s => s.idSolicitud).FirstOrDefault().ToString();
                            filaCliente += "  </td>";
                            filaCliente += "  <td>";
                            //clientes.Solicitud.Select(s => s.EstadoSolicitud.nombreEstado);
                            string idestado = clientes.Solicitud.Select(s => s.Fk_idEstado).FirstOrDefault().ToString();
                            if (idestado != "")
                            {
                                int id = int.Parse(idestado);

                                filaCliente += conexionDB.EstadoSolicitud.Where(w => w.idEstado == id).Select(s => s.nombreEstado).FirstOrDefault().ToString();
                            }
                            else {
                                filaCliente += "Sin solicitud";
                            }
                            filaCliente += "  </td>";
                            filaCliente += "  <td>";
                            DateTime bDate1 = Convert.ToDateTime(clientes.Solicitud.Select(s => s.FechaSolicitud).FirstOrDefault());
                            //bDate1 = Convert.ToDateTime(bDate1);
                            filaCliente += bDate1.ToString("dd-MM-yyyy hh:mm:ss");
                            //filaCliente += clientes.Solicitud.Select(s=> s.FechaSolicitud).FirstOrDefault().ToString();
                            filaCliente += "  </td>";
                            filaCliente += "  <td>";
                            filaCliente += "<button title='Borrar' class='btn btn-icon btn-2 btn-danger btnEliminar' type='button'><span class='btn-inner--icon' style='border-radius: 11px;'><i class='fa fa-trash fa-1x'></i></span></button>";
                            filaCliente += "<button title='Editar' class='btn btn-icon btn-2 btn-primary btnEliminar' type='button'><span class='btn-inner--icon' style='border-radius: 11px;'><i class='fa fa-edit fa-1x'></i></span></button>";
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
                Util.escribirLog("Index", "Pacientes", ex.Message);
                return RedirectToAction("Index");
            }
            return View();
        }

        public ActionResult Perfil(int id)
        {
            int idCliente = id;
            try
            {
                
                using (ModeloTempora conexionDB = new ModeloTempora())
                {

                    Cliente cliente = conexionDB.Cliente.Find(idCliente);
                    //Validación de Cliente
                    if (cliente == null)
                        throw new Exception("El cliente no existe");
                    ViewData["id"] = cliente.idCliente;
                    ViewData["Nombre"] = cliente.nombre;
                    ViewData["Correo"] = cliente.correo;
                    ViewData["Telefono"] = cliente.celular;
         
                    //Fotos
                    Solicitud solicitud = conexionDB.Solicitud.Where(w=> w.FK_idCliente == cliente.idCliente).FirstOrDefault();
                    ViewData["EstadoSolicitud"] = solicitud.EstadoSolicitud.nombreEstado;
                    ViewData["idSolicitud"] = solicitud.idSolicitud;

                    string nombreMedico = "Médico no asignado";
                    //Infoprmacion Solicitud
                    if (solicitud.FK_idUsuario != null)
                    {
                        nombreMedico = solicitud.Usuario.Nombre + " " + solicitud.Usuario.Apellido;
                    }
                    ViewData["MedicoAsignado"] = nombreMedico;

                    if (solicitud.FechaCirugia != null)
                    {
                        string fechaCirugia = solicitud.FechaCirugia.ToString();
                        ViewData["FechaCirugia"] = fechaCirugia;
                    }
                    else {
                        string fechaCirugia = "Cirugía no asignada";
                        ViewData["FechaCirugia"] = fechaCirugia;
                    }



                    int idSolicitud = solicitud.idSolicitud;
                    int conteoFotos = conexionDB.Fotos.Count();
                    if (conteoFotos != 0)
                    {
                        List<Fotos> listaFotos = conexionDB.Fotos.ToList();
                        int cont = 0;

                        foreach (Fotos item in listaFotos)
                        {


                            if (item.FK_idSolicitud == idSolicitud)
                            {
                                if (item.FK_idSolicitud == idSolicitud && cont == 0)
                                {
                                    ViewData["Foto1"] = "data: image/" + "jpeg" + "; base64, " + item.baseArchivo + "";

                                }
                                if (item.FK_idSolicitud == idSolicitud && cont == 1)
                                {
                                    ViewData["Foto2"] = "data: image/" + "jpeg" + "; base64, " + item.baseArchivo + "";

                                }
                                if (item.FK_idSolicitud == idSolicitud && cont == 2)
                                {
                                    ViewData["Foto3"] = "data: image/" + "jpeg" + "; base64, " + item.baseArchivo + "";

                                }
                                if (item.FK_idSolicitud == idSolicitud && cont == 3)
                                {
                                    ViewData["Foto4"] = "data: image/" + "jpeg" + "; base64, " + item.baseArchivo + "";

                                }
                                if (item.FK_idSolicitud == idSolicitud && cont == 4)
                                {
                                    ViewData["Foto5"] = "data: image/" + "jpeg" + "; base64, " + item.baseArchivo + "";

                                }
                                cont++;
                            }
                        }

                        Util.escribirLog("Solicitudes", "GestionSolicitud (GET)", "Leyó todas la Fotos");
                    }
                    else
                    {
                        Util.escribirLog("Solicitudes", "GestionSolicitud (GET)", "Leyó ninguna Foto");
                    }


                }
            }
            catch (Exception ex)
            {
                Util.escribirLog("Perfil", "Pacientes", ex.Message);
                return RedirectToAction("Pacientes");
            }
            return View();
        }


        public ActionResult DescargaExcel(string idCliente) {
            // If you use EPPlus in a noncommercial context
            // according to the Polyform Noncommercial license:
            int id = int.Parse(idCliente);

            string nombre = "";
            string rut = "";
            string correo = "";
            string celular = "";
            string idSolicitud = "";
            string estadoSolicitud = "";

            ExcelPackage.LicenseContext = LicenseContext.NonCommercial;
            using (ExcelPackage excel = new ExcelPackage()) {

                using (ModeloTempora conexionDB = new ModeloTempora())
                {
                    //Busco al cliente
                    Cliente cliente = conexionDB.Cliente.Find(id);
                    nombre = cliente.nombre;
                    rut = cliente.rut;
                    correo = cliente.correo;
                    celular = cliente.celular;
                    idSolicitud = cliente.Solicitud.FirstOrDefault().idSolicitud.ToString();
                    estadoSolicitud = cliente.Solicitud.FirstOrDefault().EstadoSolicitud.nombreEstado;
                }

                excel.Workbook.Worksheets.Add("a");
                excel.Workbook.Worksheets.Add("Worksheet2");
                excel.Workbook.Worksheets.Add("Worksheet3");


                var headerRow = new List<string[]>()
                    {
                        new string[] { "ID", "Nombre", "Rut", "Correo", "Celular", "ID Solicitud", "Estado Solicitud"}
                    };

                // Determine the header range (e.g. A1:D1)
                string headerRange = "A1:" + Char.ConvertFromUtf32(headerRow[0].Length + 64) + "1";

                // Target a worksheet
                var worksheet = excel.Workbook.Worksheets["a"];
                using (var range = worksheet.Cells[1, 1, 1, 7])
                {
                    range.Style.Font.Size = 14;
                    range.Style.Fill.PatternType = ExcelFillStyle.Solid;
                    range.Style.Fill.BackgroundColor.SetColor(Color.ForestGreen);
                    range.Style.Font.Color.SetColor(Color.White);
                    range.AutoFitColumns();
                }
                // Popular header row data
                worksheet.Cells[headerRange].LoadFromArrays(headerRow);
                
                worksheet.Cells["A2"].Value = id;
                worksheet.Cells["B2"].Value = nombre;
                worksheet.Cells["C2"].Value = rut;
                worksheet.Cells["D2"].Value = correo;
                worksheet.Cells["E2"].Value = celular;
                worksheet.Cells["F2"].Value = idSolicitud;
                worksheet.Cells["G2"].Value = estadoSolicitud;
                worksheet.Cells.AutoFitColumns();
                FileInfo excelFile = new FileInfo(@"C:\Users\PC\Documents\GitHub\PortalTempora\ProyectoBase\Descargas\" + idCliente + nombre + ".xlsx");
                //FileInfo excelFile = new FileInfo(@"C:\inetpub\wwwroot\Descargas\" + idCliente + nombre + ".xlsx");
                excel.SaveAs(excelFile);

                var excelData = excel.GetAsByteArray();
                var contentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
                var fileName = idCliente + nombre + ".xlsx";
                //ExportExcel();
                return File(excelData, contentType, fileName);
            }



        }





    }
}
