using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
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
        public ActionResult Pagina1()
        {
            return View();
        }
            public ActionResult Index()
        {
            try
            {
                GestorFechasSolicitud();
                GestorSolicitudIncompleta();
                string valorUsuario = Session["IdUsuario"] != null ? Session["IdUsuario"].ToString() : string.Empty;
                using (ModeloTempora conexionDB = new ModeloTempora())
                {
                    if (int.TryParse(valorUsuario, out int idUsuario))
                    {
                        Usuario usuario = conexionDB.Usuario.Find(idUsuario);
                        //Validación de Usuario
                        if (usuario == null)
                            throw new Exception("El usuario no existe");


                        //Indicadores

                        //Solicitudes Totales
                        int numeroSolicitudes = conexionDB.Solicitud.Count();
                        ViewData["totalSolicitudes"] = numeroSolicitudes;

                        //Solicitudes Abiertas
                        int numeroAbierto = conexionDB.Solicitud.Where(w => w.Fk_idEstado != 32).Count();
                        ViewData["totalAbiertas"] = numeroAbierto;

                        // Solicitudes Cerradas
                        int numeroCerrado = conexionDB.Solicitud.Where(w => w.Fk_idEstado == 32).Count();
                        ViewData["totalCerradas"] = numeroCerrado;

                        // Solicitudes Pendientes
                        int numeroPendiente = conexionDB.Solicitud.Where(w => w.Leido == true).Count();
                        ViewData["totalPendientes"] = numeroPendiente;


                        // Filtros


                        List<Tecnica> listaTecnicas = conexionDB.Tecnica.ToList();
                        string opcionesTecnicas = string.Empty;
                        opcionesTecnicas += "<option value='0'>-- Selecciona opción --</option>";
                        foreach (Tecnica item in listaTecnicas)
                        {
                            opcionesTecnicas += "<option  value='" + item.idTecnica + "'>" + item.nombreTecnica + "</option>";
                        }
                        ViewData["opcionesTecnicas"] = opcionesTecnicas;


                        List<EstadoSolicitud> listaEstados = conexionDB.EstadoSolicitud.ToList();
                        string opcionesEstados = string.Empty;
                        opcionesEstados += "<option value='0'>-- Selecciona opción --</option>";
                        foreach (EstadoSolicitud item in listaEstados)
                        {
                            opcionesEstados += "<option  value='" + item.idEstado + "'>" + item.nombreEstado + "</option>";

                        }
                        ViewData["opcionesEstados"] = opcionesEstados;




                        //Lista Solicitudes
                        List<Solicitud> listaSolicitud = conexionDB.Solicitud.ToList();
                        string filaSolicitud = string.Empty;
                        foreach (Solicitud solicitud in listaSolicitud) {
                            if (solicitud.Leido == false)
                            {
                                filaSolicitud += "<tr style='background-color: #fdfdfd; '>";
                            }
                            else {
                                filaSolicitud += "<tr style='background-color: #f3f3f3;  '>";
                            }
                            
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
                            filaSolicitud += "  <td >";
                            string fechau1 = "01/01/0001";

                            if (solicitud.FechaSolicitud != null)
                            {
                                fechau1 = solicitud.FechaSolicitud.ToString();
                                DateTime bDate1 = DateTime.Now;
                                bDate1 = Convert.ToDateTime(fechau1);
                                filaSolicitud += (bDate1).ToString("dd/MM/yyyy");
                            }
                            else {
                                filaSolicitud += fechau1;
                            }

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
                            filaSolicitud += "  <td>";
                            string fechau = "01/01/0001";

                            if (solicitud.UltimoCambio != null)
                            {
                                fechau = solicitud.UltimoCambio.ToString();
                                DateTime bDate = DateTime.Now;
                                bDate = Convert.ToDateTime(fechau);
                                filaSolicitud += (bDate).ToString("dd/MM/yyyy");
                            }
                            else
                            {
                                filaSolicitud += fechau;
                            }
                            //filaSolicitud += solicitud.UltimoCambio;
                            //if (solicitud.SolicitudCompleta == 1 || solicitud.SolicitudCompleta == null) {
                            //    filaSolicitud += "Completa";
                            //}
                            //else {
                            //    filaSolicitud += "Incompleta";
                            //}
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
                        Util.escribirLog("Solicitudes", "GestionSolicitud (GET)", "Encontró el usuario");
                        Solicitud solicitud = conexionDB.Solicitud.Find(id);
                        solicitud.Leido = true;
                        //Datos Solicitud
                        ViewData["NombreCompleto"] = solicitud.Cliente.nombre + " " +solicitud.Cliente.apellido;
                        ViewData["Rut"] = solicitud.Cliente.rut;
                        ViewData["Correo"] = solicitud.Cliente.correo;
                        ViewData["Telefono"] = solicitud.Cliente.telefono;
                        ViewData["Celular"] = solicitud.Cliente.celular;
                        ViewData["FechaNacimiento"] = solicitud.Cliente.fecha_nacimiento;
                        ViewData["RespuestaZona"] = solicitud.RespZona;
                        ViewData["RespuestaDerma"] = solicitud.RespDerm;
                        ViewData["RespuestaPelo"] = solicitud.RespPelo;
                        ViewData["Observacion"] = solicitud.ObserMed;
                        ViewData["FechaCirugia"] = solicitud.FechaCirugiaPaciente;
                        ViewData["FechaLlamada"] = solicitud.FechaLlamada;
                        ViewData["FechaEvaluacionOnceMeses"] = solicitud.FechaEvaluaciónOnceMeses;
                        ViewData["FechaEvaluacionPreciencial"] = solicitud.EvaluacionPresencial;
                        ViewData["ObservacionCuidadoPreoperatorio"] = solicitud.ObserCuidado;
                        ViewData["Guardado"] = solicitud.Guardado;
                        ViewData["Enviado"] = solicitud.Enviado;
                        ViewData["idCliente"] = solicitud.FK_idCliente;
                        if (solicitud.FechaCirugia != null) {
                            ViewData["FechaCirugia"] = solicitud.FechaCirugia;
                        }
                        Util.escribirLog("Solicitudes", "GestionSolicitud (GET)","Seteo todos los ViewData");
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
                        Util.escribirLog("Solicitudes", "GestionSolicitud (GET)", "Leyó todoas las técnias");
                        List<ZonaAReparar> listaZonas = conexionDB.ZonaAReparar.ToList();
                        string opcionesZonas = string.Empty;
                        opcionesZonas += "<option value='0'>-- Selecciona opción --</option>";
                        foreach (ZonaAReparar item in listaZonas) {
                            opcionesZonas += "<option  value='" + item.idZona + "'>" + item.nombreZona + "</option>";
                        }
                        ViewData["opcionesZonas"] = opcionesZonas;

                        Util.escribirLog("Solicitudes", "GestionSolicitud (GET)", "Leyó todoas las zonas a reparar");
                        List<EstadoSolicitud> listaEstados = conexionDB.EstadoSolicitud.ToList();
                        string opcionesEstados = string.Empty;
                        ViewData["EstadoSolicitud"] = "Sin Estado";
                        opcionesEstados += "<option value='0'>-- Selecciona opción --</option>";
                        foreach (EstadoSolicitud item in listaEstados) {
                            if ( item.idEstado == solicitud.Fk_idEstado) {
                                opcionesEstados += "<option selected value='" + item.idEstado + "'>" + item.nombreEstado + "</option>";
                                ViewData["EstadoSolicitud"] = item.nombreEstado;
                            } else {
                                opcionesEstados += "<option  value='" + item.idEstado + "'>" + item.nombreEstado + "</option>";

                            }
                        }
                        ViewData["opcionesEstados"] = opcionesEstados;

                        Util.escribirLog("Solicitudes", "GestionSolicitud (GET)", "Leyó todoas los Estados");
                        List<RangoFoliculos> listaRangos = conexionDB.RangoFoliculos.ToList();
                        string opcionesRangos = string.Empty;
                        
                        foreach (RangoFoliculos item in listaRangos)
                        {
                            if (solicitud.RangoxSolicitud.Count() != 0)
                            {
                                int rango1 = int.Parse(solicitud.RangoxSolicitud.FirstOrDefault().FK_idRango.ToString());
                                if (item.idRango == rango1)
                                {
                                    opcionesRangos += "<option selected value='" + item.idRango + "'>" + item.Rango + "</option>";
                                }
                                else
                                {
                                    opcionesRangos += "<option  value='" + item.idRango + "'>" + item.Rango + "</option>";
                                }

                            }
                            else {
                                opcionesRangos += "<option  value='" + item.idRango + "'>" + item.Rango + "</option>";
                            }
                                

                        }
                        ViewData["opcionesRangos1"] = opcionesRangos;
                        Util.escribirLog("Solicitudes", "GestionSolicitud (GET)", "Leyó todoas los Rangos 1");
                        List<RangoFoliculos> listaRangos2 = conexionDB.RangoFoliculos.ToList();
                        string opcionesRangos2 = string.Empty;

                        foreach (RangoFoliculos item in listaRangos)
                        {
                            if (solicitud.RangoxSolicitud.Count() != 0)
                            {
                                int rango2 = int.Parse(solicitud.RangoxSolicitud.LastOrDefault().FK_idRango.ToString());
                                if (item.idRango == rango2)
                                {
                                    opcionesRangos2 += "<option selected value='" + item.idRango + "'>" + item.Rango + "</option>";
                                }
                                else
                                {
                                    opcionesRangos2 += "<option  value='" + item.idRango + "'>" + item.Rango + "</option>";
                                }

                            }
                            else
                            {
                                opcionesRangos2 += "<option  value='" + item.idRango + "'>" + item.Rango + "</option>";
                            }

                        }
                        ViewData["opcionesRangos2"] = opcionesRangos2;
                        Util.escribirLog("Solicitudes", "GestionSolicitud (GET)", "Leyó todoas los Rangos 2");

                        //Médicos
                        List<Usuario> listamedico = conexionDB.Usuario.ToList();
                        string opcionesMedicos = string.Empty;
                        opcionesMedicos += "<option value='0'>-- Selecciona opción --</option>";
                        foreach (Usuario item in listamedico)
                        {
                            if (item.idUsuario == solicitud.FK_idUsuario)
                            {
                                opcionesMedicos += "<option selected value='" + item.idUsuario + "'>" + item.Nombre + " " + item.Apellido + "</option>";
                            }
                            else
                            {
                                opcionesMedicos += "<option  value='" + item.idUsuario + "'>" + item.Nombre + " " + item.Apellido + "</option>";
                            }

                        }
                        ViewData["opcionesMedicos"] = opcionesMedicos;

                        //Fotos

                        int conteoFotos = conexionDB.Fotos.Count();
                        if (conteoFotos != 0)
                        {
                            List<Fotos> listaFotos = conexionDB.Fotos.ToList();
                            int cont = 0;
  
                            foreach (Fotos item in listaFotos)
                            {
                                
                                
                                if (item.FK_idSolicitud == id)
                                {
                                    if (item.FK_idSolicitud == id && cont == 0)
                                    {
                                        ViewData["Foto1"] = "data: image/" + "jpeg" + "; base64, " + item.baseArchivo + "";

                                    }
                                    if (item.FK_idSolicitud == id && cont == 1)
                                    {
                                        ViewData["Foto2"] = "data: image/" + "jpeg" + "; base64, " + item.baseArchivo + "";
                                        
                                    }
                                    if (item.FK_idSolicitud == id && cont == 2)
                                    {
                                        ViewData["Foto3"] = "data: image/" + "jpeg" + "; base64, " + item.baseArchivo + "";
                                        
                                    }
                                    if (item.FK_idSolicitud == id && cont == 3)
                                    {
                                        ViewData["Foto4"] = "data: image/" + "jpeg" + "; base64, " + item.baseArchivo + "";
                                        
                                    }
                                    if (item.FK_idSolicitud == id && cont == 4)
                                    {
                                        ViewData["Foto5"] = "data: image/" + "jpeg" + "; base64, " + item.baseArchivo + "";
                                        
                                    }
                                    cont++;
                                }
                            }
                            
                            Util.escribirLog("Solicitudes", "GestionSolicitud (GET)", "Leyó todas la Fotos");
                        }
                        else {
                            Util.escribirLog("Solicitudes", "GestionSolicitud (GET)", "Leyó ninguna Foto");
                        }



                        //Fotos 1 Mes Despues
                        if (solicitud.Fk_idEstado >=    20) { 
                        
                       
                        int conteoFotos1Mes = conexionDB.FotosUnMes.Count();
                        if (conteoFotos1Mes != 0)
                        {
                            List<FotosUnMes> listaFotos = conexionDB.FotosUnMes.ToList();
                            int cont = 0;
                            string opcionfoto1 = string.Empty;
                            opcionfoto1 += "<option value='0'>-- Selecciona opción --</option>";
                            foreach (FotosUnMes item in listaFotos)
                            {
                                if (item.FK_idSolicitud == id)
                                {
                                    if (item.FK_idSolicitud == id && cont == 0)
                                    {
                                        ViewData["Foto1Mes1"] = "data: image/" + "jpeg" + "; base64, " + item.baseArchivo + "";
                                        opcionfoto1 += "<option id='data: image/" + "jpeg" + "; base64, " + item.baseArchivo + "' value='" + item.idFotosUn + "'>" + item.nombreFalso + "</option>";
                                    }
                                    if (item.FK_idSolicitud == id && cont == 1)
                                    {
                                        ViewData["Foto2Mes1"] = "data: image/" + "jpeg" + "; base64, " + item.baseArchivo + "";
                                        opcionfoto1 += "<option id='data: image/" + "jpeg" + "; base64, " + item.baseArchivo + "' value='" + item.idFotosUn + "'>" + item.nombreFalso + "</option>";
                                    }
                                    if (item.FK_idSolicitud == id && cont == 2)
                                    {
                                        ViewData["Foto3Mes1"] = "data: image/" + "jpeg" + "; base64, " + item.baseArchivo + "";
                                        opcionfoto1 += "<option id='data: image/" + "jpeg" + "; base64, " + item.baseArchivo + "' value='" + item.idFotosUn + "'>" + item.nombreFalso + "</option>";
                                    }
                                    if (item.FK_idSolicitud == id && cont == 3)
                                    {
                                        ViewData["Foto4Mes1"] = "data: image/" + "jpeg" + "; base64, " + item.baseArchivo + "";
                                        opcionfoto1 += "<option id='data: image/" + "jpeg" + "; base64, " + item.baseArchivo + "' value='" + item.idFotosUn + "'>" + item.nombreFalso + "</option>";
                                    }
                                    if (item.FK_idSolicitud == id && cont == 4)
                                    {
                                        ViewData["Foto5Mes1"] = "data: image/" + "jpeg" + "; base64, " + item.baseArchivo + "";
                                        opcionfoto1 += "<option id='data: image/" + "jpeg" + "; base64, " + item.baseArchivo + "' value='" + item.idFotosUn + "'>" + item.nombreFalso + "</option>";
                                    }
                                    cont++;
                                }
                            }
                            ViewData["opcionfoto1"] = opcionfoto1;
                            Util.escribirLog("Solicitudes", "GestionSolicitud (GET)", "Leyó todas la Fotos");
                        }
                        else
                        {
                            Util.escribirLog("Solicitudes", "GestionSolicitud (GET)", "Leyó ninguna Foto");
                        }

                            //Fotos 3 Meses Despues
                            if (solicitud.Fk_idEstado >= 22) {
                                int conteoFotos2Mes = conexionDB.FotosUnMes.Count();
                                if (conteoFotos2Mes != 0)
                                {
                                    List<FotosTresMeses> listaFotos = conexionDB.FotosTresMeses.ToList();
                                    int cont = 0;
                                    string opcionfoto3 = string.Empty;
                                    opcionfoto3 += "<option value='0'>-- Selecciona opción --</option>";
                                    foreach (FotosTresMeses item in listaFotos)
                                    {
                                        if (item.FK_idSolicitud == id)
                                        {
                                            if (item.FK_idSolicitud == id && cont == 0)
                                            {
                                                ViewData["Foto1Mes3"] = "data: image/" + "jpeg" + "; base64, " + item.baseArchivo + "";
                                                opcionfoto3 += "<option id='data: image/" + "jpeg" + "; base64, " + item.baseArchivo + "' value='" + item.idFotosTres + "'>" + item.nombreFalso + "</option>";
                                            }
                                            if (item.FK_idSolicitud == id && cont == 1)
                                            {
                                                ViewData["Foto2Mes3"] = "data: image/" + "jpeg" + "; base64, " + item.baseArchivo + "";
                                                opcionfoto3 += "<option id='data: image/" + "jpeg" + "; base64, " + item.baseArchivo + "' value='" + item.idFotosTres + "'>" + item.nombreFalso + "</option>";
                                            }
                                            if (item.FK_idSolicitud == id && cont == 2)
                                            {
                                                ViewData["Foto3Mes3"] = "data: image/" + "jpeg" + "; base64, " + item.baseArchivo + "";
                                                opcionfoto3 += "<option id='data: image/" + "jpeg" + "; base64, " + item.baseArchivo + "' value='" + item.idFotosTres + "'>" + item.nombreFalso + "</option>";
                                            }
                                            if (item.FK_idSolicitud == id && cont == 3)
                                            {
                                                ViewData["Foto4Mes3"] = "data: image/" + "jpeg" + "; base64, " + item.baseArchivo + "";
                                                opcionfoto3 += "<option id='data: image/" + "jpeg" + "; base64, " + item.baseArchivo + "' value='" + item.idFotosTres + "'>" + item.nombreFalso + "</option>";
                                            }
                                            if (item.FK_idSolicitud == id && cont == 4)
                                            {
                                                ViewData["Foto5Mes3"] = "data: image/" + "jpeg" + "; base64, " + item.baseArchivo + "";
                                                opcionfoto3 += "<option id='data: image/" + "jpeg" + "; base64, " + item.baseArchivo + "' value='" + item.idFotosTres + "'>" + item.nombreFalso + "</option>";
                                            }
                                            cont++;
                                        }
                                    }
                                    ViewData["opcionfoto3"] = opcionfoto3;
                                    Util.escribirLog("Solicitudes", "GestionSolicitud (GET)", "Leyó todas la Fotos");
                                }
                                else
                                {
                                    Util.escribirLog("Solicitudes", "GestionSolicitud (GET)", "Leyó ninguna Foto");
                                }
                            }


                            //Fotos 6 Meses Despues
                            if (solicitud.Fk_idEstado >= 24)
                            {
                                int conteoFotos6Mes = conexionDB.FotosUnMes.Count();
                                string opcionfoto6 = string.Empty;
                                opcionfoto6 += "<option value='0'>-- Selecciona opción --</option>";
                                if (conteoFotos6Mes != 0)
                                {
                                    List<FotosSeisMeses> listaFotos = conexionDB.FotosSeisMeses.ToList();
                                    int cont = 0;
                                    foreach (FotosSeisMeses item in listaFotos)
                                    {
                                        if (item.FK_idSolicitud == id)
                                        {
                                            if (item.FK_idSolicitud == id && cont == 0)
                                            {
                                                ViewData["Foto1Mes6"] = "data: image/" + "jpeg" + "; base64, " + item.baseArchivo + "";
                                                opcionfoto6 += "<option id='data: image/" + "jpeg" + "; base64, " + item.baseArchivo + "' value='" + item.idFotosSeis + "'>" + item.nombreFalso + "</option>";
                                            }
                                            if (item.FK_idSolicitud == id && cont == 1)
                                            {
                                                ViewData["Foto2Mes6"] = "data: image/" + "jpeg" + "; base64, " + item.baseArchivo + "";
                                                opcionfoto6 += "<option id='data: image/" + "jpeg" + "; base64, " + item.baseArchivo + "' value='" + item.idFotosSeis + "'>" + item.nombreFalso + "</option>";
                                            }
                                            if (item.FK_idSolicitud == id && cont == 2)
                                            {
                                                ViewData["Foto3Mes6"] = "data: image/" + "jpeg" + "; base64, " + item.baseArchivo + "";
                                                opcionfoto6 += "<option id='data: image/" + "jpeg" + "; base64, " + item.baseArchivo + "' value='" + item.idFotosSeis + "'>" + item.nombreFalso + "</option>";
                                            }
                                            if (item.FK_idSolicitud == id && cont == 3)
                                            {
                                                ViewData["Foto4Mes6"] = "data: image/" + "jpeg" + "; base64, " + item.baseArchivo + "";
                                                opcionfoto6 += "<option id='data: image/" + "jpeg" + "; base64, " + item.baseArchivo + "' value='" + item.idFotosSeis + "'>" + item.nombreFalso + "</option>";
                                            }
                                            if (item.FK_idSolicitud == id && cont == 4)
                                            {
                                                ViewData["Foto5Mes6"] = "data: image/" + "jpeg" + "; base64, " + item.baseArchivo + "";
                                                opcionfoto6 += "<option id='data: image/" + "jpeg" + "; base64, " + item.baseArchivo + "' value='" + item.idFotosSeis + "'>" + item.nombreFalso + "</option>";
                                            }
                                            cont++;
                                        }
                                    }
                                    ViewData["opcionfoto6"] = opcionfoto6;
                                    Util.escribirLog("Solicitudes", "GestionSolicitud (GET)", "Leyó todas la Fotos");
                                }
                                else
                                {
                                    Util.escribirLog("Solicitudes", "GestionSolicitud (GET)", "Leyó ninguna Foto");
                                }
                            }

                    }
                        Util.escribirLog("Solicitudes", "GestionSolicitud (GET)", "Va todo bien");
                        ViewData["FechaSolicitud"] = solicitud.FechaSolicitud;
                    ViewData["idSolicitud"] = id;
                    conexionDB.SaveChanges();
                    return View();


                    }
                }
            }
            catch (Exception ex)
            {
                Util.escribirLog("Solicitudes", "GestionSolicitud (GET)", ex.InnerException.Message + " + "  + ex.Message);
                return RedirectToAction("Index", "Solicitudes");
            }
            return View();
        }

        [HttpPost, ValidateInput(false)]
        public ActionResult GestionSolicitudes(/*IEnumerable<HttpPostedFileBase> files,*/ FormCollection collection) {

            int idSolicitud = int.Parse(collection["idSolicitud"].ToString());

            string FechaNacimiento = collection["Nacimiento"];
            string Estado = collection["txtEstado"];
            string Tecnica = collection["txtTecnica"];
            string Zona = collection["txtZona"];
            string Obsrevación = collection["txtObservacion"];
            int Rango1 = int.Parse(collection["txtFoliculo1"]);
            int Rango2 = int.Parse(collection["txtFoliculo2"]);
            string enviar = collection["enviar"];
            string fechaEvaluacion = collection["txtFechaEvaluacion"];
            int idCliente;
            

            try
            {
                string valorUsuario = Session["IdUsuario"] != null ? Session["IdUsuario"].ToString() : string.Empty;
                using (ModeloTempora conexionDB = new ModeloTempora())
                {
                    if (int.TryParse(valorUsuario, out int idUsuario))
                    {

                        //Util.EnviarWhatsapp();

                        Usuario usuario = conexionDB.Usuario.Find(idUsuario);
                        //Validación de Usuario
                        if (usuario == null)
                            throw new Exception("El usuario no existe");

                        //Buscar Rangos                      
                        Solicitud solicitud = conexionDB.Solicitud.Find(idSolicitud);
                        int idEstado = int.Parse(Estado);
                        solicitud.Fk_idEstado = idEstado;
                        solicitud.UltimoCambio = DateTime.Now;
                        idCliente = int.Parse(solicitud.FK_idCliente.ToString());
                        if (enviar == "1")
                        {  
                            // Fue Enviado
                            solicitud.Enviado = "True";
                        }
                        else {
                            //Fue guardado
                            solicitud.Guardado = "True";
                        }

                        if (Estado == "6")
                        {
                            
                            solicitud.FK_Tecnica = int.Parse(Tecnica);
                            if (solicitud.RangoxSolicitud.Count() == 0)
                            {
                                RangoxSolicitud rango1 = new RangoxSolicitud();
                                rango1.FK_idRango = Rango1;
                                rango1.FK_idSolicitud = idSolicitud;
                                conexionDB.RangoxSolicitud.Add(rango1);

                                RangoxSolicitud rango2 = new RangoxSolicitud();
                                rango2.FK_idRango = Rango2;
                                rango2.FK_idSolicitud = idSolicitud;
                                conexionDB.RangoxSolicitud.Add(rango2);
                            }
                            else
                            {
                                solicitud.RangoxSolicitud.FirstOrDefault().FK_idRango = Rango1;
                                solicitud.RangoxSolicitud.LastOrDefault().FK_idRango = Rango2;
                            }
                            solicitud.ObserMed = Obsrevación;
                        }
                        

                        // Guardar Estado en PipeDrive

                        string dealId = solicitud.idPipedrive;
                        string publicDescription = conexionDB.EstadoSolicitud.Where(w => w.idEstado == idEstado).Select(s=> s.Descripcion).FirstOrDefault().ToString();
                        string personId = solicitud.Cliente.idPipedrive;
                        string nombreEstado = conexionDB.EstadoSolicitud.Where(w => w.idEstado == idEstado).Select(s => s.nombreEstado).FirstOrDefault().ToString(); ;
                        var respuestaApiEstado = PipeDriveAPI.PostActivities(dealId, personId, "11504009", nombreEstado, publicDescription, "task");

                        //Solicitar Formulario Incompleto
                        if (Estado == "2")
                        {
                            if (enviar == "1")
                            {
                                //Armar link
                                Cliente cliente = conexionDB.Cliente.Find(idCliente);
                                string correo = cliente.correo;
                                //Enviar Correo
                                string nombre = solicitud.Cliente.nombre + " " + solicitud.Cliente.apellido;       
                                //Armar link
                                string link = solicitud.Cliente.idCliente + ";" + DateTime.Now.ToString("dd/MM/yyyy");
                                link = Util.Base64Encode(link);
                                //Enviar Correo
                                string titulo = "Complete su solicitud - Tempora";
                                string textoCorreo = System.IO.File.ReadAllText(HttpContext.Server.MapPath("~/Styles/MensajeSolicitudIncompleta.html")).Replace("[Link]", link).Replace("[Nombre]", nombre);
                                Util.EnviarMail(textoCorreo, correo, titulo);
                                solicitud.CorreoSolicitudIncompleta = true;
                                solicitud.UltimoCambio = DateTime.Now;
                            }
                        }

                        // Enviar Primera revisión 
                        if (Estado == "6") {
                            //Guardar Rangos
                            if (enviar == "1") {
                                //Armar link
                                string link = solicitud.Cliente.idCliente+";"+DateTime.Now.ToString("dd/MM/yyyy");
                                link = Util.Base64Encode(link);
                                string pass = solicitud.Cliente.idCliente + ";" + solicitud.Cliente.rut;
                                var password = Util.Base64Encode(pass);
                                Cliente cliente = conexionDB.Cliente.Find(idCliente);
                                string correo = cliente.correo;
                                //string Pass = Util.GetSHA1(password);
                                cliente.password = password;
                                conexionDB.SaveChanges();
                                //Enviar Correo
                                string titulo = "He aquí tu evaluación - Portal Tempora";
                                string nombre = solicitud.Cliente.nombre + " " + solicitud.Cliente.apellido;
                                string textoCorreo = System.IO.File.ReadAllText(HttpContext.Server.MapPath("~/Styles/MensajeSolicitudPaso1.html")).Replace("[Nombre]", nombre).Replace("[Link]",link).Replace("[Password]", password);
                                Util.EnviarMail(textoCorreo, correo, titulo);
                                solicitud.UltimoCambio = DateTime.Now;

                                if (Convert.ToBoolean(solicitud.UsaWsp) == Convert.ToBoolean(1)) { 
                                    
                                }
                            }
                        }
                        // Enviar evaluación presencial 
                        if (Estado == "4")
                        {
                            DateTime oDate = DateTime.ParseExact(fechaEvaluacion, "dd/MM/yyyy", null);
                            //DateTime oDate = Convert.ToDateTime(fechaEvaluacion);
                            solicitud.FechaEvaluacionPresencial = oDate;
                            //Guardar Rangos
                            if (enviar == "1")
                            {

                                //Armar link
                                string link = solicitud.Cliente.idCliente + ";" + DateTime.Now.ToString("dd/MM/yyyy");
                                link = Util.Base64Encode(link);


                                //Enviar Correo
                                Cliente cliente = conexionDB.Cliente.Find(idCliente);
                                string correo = cliente.correo;
                                string titulo = "Evaluación Presencial - Tempora";
                                string nombre = solicitud.Cliente.nombre + " " + solicitud.Cliente.apellido;
                                string textoCorreo = System.IO.File.ReadAllText(HttpContext.Server.MapPath("~/Styles/MensajeSolicitudEvaluacionPresencial.html")).Replace("[Nombre]", nombre).Replace("[Fecha]", fechaEvaluacion);
                                Util.EnviarMail(textoCorreo, correo, titulo);
                                solicitud.UltimoCambio = DateTime.Now;
                            }
                        }
                        //Solicitar fotografías nuevamente
                        if (Estado == "5") {
                            if (enviar == "1")
                            {
                                //Armar link
                                string link = solicitud.Cliente.idCliente + ";" + DateTime.Now.ToString("dd/MM/yyyy");
                                link = Util.Base64Encode(link);
                                Cliente cliente = conexionDB.Cliente.Find(idCliente);
                                string correo = cliente.correo;
                                //Enviar Correo
                                string titulo = "Hubo un problema con tus fotografías - Portal Tempora";
                                string nombre = solicitud.Cliente.nombre + " " + solicitud.Cliente.apellido;
                                string textoCorreo = System.IO.File.ReadAllText(HttpContext.Server.MapPath("~/Styles/MensajeSolicitudFotos.html")).Replace("[Nombre]", nombre).Replace("[Link]", link);
                                Util.EnviarMail(textoCorreo, correo, titulo);
                                solicitud.UltimoCambio = DateTime.Now;
                            }
                        }
                        //Agendar Cirugía
                        //if (Estado == "7")
                        //{
                        //    string fechaCirugia = collection["txtFechaPresencial"];
                        //    DateTime oDate = Convert.ToDateTime(fechaCirugia);
                        //    solicitud.FechaCirugia = oDate;
                        //    //Armar link
                        //    string link = solicitud.Cliente.idCliente + ";" + DateTime.Now.ToString("dd/MM/yyyy");
                        //    link = Util.Base64Encode(link);

                        //    //Enviar Correo
                        //    string titulo = "Hubo un problema cons tus fotografías - Portal Tempora";
                        //    string nombre = solicitud.Cliente.nombre + " " + solicitud.Cliente.apellido;
                        //    string textoCorreo = System.IO.File.ReadAllText(HttpContext.Server.MapPath("~/Styles/MensajeSolicitudFotos.html")).Replace("[Nombre]", nombre).Replace("[Link]", link);
                        //    Util.EnviarMail(textoCorreo, "isaac.aburto@backspace.cl", titulo);
                        //    solicitud.UltimoCambio = DateTime.Now;

                        //}
                        //Enviar segundo micrositio
                        if (Estado == "11")
                        {
                            string txtFechaPresencial = collection["txtFechaPresencial"];
                            DateTime oDate = DateTime.ParseExact(txtFechaPresencial, "dd/MM/yyyy", null);
                            //DateTime oDate = Convert.ToDateTime(txtFechaPresencial);
                            solicitud.EvaluacionPresencial = oDate;
                            
                            int idMedico = int.Parse(collection["txtMedico"]);
                            Usuario medico = conexionDB.Usuario.Find(idMedico);
                            solicitud.FK_idUsuario = idMedico;
                            string nombreMedico = medico.Nombre + " " + medico.Apellido;

                            if (enviar == "1")
                            {
                                string link = solicitud.Cliente.idCliente + ";" + DateTime.Now.ToString("dd/MM/yyyy");
                                link = Util.Base64Encode(link);
                                //Enviar Correo
                                string titulo = "Su médico esta aquí - Tempora";
                                string nombre = solicitud.Cliente.nombre + " " + solicitud.Cliente.apellido;
                                Cliente cliente = conexionDB.Cliente.Find(idCliente);
                                string correo = cliente.correo;
                                string password = cliente.password;
                                string textoCorreo = System.IO.File.ReadAllText(HttpContext.Server.MapPath("~/Styles/MensajeSolicitudSegundoMicrositio.html")).Replace("[nombreMedico]", nombreMedico).Replace("[Nombre]", nombre).Replace("[Password]", password).Replace("[FechaPresencial]", txtFechaPresencial).Replace("[Link]", password);
                                Util.EnviarMail(textoCorreo, correo, titulo);

                            }
                        }
                        if (Estado == "13")
                        {
                            string Observacion = collection["txtObservacion2"];
                            if (enviar == "1")
                            {
                                //Enviar Correo
                                Cliente cliente = conexionDB.Cliente.Find(idCliente);
                                string correo = cliente.correo;
                                string titulo = "Procedimiento Previo - Tempora";
                                string nombre = solicitud.Cliente.nombre + " " + solicitud.Cliente.apellido;
                                string textoCorreo = System.IO.File.ReadAllText(HttpContext.Server.MapPath("~/Styles/MensajeSolicitudProcedimientoPrevio.html")).Replace("[Observacion]", Observacion).Replace("[Nombre]", nombre);
                                Util.EnviarMail(textoCorreo, correo, titulo);
                                solicitud.UltimoCambio = DateTime.Now;
                            }
                        }
                        //Agengar fecha cirugía
                        if (Estado == "14")
                        {
                            string FechaCirugiaMandar = collection["txtFechaCirugiaMandar"];
                            DateTime oDate = DateTime.ParseExact(FechaCirugiaMandar, "dd/MM/yyyy", null);
                            //DateTime oDate = Convert.ToDateTime(FechaCirugiaMandar);
                            solicitud.FechaCirugia = oDate;
                            if (enviar == "1")
                            {
                                Cliente cliente = conexionDB.Cliente.Find(idCliente);
                                string correo = cliente.correo;
                                //Enviar Correo
                                string titulo = "Fecha de Cirugía - Tempora";
                                string nombre = solicitud.Cliente.nombre + " " + solicitud.Cliente.apellido;
                                string textoCorreo = System.IO.File.ReadAllText(HttpContext.Server.MapPath("~/Styles/MensajeSolicitudFechaCirugia.html")).Replace("[FechaCirugiaMandar]", FechaCirugiaMandar).Replace("[Nombre]", nombre);
                                Util.EnviarMail(textoCorreo, correo, titulo);

                            }
                        }
                        //Enviar tercer micrositio - Cuidados Preoperatorios
                        if (Estado == "15")
                        {
                            string Observacion3 = collection["txtObservacion3"];
                            solicitud.ObserCuidado = Observacion3;
                            if (enviar == "1")
                            {
                                Cliente cliente = conexionDB.Cliente.Find(idCliente);
                                string correo = cliente.correo;
                                string password = solicitud.Cliente.password;
                                //Armar link
                                string link = solicitud.Cliente.idCliente + ";" + DateTime.Now.ToString("dd/MM/yyyy");
                                link = Util.Base64Encode(link);
                                //Enviar Correo
                                string titulo = "Cuidados Preoperatorios - Tempora";
                                string nombre = solicitud.Cliente.nombre + " " + solicitud.Cliente.apellido;
                                string textoCorreo = System.IO.File.ReadAllText(HttpContext.Server.MapPath("~/Styles/MensajeSolicitudCuidadosPreoperatorios.html")).Replace("[Nombre]", nombre).Replace("[Observacion]", Observacion3).Replace("[link]", link).Replace("[Password]", password);
                                Util.EnviarMail(textoCorreo, correo, titulo);
                            }
                        }
                        //Enviar nueva fecha de cirugia
                        if (Estado == "17")
                        {
                            string FechaNuevaCirugia = collection["txtFechaReagendarCirugia"];
                            DateTime oDate = Convert.ToDateTime(FechaNuevaCirugia);
                            solicitud.FechaCirugia = oDate;
                            if (enviar == "1")
                            {
                                Cliente cliente = conexionDB.Cliente.Find(idCliente);
                                string correo = cliente.correo;
                                //Enviar Correo
                                string titulo = "Nueva fecha cirugía - Tempora";
                                string nombre = solicitud.Cliente.nombre + " " + solicitud.Cliente.apellido;
                                string textoCorreo = System.IO.File.ReadAllText(HttpContext.Server.MapPath("~/Styles/MensajeSolicitudFechaNuevaCirugia.html")).Replace("[FechaCirugiaMandar]", FechaNuevaCirugia).Replace("[Nombre]", nombre);
                                Util.EnviarMail(textoCorreo, correo, titulo);
                                solicitud.DiaCirugiaEnviado = false;
                            }
                        }
                        //Enviar Quinto micrositio - Cuidados postoperatorios
                        if (Estado == "18")
                        {
                            //Armar link
                            string link = solicitud.Cliente.idCliente + ";" + DateTime.Now.ToString("dd/MM/yyyy");
                            link = Util.Base64Encode(link);
                            solicitud.Fk_idEstado = 18;
                            if (enviar == "1")
                            {
                                Cliente cliente = conexionDB.Cliente.Find(idCliente);
                                string correo = cliente.correo;
                                solicitud.Fk_idEstado = 19;
                                //Enviar Correo
                                string Pass = solicitud.Cliente.password;
                                string titulo = "Cuidados postoperatorios - Tempora";
                                string nombre = solicitud.Cliente.nombre + " " + solicitud.Cliente.apellido;
                                string textoCorreo = System.IO.File.ReadAllText(HttpContext.Server.MapPath("~/Styles/MensajeSolicitudQuintoMicrositio.html")).Replace("[Link]", link).Replace("[Nombre]", nombre).Replace("[Password]", Pass);
                                Util.EnviarMail(textoCorreo, correo, titulo);
                            }
                        }
                        //Enviar Formulario 1 mes despues
                        if (Estado == "20")
                        {
                            if (enviar == "1")
                            {
                                Cliente cliente = conexionDB.Cliente.Find(idCliente);
                                string correo = cliente.correo;
                                //Armar link
                                string link = solicitud.Cliente.idCliente + ";" + DateTime.Now.ToString("dd/MM/yyyy");
                                link = Util.Base64Encode(link);
                                //Enviar Correo
                                string titulo = "Fotografías un mes después - Tempora";
                                string nombre = solicitud.Cliente.nombre + " " + solicitud.Cliente.apellido;
                                string textoCorreo = System.IO.File.ReadAllText(HttpContext.Server.MapPath("~/Styles/MensajeSolicitudFotoUnMes.html")).Replace("[Link]", link).Replace("[Nombre]", nombre);
                                Util.EnviarMail(textoCorreo, correo, titulo);
                            }
                        }
                        if (Estado == "21")
                        {
                            if (enviar == "1")
                            {
                                Cliente cliente = conexionDB.Cliente.Find(idCliente);
                                string correo = cliente.correo;
                                //Armar link
                                string link = solicitud.Cliente.idCliente + ";" + DateTime.Now.ToString("dd/MM/yyyy");
                                link = Util.Base64Encode(link);
                                //Enviar Correo
                                string titulo = "Vas por buen camino - Tempora";
                                string nombre = solicitud.Cliente.nombre + " " + solicitud.Cliente.apellido;
                                string textoCorreo = System.IO.File.ReadAllText(HttpContext.Server.MapPath("~/Styles/MensajeSolicitudBuenCamino.html")).Replace("[Nombre]", nombre);
                                Util.EnviarMail(textoCorreo, correo, titulo);
                            }
                        }
                        //Enviar Formulario 3 meses despues
                        if (Estado == "22")
                        {
                            if (enviar == "1")
                            {
                                Cliente cliente = conexionDB.Cliente.Find(idCliente);
                                string correo = cliente.correo;
                                //Armar link
                                string link = solicitud.Cliente.idCliente + ";" + DateTime.Now.ToString("dd/MM/yyyy");
                                link = Util.Base64Encode(link);
                                //Enviar Correo
                                string titulo = "Fotografías tres meses después - Tempora";
                                string nombre = solicitud.Cliente.nombre + " " + solicitud.Cliente.apellido;
                                string textoCorreo = System.IO.File.ReadAllText(HttpContext.Server.MapPath("~/Styles/MensajeSolicitudFotoTresMeses.html")).Replace("[Link]", link).Replace("[Nombre]", nombre);
                                Util.EnviarMail(textoCorreo, correo, titulo);
                            }
                        }
                        if (Estado == "23")
                        {
                            if (enviar == "1")
                            {
                                Cliente cliente = conexionDB.Cliente.Find(idCliente);
                                string correo = cliente.correo;
                                //Armar link
                                string link = solicitud.Cliente.idCliente + ";" + DateTime.Now.ToString("dd/MM/yyyy");
                                link = Util.Base64Encode(link);
                                //Enviar Correo
                                string titulo = "Vas por buen camino - Tempora";
                                string nombre = solicitud.Cliente.nombre + " " + solicitud.Cliente.apellido;
                                string textoCorreo = System.IO.File.ReadAllText(HttpContext.Server.MapPath("~/Styles/MensajeSolicitudBuenCamino.html")).Replace("[Nombre]", nombre);
                                Util.EnviarMail(textoCorreo, correo, titulo);
                            }
                        }
                        //Enviar Formulario 3 meses despues
                        if (Estado == "24")
                        {
                            if (enviar == "1")
                            {
                                Cliente cliente = conexionDB.Cliente.Find(idCliente);
                                string correo = cliente.correo;
                                //Armar link
                                string link = solicitud.Cliente.idCliente + ";" + DateTime.Now.ToString("dd/MM/yyyy");
                                link = Util.Base64Encode(link);
                                //Enviar Correo
                                string titulo = "Fotografías seis meses después - Tempora";
                                string nombre = solicitud.Cliente.nombre + " " + solicitud.Cliente.apellido;
                                string textoCorreo = System.IO.File.ReadAllText(HttpContext.Server.MapPath("~/Styles/MensajeSolicitudFotoSeisMeses.html")).Replace("[Link]", link).Replace("[Nombre]", nombre);
                                Util.EnviarMail(textoCorreo, correo, titulo);
                            }
                        }
                        if (Estado == "25")
                        {
                            if (enviar == "1")
                            {
                                Cliente cliente = conexionDB.Cliente.Find(idCliente);
                                string correo = cliente.correo;
                                //Armar link
                                string link = solicitud.Cliente.idCliente + ";" + DateTime.Now.ToString("dd/MM/yyyy");
                                link = Util.Base64Encode(link);
                                //Enviar Correo
                                string titulo = "Vas por buen camino - Tempora";
                                string nombre = solicitud.Cliente.nombre + " " + solicitud.Cliente.apellido;
                                string textoCorreo = System.IO.File.ReadAllText(HttpContext.Server.MapPath("~/Styles/MensajeSolicitudBuenCamino.html")).Replace("[Nombre]", nombre);
                                Util.EnviarMail(textoCorreo, correo, titulo);
                            }
                        }
                        //Enviar mensaje de evaluación
                        if (Estado == "27")
                        {
                            Cliente cliente = conexionDB.Cliente.Find(idCliente);
                            string correo = cliente.correo;
                            string FechaEvaluacion2 = collection["txtFechaEvaluacion2"];
                            DateTime oDate = Convert.ToDateTime(FechaEvaluacion2);
                            solicitud.FechaEvaluaciónOnceMeses = oDate;
                            if (enviar == "1")
                            {
                                //Enviar Correo
                                string titulo = "Nueva Evaluación Presencial - Tempora";
                                string nombre = solicitud.Cliente.nombre + " " + solicitud.Cliente.apellido;
                                string textoCorreo = System.IO.File.ReadAllText(HttpContext.Server.MapPath("~/Styles/MensajeSolicitudEvaluacionOnceMeses.html")).Replace("[Fecha]", FechaEvaluacion2).Replace("[Nombre]", nombre);
                                Util.EnviarMail(textoCorreo, correo, titulo);
                                solicitud.Fk_idEstado = 28;
                            }
                        }
                        //Paciente necesita algun cuidado
                        if (Estado == "29")
                        {
                            string Observacion4 = collection["txtObservacion4"];
                            if (enviar == "1")
                            {
                                Cliente cliente = conexionDB.Cliente.Find(idCliente);
                                string correo = cliente.correo;
                                //Enviar Correo
                                string titulo = "Tratamiento especial para usted - Tempora";
                                string nombre = solicitud.Cliente.nombre + " " + solicitud.Cliente.apellido;
                                string textoCorreo = System.IO.File.ReadAllText(HttpContext.Server.MapPath("~/Styles/MensajeSolicitudTratamientoEspecial.html")).Replace("[Observacion]", Observacion4).Replace("[Nombre]", nombre);
                                Util.EnviarMail(textoCorreo, correo, titulo);
                                solicitud.ObserCuidado = Observacion4;
                            }
                        }
                        //Cirugía de garantía
                        if (Estado == "30")
                        {
                            string FechaCirugiaGarantia = collection["txtFechaCirugiaGarantia"];
                            DateTime oDate = Convert.ToDateTime(FechaCirugiaGarantia);
                            
                            if (enviar == "1")
                            {
                                Cliente cliente = conexionDB.Cliente.Find(idCliente);
                                string correo = cliente.correo;
                                //Enviar Correo
                                string titulo = "Fecha cirugía de garantía - Tempora";
                                string nombre = solicitud.Cliente.nombre + " " + solicitud.Cliente.apellido;
                                string textoCorreo = System.IO.File.ReadAllText(HttpContext.Server.MapPath("~/Styles/MensajeSolicitudFechaCirugiaGarantia.html")).Replace("[Fecha]", FechaCirugiaGarantia).Replace("[Nombre]", nombre);
                                Util.EnviarMail(textoCorreo, correo, titulo);
                                solicitud.FechaCirugiaGarantia = oDate;
                            }
                        }
                        //Paciente es dado de alta
                        if (Estado == "31")
                        {
                            if (enviar == "1")
                            {
                                Cliente cliente = conexionDB.Cliente.Find(idCliente);
                                string correo = cliente.correo;
                                //Armar link
                                string link = solicitud.Cliente.idCliente + ";" + DateTime.Now.ToString("dd/MM/yyyy");
                                link = Util.Base64Encode(link);
                                string Pass = solicitud.Cliente.password;
                                //Enviar Correo
                                string titulo = "Ya eres parte de Tempora - Tempora";
                                string nombre = solicitud.Cliente.nombre + " " + solicitud.Cliente.apellido;
                                string textoCorreo = System.IO.File.ReadAllText(HttpContext.Server.MapPath("~/Styles/MensajeSolicitudUltimo.html")).Replace("[Link]", link).Replace("[Nombre]", nombre).Replace("[Password]", Pass);
                                Util.EnviarMail(textoCorreo, correo, titulo);
                                solicitud.Fk_idEstado = 32;
                            }
                        }

                        // Micrositio avance en fotos
                        if (Estado == "33")
                        {
                            if (enviar == "1")
                            {
                                int foto1mes = int.Parse(collection["foto1mes"]);
                                int foto3mes = int.Parse(collection["foto3mes"]);
                                int foto6mes = int.Parse(collection["foto6mes"]);

                                FotosUnMes foto1 = conexionDB.FotosUnMes.Find(foto1mes);
                                FotosTresMeses foto3 = conexionDB.FotosTresMeses.Find(foto3mes);
                                FotosSeisMeses foto6 = conexionDB.FotosSeisMeses.Find(foto6mes);

                                foto1.seleccionado = true;
                                foto3.seleccionado = true;
                                foto6.seleccionado = true; 

                                //Armar link
                                string link = solicitud.Cliente.idCliente + ";" + DateTime.Now.ToString("dd/MM/yyyy");
                                link = Util.Base64Encode(link);
                                //Enviar Correo
                                Cliente cliente = conexionDB.Cliente.Find(idCliente);
                                string correo = cliente.correo;
                                string titulo = "Aquí está tu avance - Tempora";
                                string nombre = solicitud.Cliente.nombre + " " + solicitud.Cliente.apellido;
                                string Pass = solicitud.Cliente.password;
                                string textoCorreo = System.IO.File.ReadAllText(HttpContext.Server.MapPath("~/Styles/MensajeSolicitudSextoMicrositio.html")).Replace("[Link]", link).Replace("[Nombre]", nombre).Replace("[Password]", Pass);
                                Util.EnviarMail(textoCorreo, correo, titulo);
                                solicitud.Fk_idEstado = 33;
                            }
                        }
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
        public string GestionSolicitudEditar(string Nombre, string Rut, string FechaNacimiento, string Celular, string Correo, string Zona, string Derma, string Pelo, string FechaCirugia, string FechaLlamada, string idSolicitud, string IdCliente)
        {
            int idsolicitud = int.Parse(idSolicitud);
            int idcliente = int.Parse(IdCliente);
            try
            {
                using (ModeloTempora conexionDB = new ModeloTempora())
                {
                    Solicitud solicitud = conexionDB.Solicitud.Find(idsolicitud);
                    solicitud.RespDerm = Derma;
                    solicitud.RespPelo = Pelo;
                    if (FechaCirugia != "" && FechaCirugia != null) {
                        solicitud.FechaCirugiaPaciente = Convert.ToDateTime(FechaCirugia);
                    }
                    if (FechaLlamada != "" && FechaLlamada != null)
                    {
                        solicitud.FechaLlamada = Convert.ToDateTime(FechaLlamada);

                    }

                    conexionDB.SaveChanges();

                    Cliente cliente = conexionDB.Cliente.Find(idcliente);
                    cliente.nombre = Nombre;
                    cliente.rut = Rut;
                    cliente.celular = Celular;
                    if (FechaNacimiento != "" && FechaNacimiento != null)
                    {
                        cliente.fecha_nacimiento = Convert.ToDateTime(FechaNacimiento);

                    }
                    cliente.correo = Correo;
                    conexionDB.SaveChanges();
                    return "Correcto";
                }
            }
            catch (Exception ex)
            {
                Util.escribirLog("Solicitud", "GestionSolicitudEditar (POST)", ex.Message);
                return "Error de guardado";
            }

            
        }

            public ActionResult Solicitud2(string id)
            {
            try 
            {
                string[] linkDecod = Util.Base64Decode(id).Split(';');
                int linkId = int.Parse(linkDecod[0]);
                using (ModeloTempora conexionDB = new ModeloTempora())
                {
                    Cliente cliente = conexionDB.Cliente.Find(linkId);
                    if (cliente == null)
                        throw new Exception("El usuario no existe");

                    Solicitud solicitud = conexionDB.Solicitud.Where(w => w.FK_idCliente == cliente.idCliente).FirstOrDefault();
                    //Insertar video
                    string estadoSolicitud = solicitud.Fk_idEstado.ToString();
                    int edad = Util.CalcularEdad(cliente.fecha_nacimiento.ToString());
                    string tecnica = solicitud.Tecnica.nombreTecnica;
                    int rango1 = int.Parse(conexionDB.RangoxSolicitud.Where(w=> w.FK_idSolicitud == solicitud.idSolicitud).Select(s=> s.FK_idRango).FirstOrDefault().ToString());
                    int Rango1 = int.Parse(conexionDB.RangoFoliculos.Where(w => w.idRango == rango1).Select(s => s.Rango).FirstOrDefault().ToString());
                    int idrango2 = int.Parse(conexionDB.RangoxSolicitud.Where(w => w.FK_idSolicitud == solicitud.idSolicitud).Select(s => s.idRangoxSolicitud).FirstOrDefault().ToString()) + 1;
                    int rango2 = int.Parse(conexionDB.RangoxSolicitud.Where(w => w.idRangoxSolicitud == idrango2).Select(s => s.FK_idRango).FirstOrDefault().ToString());
                    int Rango2 = int.Parse(conexionDB.RangoFoliculos.Where(w => w.idRango == rango2).Select(s => s.Rango).FirstOrDefault().ToString());

                    //Obtener video
                    string src = Util.CalcularVideo(tecnica, Rango1, Rango2, edad);
                    ViewData["idEstado"] = estadoSolicitud;
                    ViewData["src"] = src;
                    ViewData["Nombre"] = cliente.nombre +" "+ cliente.apellido;
                    ViewData["idSolicitud"] = solicitud.idSolicitud;
                    ViewData["idCliente"] = cliente.idCliente;
                    if (solicitud.Fk_idEstado > 25) {
                        String fotos1 = conexionDB.FotosUnMes.Where(w => w.FK_idSolicitud == solicitud.idSolicitud && w.seleccionado == true).Select(s => s.baseArchivo).FirstOrDefault().ToString();
                        String fotos3 = conexionDB.FotosTresMeses.Where(w => w.FK_idSolicitud == solicitud.idSolicitud && w.seleccionado == true).Select(s => s.baseArchivo).FirstOrDefault().ToString();
                        String fotos6 = conexionDB.FotosSeisMeses.Where(w => w.FK_idSolicitud == solicitud.idSolicitud && w.seleccionado == true).Select(s => s.baseArchivo).FirstOrDefault().ToString();
                        ViewData["foto1"] = "data: image / " + "jpeg" + "; base64, " + fotos1;
                        ViewData["foto3"] = "data: image / " + "jpeg" + "; base64, " + fotos3;
                        ViewData["foto6"] = "data: image / " + "jpeg" + "; base64, " + fotos6;
                    }


                }
            }
            catch (Exception ex) {
                Util.escribirLog("Solicitud", "Solicitudes (GET)", ex.Message);
                return RedirectToAction("Index", "Home");
            }
            return View();
        }

        public ActionResult EnviadoSolicitud()
        {
            return View();
        }

        public ActionResult Solicitud2Agendar(FormCollection collection)
        {
            try
            {
                //Usuario
                int Cliente = int.Parse(collection["idCliente"]);
                int Solicitud = int.Parse(collection["idSolicitud"]);   
                string fechaCirugia = collection["txtFechaCirugia"];

                DateTime fechaCirugia2 = Convert.ToDateTime(fechaCirugia);

                //DateTime.ParseExact(fechaCirugia, "dd/MM/yyyy", null);
                Util.escribirLog("La fechaCirugia la escribe:",  fechaCirugia, "");
                //string fechaCirugia2 = Convert.ToDateTime(fechaCirugia).ToString("dd/MM/yyyy");
                //Util.escribirLog("La fechaCirugia2 la escribe:", fechaCirugia2, "");
                string fechaLlamada = collection["txtFechaLlamada"];
                Util.escribirLog("La fechaLlamada la escribe:", fechaLlamada, "");

                //string fechaLlamada2 = Convert.ToDateTime(fechaLlamada).ToString("dd/MM/yyyy");
                //Util.escribirLog("La fechaLlamada2 la escribe:", fechaLlamada2, "");

                DateTime oDate = Convert.ToDateTime(fechaCirugia);
                DateTime oDate2 = Convert.ToDateTime(fechaLlamada);

                //DateTime oDate = DateTime.ParseExact(fechaCirugia, "dd/MM/yyyy", null);
                //DateTime oDate2 = DateTime.ParseExact(fechaLlamada, "dd/MM/yyyy", null);

                using (ModeloTempora conexionDB = new ModeloTempora())
                {
                    Cliente cliente = conexionDB.Cliente.Find(Cliente);
                    if (cliente == null)
                        throw new Exception("El usuario no existe");

                    Solicitud solicitud = conexionDB.Solicitud.Find(Solicitud);
                    solicitud.FechaCirugiaPaciente = oDate;
                    solicitud.FechaLlamada = oDate2;
                    solicitud.Fk_idEstado = 7;
                    solicitud.Leido = false;
                    conexionDB.SaveChanges();
                }
            }
            catch (Exception ex)
            {
                Util.escribirLog("Solicitud2Agendar", "Solicitudes (GET)", ex.Message);
                return RedirectToAction("Index", "Home");
            }
            return RedirectToAction("EnviadoSolicitud", "Solicitudes");
        }

        public ActionResult SolicitudFotos(string id) {
            try
            {

                string[] linkDecod = Util.Base64Decode(id).Split(';');
                int linkId = int.Parse(linkDecod[0]);
                using (ModeloTempora conexionDB = new ModeloTempora())
                {
                    Cliente cliente = conexionDB.Cliente.Find(linkId);
                    if (cliente == null)
                        throw new Exception("El usuario no existe");

                    ViewData["NombreCompleto"] = cliente.nombre + " " + cliente.apellido;
                    Solicitud solicitud = conexionDB.Solicitud.Where(w => w.FK_idCliente == cliente.idCliente).FirstOrDefault();
                    ViewData["idSolicitud"] = solicitud.idSolicitud.ToString();
                }
            }
            catch (Exception ex)
            {
                Util.escribirLog("SolicitudFotos", "Solicitudes (GET)", ex.Message);
                return RedirectToAction("Index", "Home");
            }
            return View();
        }


        [HttpPost/*, ValidateInput(false)*/]
        public ActionResult SolicitudFotos(IEnumerable<HttpPostedFileBase> files, FormCollection collection){
            try
            {
 

                //Fotos
                string base64FotoArriba = collection["fotoArriba"];
                base64FotoArriba = base64FotoArriba.Replace("data:image/jpeg;base64,", "");

                string base64FotoIzquierdo = collection["fotoIzquierdo"];
                base64FotoIzquierdo = base64FotoIzquierdo.Replace("data:image/jpeg;base64,", "");

                string base64FotoDerecho = collection["fotoDerecho"];
                base64FotoDerecho = base64FotoDerecho.Replace("data:image/jpeg;base64,", "");

                string base64FotoAtras = collection["fotoAtras"];
                base64FotoAtras = base64FotoAtras.Replace("data:image/jpeg;base64,", "");

                string base64FotoFrente = collection["fotoFrente"];
                base64FotoFrente = base64FotoFrente.Replace("data:image/jpeg;base64,", "");
                int idSolicitud = int.Parse(collection["idSolicitud"]);
                using (ModeloTempora conexionDB = new ModeloTempora())
                {

                    List<Fotos> listafotos = conexionDB.Fotos.Where(w=> w.FK_idSolicitud == idSolicitud).ToList();


                    Solicitud solicitud = conexionDB.Solicitud.Find(idSolicitud);
                    solicitud.Leido = true;
                    if (solicitud == null)
                        throw new Exception("La solicitud no existe");

                    //Agrego cada Foto.
                    int cont = 0;
                    foreach (var file in files)
                    {
                        if (file != null && file.ContentLength > 0)
                        {
                            var nombrearchivo = Path.GetFileName(file.FileName);
                            var path = Path.Combine(Server.MapPath("~/App_Data/"), nombrearchivo);

                            if (cont == 0)
                            {
                                System.IO.File.WriteAllBytes(path, Util.ConvertirBase64ABytes(base64FotoArriba));
                            }
                            if (cont == 1)
                            {
                                System.IO.File.WriteAllBytes(path, Util.ConvertirBase64ABytes(base64FotoIzquierdo));
                            }
                            if (cont == 2)
                            {
                                System.IO.File.WriteAllBytes(path, Util.ConvertirBase64ABytes(base64FotoDerecho));
                            }
                            if (cont == 3)
                            {
                                System.IO.File.WriteAllBytes(path, Util.ConvertirBase64ABytes(base64FotoAtras));
                            }
                            if (cont == 4)
                            {
                                System.IO.File.WriteAllBytes(path, Util.ConvertirBase64ABytes(base64FotoFrente));
                            }
                            
                            //var path = Path.GetTempPath();
                            var local = Path.Combine(Server.MapPath("~/App_Data/"), nombrearchivo);
                            file.SaveAs(path);
                            listafotos[cont].nombreFalso =
                            listafotos[cont].nombreArchivo = file.FileName;
                            listafotos[cont].baseArchivo = Util.ConvertirArchivoABase64(path);
                            var ultimoId2 = solicitud.idSolicitud;
                            listafotos[cont].FK_idSolicitud = ultimoId2;
                            conexionDB.SaveChanges();
                            cont++;
                        }
                    }

                }
            }
            catch (Exception ex)
            {
                Util.escribirLog("SolicitudFotos", "Solicitudes (GET)", ex.Message);
                return RedirectToAction("Index", "Home");
            }
            return RedirectToAction("FotosEnviadas", "Solicitudes");
        }
        public ActionResult FotosEnviadas()
        {
            return View();
        }

        public ActionResult SolicitudFotoUnMes(string id)
        {
            try
            {
                string[] linkDecod = Util.Base64Decode(id).Split(';');
                int linkId = int.Parse(linkDecod[0]);
                using (ModeloTempora conexionDB = new ModeloTempora())
                {
                    Cliente cliente = conexionDB.Cliente.Find(linkId);
                    if (cliente == null)
                        throw new Exception("El usuario no existe");

                    ViewData["NombreCompleto"] = cliente.nombre + " " + cliente.apellido;
                    Solicitud solicitud = conexionDB.Solicitud.Where(w => w.FK_idCliente == cliente.idCliente).FirstOrDefault();
                    ViewData["idSolicitud"] = solicitud.idSolicitud.ToString();
                }
            }
            catch (Exception ex)
            {
                Util.escribirLog("SolicitudFotos", "Solicitudes (GET)", ex.Message);
                return RedirectToAction("Index", "Home");
            }
            return View();
        }

        [HttpPost, ValidateInput(false)]
        public ActionResult SolicitudFotoUMesEnviar(IEnumerable<HttpPostedFileBase> files, FormCollection collection)
        {

            try
            {
                int idSolicitud = int.Parse(collection["idSolicitud"]);

                //FotosUnMes
                string base64FotoArriba = collection["fotoArriba"];
                base64FotoArriba = base64FotoArriba.Replace("data:image/jpeg;base64,", "");

                string base64FotoIzquierdo = collection["fotoIzquierdo"];
                base64FotoIzquierdo = base64FotoIzquierdo.Replace("data:image/jpeg;base64,", "");

                string base64FotoDerecho = collection["fotoDerecho"];
                base64FotoDerecho = base64FotoDerecho.Replace("data:image/jpeg;base64,", "");

                string base64FotoAtras = collection["fotoAtras"];
                base64FotoAtras = base64FotoAtras.Replace("data:image/jpeg;base64,", "");

                string base64FotoFrente = collection["fotoFrente"];
                base64FotoFrente = base64FotoFrente.Replace("data:image/jpeg;base64,", "");

                using (ModeloTempora conexionDB = new ModeloTempora())
                {
                    Solicitud solicitud = conexionDB.Solicitud.Find(idSolicitud);

                    //Agrego cada Foto.

                    FotosUnMes fotos = new FotosUnMes();


                    //Agrego cada Foto.
                    int cont = 1;
                    foreach (var file in files)
                    {
                        if (file != null && file.ContentLength > 0)
                        {
                            var nombrearchivo = Path.GetFileName(file.FileName);
                            var path = Path.Combine(Server.MapPath("~/App_Data/"), nombrearchivo);
                            FotosUnMes archivo = new FotosUnMes();
                            if (cont == 1)
                            {
                                System.IO.File.WriteAllBytes(path, Util.ConvertirBase64ABytes(base64FotoArriba));
                                archivo.nombreFalso = "Foto arriba";
                            }
                            if (cont == 2)
                            {
                                System.IO.File.WriteAllBytes(path, Util.ConvertirBase64ABytes(base64FotoIzquierdo));
                                archivo.nombreFalso = "Foto lado izquierdo";

                            }
                            if (cont == 3)
                            {
                                System.IO.File.WriteAllBytes(path, Util.ConvertirBase64ABytes(base64FotoDerecho));
                                archivo.nombreFalso = "Foto lado derecho";

                            }
                            if (cont == 4)
                            {
                                System.IO.File.WriteAllBytes(path, Util.ConvertirBase64ABytes(base64FotoAtras));
                                archivo.nombreFalso = "Foto atrás";

                            }
                            if (cont == 5)
                            {
                                System.IO.File.WriteAllBytes(path, Util.ConvertirBase64ABytes(base64FotoFrente));
                                archivo.nombreFalso = "Foto de frente";

                            }
                            cont++;
                            //var path = Path.GetTempPath();
                            var local = Path.Combine(Server.MapPath("~/App_Data/"), nombrearchivo);
                            file.SaveAs(path);
                            archivo.nombreArchivo = file.FileName;
                            archivo.baseArchivo = Util.ConvertirArchivoABase64(path);
                            var ultimoId2 = solicitud.idSolicitud;
                            archivo.FK_idSolicitud = ultimoId2;
                            conexionDB.FotosUnMes.Add(archivo);
                            conexionDB.SaveChanges();
                        }
                    }
                    solicitud.Fk_idEstado = 21;
                    solicitud.Foto1Mes = true;
                    solicitud.UltimoCambio = DateTime.Now;
                    solicitud.Leido = false;
                    conexionDB.SaveChanges();

                }

                return RedirectToAction("FotosEnviadas", "Solicitudes");
            }
            catch (Exception ex)
            {
                Util.escribirLog("SolicitudFotoUMesEnviar", "Solicitudes (GET)", ex.Message);
                return RedirectToAction("Index", "Home");
            }

        }

        public ActionResult SolicitudFotoTresMeses(string id)
        {
            try
            {
                string[] linkDecod = Util.Base64Decode(id).Split(';');
                int linkId = int.Parse(linkDecod[0]);
                using (ModeloTempora conexionDB = new ModeloTempora())
                {
                    Cliente cliente = conexionDB.Cliente.Find(linkId);
                    if (cliente == null)
                        throw new Exception("El usuario no existe");

                    ViewData["NombreCompleto"] = cliente.nombre + " " + cliente.apellido;
                    Solicitud solicitud = conexionDB.Solicitud.Where(w => w.FK_idCliente == cliente.idCliente).FirstOrDefault();
                    ViewData["idSolicitud"] = solicitud.idSolicitud.ToString();
                }
            }
            catch (Exception ex)
            {
                Util.escribirLog("SolicitudFotos", "Solicitudes (GET)", ex.Message + " + " + ex.InnerException.Message);
                return RedirectToAction("Index", "Home");
            }
            return View();
        }

        [HttpPost, ValidateInput(false)]
        public ActionResult SolicitudFotoTresMesesEnviar(IEnumerable<HttpPostedFileBase> files, FormCollection collection)
        {

            try
            {
                int idSolicitud = int.Parse(collection["idSolicitud"]);

                //FotosTresMeses
                string base64FotoArriba = collection["fotoArriba"];
                base64FotoArriba = base64FotoArriba.Replace("data:image/jpeg;base64,", "");

                string base64FotoIzquierdo = collection["fotoIzquierdo"];
                base64FotoIzquierdo = base64FotoIzquierdo.Replace("data:image/jpeg;base64,", "");

                string base64FotoDerecho = collection["fotoDerecho"];
                base64FotoDerecho = base64FotoDerecho.Replace("data:image/jpeg;base64,", "");

                string base64FotoAtras = collection["fotoAtras"];
                base64FotoAtras = base64FotoAtras.Replace("data:image/jpeg;base64,", "");

                string base64FotoFrente = collection["fotoFrente"];
                base64FotoFrente = base64FotoFrente.Replace("data:image/jpeg;base64,", "");

                using (ModeloTempora conexionDB = new ModeloTempora())
                {
                    Solicitud solicitud = conexionDB.Solicitud.Find(idSolicitud);

                    //Agrego cada Foto.

                    FotosTresMeses fotos = new FotosTresMeses();
                    Util.escribirLog("SolicitudFotoTresMesesEnviar", "ID Solicitud: " + idSolicitud.ToString(), "Entró al modelo");
                    //Agrego cada Foto.
                    int cont = 1;
                    foreach (var file in files)
                    {
                        if (file != null && file.ContentLength > 0)
                        {
                            var nombrearchivo = Path.GetFileName(file.FileName);
                            var path = Path.Combine(Server.MapPath("~/App_Data/"), nombrearchivo);
                            Util.escribirLog("SolicitudFotoTresMesesEnviar", "ID Solicitud: " + idSolicitud.ToString(), "PATH FOTO " + cont.ToString() + ": " + path.ToString());
                            FotosTresMeses archivo = new FotosTresMeses();

                            if (cont == 1)
                            {
                                System.IO.File.WriteAllBytes(path, Util.ConvertirBase64ABytes(base64FotoArriba));
                                archivo.nombreFalso = "Foto arriba";

                            }
                            if (cont == 2)
                            {
                                System.IO.File.WriteAllBytes(path, Util.ConvertirBase64ABytes(base64FotoIzquierdo));
                                archivo.nombreFalso = "Foto lado izquierdo";

                            }
                            if (cont == 3)
                            {
                                System.IO.File.WriteAllBytes(path, Util.ConvertirBase64ABytes(base64FotoDerecho));
                                archivo.nombreFalso = "Foto lado derecho";

                            }
                            if (cont == 4)
                            {
                                System.IO.File.WriteAllBytes(path, Util.ConvertirBase64ABytes(base64FotoAtras));
                                archivo.nombreFalso = "Foto atrás";
                            }
                            if (cont == 5)
                            {
                                System.IO.File.WriteAllBytes(path, Util.ConvertirBase64ABytes(base64FotoFrente));
                                archivo.nombreFalso = "Foto de frente";
                            }
                            cont++;
                            //var path = Path.GetTempPath();
                            var local = Path.Combine(Server.MapPath("~/App_Data/"), nombrearchivo);
                            file.SaveAs(path);

                            archivo.nombreArchivo = file.FileName;
                            archivo.baseArchivo = Util.ConvertirArchivoABase64(path);
                            var ultimoId2 = solicitud.idSolicitud;
                            archivo.FK_idSolicitud = ultimoId2;
                            conexionDB.FotosTresMeses.Add(archivo);
                            conexionDB.SaveChanges();
                        }

                    }
                    solicitud.Fk_idEstado = 23;
                    solicitud.Foto3Mes = true;
                    solicitud.UltimoCambio = DateTime.Now;
                    solicitud.Leido = false;
                    conexionDB.SaveChanges();

                }
                return RedirectToAction("FotosEnviadas", "Solicitudes");
            }
            catch (Exception ex)
            {
                Util.escribirLog("SolicitudFotoTresMesesEnviar", "Solicitudes (GET)", ex.Message);
                return RedirectToAction("Index", "Home");
            }


        }

        public ActionResult SolicitudFotoSeisMeses(string id)
        {
            try
            {
                string[] linkDecod = Util.Base64Decode(id).Split(';');
                int linkId = int.Parse(linkDecod[0]);
                using (ModeloTempora conexionDB = new ModeloTempora())
                {
                    Cliente cliente = conexionDB.Cliente.Find(linkId);
                    if (cliente == null)
                        throw new Exception("El usuario no existe");

                    ViewData["NombreCompleto"] = cliente.nombre + " " + cliente.apellido;
                    Solicitud solicitud = conexionDB.Solicitud.Where(w => w.FK_idCliente == cliente.idCliente).FirstOrDefault();
                    ViewData["idSolicitud"] = solicitud.idSolicitud.ToString();
                }
            }
            catch (Exception ex)
            {
                Util.escribirLog("SolicitudFotos", "Solicitudes (GET)", ex.Message);
                return RedirectToAction("Index", "Home");
            }
            return View();
        }

        [HttpPost, ValidateInput(false)]
        public ActionResult SolicitudFotoSeisMesesEnviar(IEnumerable<HttpPostedFileBase> files, FormCollection collection)
        {

            try
            {
                var idSolicitud = int.Parse(collection["idSolicitud"]);

                //FotosSeisMeses
                string base64FotoArriba = collection["fotoArriba"];
                base64FotoArriba = base64FotoArriba.Replace("data:image/jpeg;base64,", "");

                string base64FotoIzquierdo = collection["fotoIzquierdo"];
                base64FotoIzquierdo = base64FotoIzquierdo.Replace("data:image/jpeg;base64,", "");

                string base64FotoDerecho = collection["fotoDerecho"];
                base64FotoDerecho = base64FotoDerecho.Replace("data:image/jpeg;base64,", "");

                string base64FotoAtras = collection["fotoAtras"];
                base64FotoAtras = base64FotoAtras.Replace("data:image/jpeg;base64,", "");

                string base64FotoFrente = collection["fotoFrente"];
                base64FotoFrente = base64FotoFrente.Replace("data:image/jpeg;base64,", "");

                using (ModeloTempora conexionDB = new ModeloTempora())
                {
                    Solicitud solicitud = conexionDB.Solicitud.Find(idSolicitud);
                    if (solicitud == null)
                        throw new Exception("El la Solicitud no existe o hubo un error");

                    //Agrego cada Foto.

                    FotosSeisMeses fotos = new FotosSeisMeses();


                    //Agrego cada Foto.
                    int cont = 1;
                    foreach (var file in files)
                    {
                        if (file != null && file.ContentLength > 0)
                        {
                            var nombrearchivo = Path.GetFileName(file.FileName);
                            var path = Path.Combine(Server.MapPath("~/App_Data/"), nombrearchivo);
                            FotosSeisMeses archivo = new FotosSeisMeses();

                            if (cont == 1)
                            {
                                System.IO.File.WriteAllBytes(path, Util.ConvertirBase64ABytes(base64FotoArriba));
                                archivo.nombreFalso = "Foto arriba";

                            }
                            if (cont == 2)
                            {
                                System.IO.File.WriteAllBytes(path, Util.ConvertirBase64ABytes(base64FotoIzquierdo));
                                archivo.nombreFalso = "Foto lado izquierdo";

                            }
                            if (cont == 3)
                            {
                                System.IO.File.WriteAllBytes(path, Util.ConvertirBase64ABytes(base64FotoDerecho));
                                archivo.nombreFalso = "Foto lado derecho";

                            }
                            if (cont == 4)
                            {
                                System.IO.File.WriteAllBytes(path, Util.ConvertirBase64ABytes(base64FotoAtras));
                                archivo.nombreFalso = "Foto atrás";

                            }
                            if (cont == 5)
                            {
                                System.IO.File.WriteAllBytes(path, Util.ConvertirBase64ABytes(base64FotoFrente));
                                archivo.nombreFalso = "Foto de frente";

                            }
                            cont++;
                            //var path = Path.GetTempPath();
                            var local = Path.Combine(Server.MapPath("~/App_Data/"), nombrearchivo);
                            file.SaveAs(path);
                            archivo.nombreArchivo = file.FileName;
                            archivo.baseArchivo = Util.ConvertirArchivoABase64(path);
                            var ultimoId2 = solicitud.idSolicitud;
                            archivo.FK_idSolicitud = ultimoId2;
                            conexionDB.FotosSeisMeses.Add(archivo);
                            conexionDB.SaveChanges();
                        }
                    }

                    solicitud.Fk_idEstado = 25;
                    solicitud.Foto6Mes = true;
                    solicitud.UltimoCambio = DateTime.Now;
                    solicitud.Leido = false;
                    conexionDB.SaveChanges();

                }

                return RedirectToAction("FotosEnviadas", "Solicitudes");
            }
            catch (Exception ex)
            {
                Util.escribirLog("SolicitudFotoSeisMesesEnviar", "Solicitudes (GET)", ex.Message + " + " + ex.InnerException.InnerException.Message);
                return RedirectToAction("Index", "Home");
            }
    
        }


        public string ConsultarDescripcion(string idEstado)
        {
            try
            {
                int idestado = int.Parse(idEstado);
                using (ModeloTempora conexionDB = new ModeloTempora())
                {
                    EstadoSolicitud estado = conexionDB.EstadoSolicitud.Find(idestado);
                    if (estado == null)
                        throw new Exception("El estado no existe");

                    return estado.Descripcion + ";" + estado.FK_ClasificacionEstado;
                }
            }
            catch (Exception ex)
            {
                Util.escribirLog("ConsultarDescripcion", "Solicitudes (GET)", ex.Message);
                return "ERROR al cargar Descripcion";
            }
  
        }


        public string ConsultarEstado(string fkCategoria, string idEstado)
        {
            try
            {
                int idfkCategoria = int.Parse(fkCategoria);
                int estadoSeleccionado = int.Parse(idEstado);
                string estados = "";
                using (ModeloTempora conexionDB = new ModeloTempora())
                {
                    if (estadoSeleccionado == 6)
                    {
                        var listEstado = conexionDB.EstadoSolicitud
                        .Where(w => w.FK_ClasificacionEstado == 2 || w.FK_ClasificacionEstado == 8 || w.idEstado == estadoSeleccionado)
                        .Select(s => new
                        {
                            s.idEstado,
                            s.nombreEstado
                        }).ToList();

                        if (listEstado == null)
                            throw new Exception("El estado no existe");
                        estados = JsonConvert.SerializeObject(listEstado);
                    }
                    if (estadoSeleccionado == 11)
                    {
                        var listEstado = conexionDB.EstadoSolicitud
                        .Where(w => w.FK_ClasificacionEstado == 3 || w.FK_ClasificacionEstado == 6 || w.idEstado == estadoSeleccionado)
                        .Select(s => new
                        {
                            s.idEstado,
                            s.nombreEstado
                        }).ToList();

                        if (listEstado == null)
                            throw new Exception("El estado no existe");
                        estados = JsonConvert.SerializeObject(listEstado);
                    }
                    if (estadoSeleccionado == 19)
                    {
                        var listEstado = conexionDB.EstadoSolicitud
                        .Where(w => w.FK_ClasificacionEstado == 4 || w.FK_ClasificacionEstado == 6 || w.idEstado == estadoSeleccionado)
                        .Select(s => new
                        {
                            s.idEstado,
                            s.nombreEstado
                        }).ToList();

                        if (listEstado == null)
                            throw new Exception("El estado no existe");
                        estados = JsonConvert.SerializeObject(listEstado);
                    }
                    if (estadoSeleccionado == 27)
                    {
                        var listEstado = conexionDB.EstadoSolicitud
                        .Where(w => w.FK_ClasificacionEstado == 5 || w.FK_ClasificacionEstado == 6 || w.idEstado == estadoSeleccionado)
                        .Select(s => new
                        {
                            s.idEstado,
                            s.nombreEstado
                        }).ToList();

                        if (listEstado == null)
                            throw new Exception("El estado no existe");
                        estados = JsonConvert.SerializeObject(listEstado);
                    }
                    if (estadoSeleccionado != 6 && estadoSeleccionado !=  11 && estadoSeleccionado !=  19 && estadoSeleccionado !=  27)
                    {
                        var listEstado = conexionDB.EstadoSolicitud
                        .Where(w => w.FK_ClasificacionEstado == idfkCategoria || w.FK_ClasificacionEstado == 6 || w.idEstado == estadoSeleccionado)
                        .Select(s => new
                        {
                            s.idEstado,
                            s.nombreEstado
                        }).ToList();

                        if (listEstado == null)
                            throw new Exception("El estado no existe");
                        estados = JsonConvert.SerializeObject(listEstado);
                    }
                    return estados;
                }
            }
            catch (Exception ex)
            {
                Util.escribirLog("ConsultarDescripcion", "Solicitudes (GET)", ex.Message);
                return "ERROR al cargar Descripcion";
            }

        }

        public string ConsultarMicrositio(string idSolucitud, string idEstado)
        {
            try
            {
                int estadoSeleccionado = int.Parse(idEstado);
                int id = int.Parse(idSolucitud);
                using (ModeloTempora conexionDB = new ModeloTempora())
                {
                    Solicitud solicitud = conexionDB.Solicitud.Find(id);
                    string estado = solicitud.Fk_idEstado.ToString();
                    return estado;
                }
            }
            catch (Exception ex)
            {
                Util.escribirLog("ConsultarMicrositio", "Solicitudes (GET)", ex.Message);
                return "ERROR al cargar ESTADO";
            }
        }
        public ActionResult Enviado(string idcliente)
        {
            ViewData["Correo"] = Session["Correo"];
            return View();
        }

        public ActionResult CompletarSolicitud(string id)
        {
            try
            {
                string[] linkDecod = Util.Base64Decode(id).Split(';');
                int linkId = int.Parse(linkDecod[0]);
                using (ModeloTempora conexionDB = new ModeloTempora())
                {
                    Cliente cliente = conexionDB.Cliente.Find(linkId);
                    if (cliente == null)
                        throw new Exception("El usuario no existe");

                    ViewData["idCliente"] = linkId;
                    Solicitud solicitud = conexionDB.Solicitud.Where(w => w.FK_idCliente == cliente.idCliente).FirstOrDefault();
                    ViewData["idSolicitud"] = solicitud.idSolicitud.ToString();
                }
            }
            catch (Exception ex)
            {
                Util.escribirLog("CompletarSolicitud", "Solicitudes (GET)", ex.Message);
                return RedirectToAction("Index", "Home");
            }
            return View();
        }

        [HttpPost, ValidateInput(false)]
        public ActionResult CompletarSolicitud(IEnumerable<HttpPostedFileBase> files, FormCollection collection)
        {
            try
            {
                //Usuario
                int idCliente = int.Parse(collection["idCliente"]);
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
                int idSolicitud = int.Parse(collection["idSolicitud2"]);
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

                //Fotos
                string base64FotoArriba = collection["fotoArriba"];
                base64FotoArriba = base64FotoArriba.Replace("data:image/jpeg;base64,", "");

                string base64FotoIzquierdo = collection["fotoIzquierdo"];
                base64FotoIzquierdo = base64FotoIzquierdo.Replace("data:image/jpeg;base64,", "");

                string base64FotoDerecho = collection["fotoDerecho"];
                base64FotoDerecho = base64FotoDerecho.Replace("data:image/jpeg;base64,", "");

                string base64FotoAtras = collection["fotoAtras"];
                base64FotoAtras = base64FotoAtras.Replace("data:image/jpeg;base64,", "");

                string base64FotoFrente = collection["fotoFrente"];
                base64FotoFrente = base64FotoFrente.Replace("data:image/jpeg;base64,", "");


                using (ModeloTempora conexionDB = new ModeloTempora())
                {

                    //Se guarda el Usuario.
                    Cliente cliente = conexionDB.Cliente.Find(idCliente);
                    cliente.nombre = Nombre;
                    cliente.apellido = Apellido;
                    cliente.rut = Rut;
                    cliente.telefono = Telefono;
                    cliente.celular = Celular;
                    cliente.correo = Correo;
                    cliente.fecha_nacimiento = DateTime.Parse(FechaDeNacimiento);
                    //conexionDB.Cliente.Add(cliente);
                    string personId = string.Empty;
                    personId = PipeDriveAPI.AddPerson(Nombre, Correo, Celular);
                    cliente.idPipedrive = personId;
                    conexionDB.SaveChanges();


                    //Se guarda la solicitud del usuario
                    Solicitud solicitud = conexionDB.Solicitud.Find(idSolicitud);
                    solicitud.FK_idCliente = cliente.idCliente;
                    idcliente = cliente.idCliente.ToString();
                    solicitud.RespPelo = RespuestaPelones;
                    solicitud.RespDerm = RespuestaDerma;
                    solicitud.RespZona = RespuestaZona;
                    solicitud.FechaSolicitud = DateTime.Now;
                    solicitud.UltimoCambio = DateTime.Now;
                    solicitud.SolicitudCompleta = 1;
                    solicitud.Leido = true;
                    solicitud.Fk_idEstado = 1;
                    //conexionDB.Solicitud.Add(solicitud);
                    string dealId = string.Empty;
                    dealId = PipeDriveAPI.PostDeal(Nombre + " - " + Rut, "11504009", "hola", "open", personId);
                    solicitud.idPipedrive = dealId;
                    conexionDB.SaveChanges();

                    //Agrego cada Foto.

                    var filename = "fotoArriba.jpg";
                    var filename2 = "fotoIzquierdo.jpg";
                    var filename3 = "fotoDerecho.jpg";
                    var filename4 = "fotoAtras.jpg";
                    var filename5 = "fotoFrente.jpg";

                    List<Fotos> listafotos = conexionDB.Fotos.Where(w => w.FK_idSolicitud == idSolicitud).ToList();

                    //Agrego cada Foto.
                    int cont = 0;
                    foreach (var file in files)
                    {
                        if (file != null && file.ContentLength > 0)
                        {
                            var nombrearchivo = Path.GetFileName(file.FileName);
                            var path = Path.Combine(Server.MapPath("~/App_Data/"), nombrearchivo);

                            if (cont == 0)
                            {
                                System.IO.File.WriteAllBytes(path, Util.ConvertirBase64ABytes(base64FotoArriba));
                                listafotos[cont].nombreFalso = filename;
                            }
                            if (cont == 1)
                            {
                                System.IO.File.WriteAllBytes(path, Util.ConvertirBase64ABytes(base64FotoIzquierdo));
                                listafotos[cont].nombreFalso = filename2;
                            }
                            if (cont == 2)
                            {
                                System.IO.File.WriteAllBytes(path, Util.ConvertirBase64ABytes(base64FotoDerecho));
                                listafotos[cont].nombreFalso = filename3;
                            }
                            if (cont == 3)
                            {
                                System.IO.File.WriteAllBytes(path, Util.ConvertirBase64ABytes(base64FotoAtras));
                                listafotos[cont].nombreFalso = filename4;
                            }
                            if (cont == 4)
                            {
                                System.IO.File.WriteAllBytes(path, Util.ConvertirBase64ABytes(base64FotoFrente));
                                listafotos[cont].nombreFalso = filename5;
                            }

                            //var path = Path.GetTempPath();
                            var local = Path.Combine(Server.MapPath("~/App_Data/"), nombrearchivo);
                            file.SaveAs(path);
                            
                            listafotos[cont].nombreArchivo = file.FileName;
                            listafotos[cont].baseArchivo = Util.ConvertirArchivoABase64(path);
                            var ultimoId2 = solicitud.idSolicitud;
                            listafotos[cont].FK_idSolicitud = ultimoId2;
                            conexionDB.SaveChanges();
                            cont++;
                        }
                    }

                    //Enviar Correo
                    string titulo = "Solicitud completada - Portal Tempora";
                    string nombre = cliente.nombre + " " + cliente.apellido;
                    string correo = cliente.correo;
                    string rut = cliente.rut;
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
        public ActionResult Solicitud1(string idcliente)
        {
            return View();
        }
        //public ActionResult Solicitud2(string idcliente)
        //{
        //    return View();
        //}

        public ActionResult Login(string id)
        {
            string idCompleto = id;
            ViewData["idCompleto"] = idCompleto;
            string[] linkDecod = Util.Base64Decode(id).Split(';');
            int linkId = int.Parse(linkDecod[0]);
            ViewData["idCliente"] = linkId;
            ViewData["id"] = id;
            return View();
        }

        [HttpPost]
        public ActionResult Login(FormCollection collection)
        {
            string idCompleto = collection["idCompleto"];
            string id = collection["id"];
            string usr = collection["inputEmail"];
            string pass = collection["inputPassword"];
            int idCliente = int.Parse(collection["idCliente"]);
            //pass = Util.GetSHA1(pass);


            //string ApiActibitiesGet = string.Empty;
            //ApiActibitiesGet = PipeDriveAPI.GetAllPersons();
            //var respuesta = Util.EnviarWhatsapp();
            //PipeDriveAPI.AddUser("Fernanda", "fernanda.chin@uc.cl");
            //string hola = Util.EnviarWhatsapp();
            //ApiActibitiesPost = PipeDriveAPI.PostActivities("11504009", "Primera Consulta", "2021-06-10");
            //ApiActibitiesGet = PipeDriveAPI.GetAllDeals();

            try
            {
                using (ModeloTempora conexionDB = new ModeloTempora())
                {
                    Cliente cliente = conexionDB.Cliente.Where(w => w.correo == usr && w.password == pass).FirstOrDefault();
                    if (cliente != null)
                    {
                        if (cliente.idCliente == idCliente) {
                            return RedirectToAction("Solicitud2/" + id, "Solicitudes");
                        }
                        //Session.Timeout = 60;
                        //Session["Conectado"] = true;
                        //Session["IdUsuario"] = usuario.idUsuario;
                        //Session["IdPerfil"] = usuario.FK_idPerfil;
                        //Session["Usuario"] = usuario;
                        //Session["Nombre"] = usuario.Nombre + " " + usuario.Apellido;
                        //Session["Correo"] = usuario.Correo;
                        //Session["Celular"] = usuario.Telefono;
                        //Session["Telefono"] = usuario.Celular;
                        //Session["Permisos"] = new HomeController().NivelDePermisos(usuario.id_Usuarios);

                        
                    }
                    else
                    {
                        ViewData["Error"] = "Usuario o contraseña incorrecto";
                        return View();
                        //return "ERROR";
                    }

                }
            }
            catch (Exception ex)
            {

                Util.escribirLog("Login", "Solicitudes", ex.Message);
                Util.escribirLog("Login", "Solicitudes", ex.InnerException.Message);
                return RedirectToAction("Login/" + idCompleto, "Solicitudes");


            }
            return View();
        }
        public void GestorSolicitudIncompleta() {
            try
            {
                using (ModeloTempora conexionDB = new ModeloTempora())
                {
                    List<Solicitud> listaSolicitudes = conexionDB.Solicitud.Where(w => w.SolicitudCompleta == 0).ToList();
                    string opcionesSolicitudes = string.Empty;
                    DateTime fechaActual = DateTime.Now;
                    foreach (Solicitud solicitud in listaSolicitudes)
                    {
                        DateTime fechaSolicitudIncompleta = Convert.ToDateTime(solicitud.FechaSolicitudIncompleta);
                        double minutosSolicitudIncompleta = fechaActual.Subtract(fechaSolicitudIncompleta).TotalMinutes;

                        string correo = solicitud.Cliente.correo;
                        string nombre = solicitud.Cliente.nombre;
                        if (solicitud.CorreoSolicitudIncompleta == false && minutosSolicitudIncompleta > 10.0 && correo.Contains("@") == true) {
                            //Armar link
                            string link = solicitud.Cliente.idCliente + ";" + DateTime.Now.ToString("dd/MM/yyyy");
                            link = Util.Base64Encode(link);
                            //Enviar Correo
                            string titulo = "Complete su solicitud - Tempora";
                            string textoCorreo = System.IO.File.ReadAllText(HttpContext.Server.MapPath("~/Styles/MensajeSolicitudIncompleta.html")).Replace("[Link]", link).Replace("[Nombre]", nombre);
                            Util.EnviarMail(textoCorreo, correo, titulo);
                            solicitud.CorreoSolicitudIncompleta = true;
                            conexionDB.SaveChanges();
                        }
                    }

                }
            }
            catch (Exception ex)
            {

                Util.escribirLog("GestorFechasSolicitud", "Solicitudes", ex.Message);
                Util.escribirLog("GestorFechasSolicitud", "Solicitudes", ex.InnerException.Message);

            }
        }
        public void GestorFechasSolicitud()
        {
            try
            {
                using (ModeloTempora conexionDB = new ModeloTempora())
                {
                    List <Solicitud> listaSolicitudes = conexionDB.Solicitud.Where(w=> w.FechaCirugia != null && (w.Foto1Mes == false || w.Foto3Mes == false || w.Foto6Mes == false)).ToList();
                    string opcionesSolicitudes = string.Empty;
                    DateTime fechaActual = DateTime.Now;
                    
             
                    foreach (Solicitud solicitud in listaSolicitudes)
                    {
                        double meses = fechaActual.Subtract(Convert.ToDateTime(solicitud.FechaCirugia)).Days / (365.25 / 12);
                        string correo = solicitud.Cliente.correo;



                        // El día de tu cirugía 
                        if ((meses < 0.33 || meses > -0.89) && solicitud.DiaCirugiaEnviado == false)
                        {
                            solicitud.Fk_idEstado = 16;

                            //Armar link
                            string link = solicitud.Cliente.idCliente + ";" + DateTime.Now.ToString("dd/MM/yyyy");
                            link = Util.Base64Encode(link);
                            string Pass = solicitud.Cliente.password;
                            string nombreMedico = solicitud.Usuario.Nombre + " " + solicitud.Usuario.Apellido;
                            string FechaCirugia = solicitud.FechaCirugia.ToString();
                            //Enviar Correo
                            
                            string titulo = "El día de tu cirugía - Portal Tempora";
                            string nombre = solicitud.Cliente.nombre + " " + solicitud.Cliente.apellido;
                            string textoCorreo = System.IO.File.ReadAllText(HttpContext.Server.MapPath("~/Styles/MensajeSolicitudCuartoMicrositio.html")).Replace("[Nombre]", nombre).Replace("[Link]", link).Replace("[Password]", Pass).Replace("[nombreMedico]", nombreMedico).Replace("[FechaCirugia]", FechaCirugia);
                            Util.EnviarMail(textoCorreo, correo, titulo);

                            solicitud.DiaCirugiaEnviado = true;
                            solicitud.UltimoCambio = DateTime.Now;
                            solicitud.Leido = false;
                            conexionDB.SaveChanges();

                        }
                        if (meses >= 1.0 && solicitud.Foto1Mes == false) {

                            solicitud.Fk_idEstado = 20;

                            //Armar link
                            string link = solicitud.Cliente.idCliente + ";" + DateTime.Now.ToString("dd/MM/yyyy");
                            link = Util.Base64Encode(link);
                            //Enviar Correo
                            string titulo = "Fotografías un mes después - Tempora";
                            string nombre = solicitud.Cliente.nombre + " " + solicitud.Cliente.apellido;
                            string textoCorreo = System.IO.File.ReadAllText(HttpContext.Server.MapPath("~/Styles/MensajeSolicitudFotoUnMes.html")).Replace("[Link]", link).Replace("[Nombre]", nombre);
                            Util.EnviarMail(textoCorreo, correo, titulo);

                            solicitud.Foto1Mes = true;
                            solicitud.Leido = false;
                            solicitud.UltimoCambio = DateTime.Now;
                        }
                        if (meses >= 3.0 && solicitud.Foto3Mes == false)
                        {
                            solicitud.Fk_idEstado = 22;

                             //Armar link
                                string link = solicitud.Cliente.idCliente + ";" + DateTime.Now.ToString("dd/MM/yyyy");
                                link = Util.Base64Encode(link);
                                //Enviar Correo
                                string titulo = "Fotografías tres meses después - Tempora";
                                string nombre = solicitud.Cliente.nombre + " " + solicitud.Cliente.apellido;
                                string textoCorreo = System.IO.File.ReadAllText(HttpContext.Server.MapPath("~/Styles/MensajeSolicitudFotoTresMeses.html")).Replace("[Link]", link).Replace("[Nombre]", nombre);
                                Util.EnviarMail(textoCorreo, correo, titulo);
                            solicitud.Foto3Mes = true;
                            solicitud.Leido = false;
                            solicitud.UltimoCambio = DateTime.Now;
                        }
                        if (meses >= 6.0 && solicitud.Foto6Mes == false)
                        {
                            solicitud.Fk_idEstado = 24;

                            //Armar link
                            string link = solicitud.Cliente.idCliente + ";" + DateTime.Now.ToString("dd/MM/yyyy");
                            link = Util.Base64Encode(link);
                            //Enviar Correo
                            string titulo = "Fotografías seis meses después - Tempora";
                            string nombre = solicitud.Cliente.nombre + " " + solicitud.Cliente.apellido;
                            string textoCorreo = System.IO.File.ReadAllText(HttpContext.Server.MapPath("~/Styles/MensajeSolicitudFotoSeisMeses.html")).Replace("[Link]", link).Replace("[Nombre]", nombre);
                            Util.EnviarMail(textoCorreo, correo, titulo);
                            solicitud.Foto6Mes = true;
                            solicitud.Leido = false;
                            solicitud.UltimoCambio = DateTime.Now;
                        }
                        conexionDB.SaveChanges();
                    }
                }
            }
            catch (Exception ex)
            {

                Util.escribirLog("GestorFechasSolicitud", "Solicitudes", ex.Message);
                Util.escribirLog("GestorFechasSolicitud", "Solicitudes", ex.InnerException.Message);
 
            }
        }
        public string CambiarAlertas(string id)
        {

            try
            {
                int idSolicitud = int.Parse(id);
                using (ModeloTempora conexionDB = new ModeloTempora())
                {
                    Solicitud solicitud = conexionDB.Solicitud.Find(idSolicitud);
                    solicitud.Enviado = "False";
                    solicitud.Guardado = "False";
                    conexionDB.SaveChanges();
                    return "Cambio exitoso en ENVIAR Y GUARDAR";
                }

            }

            catch (Exception ex)
            {
                Util.escribirLog("ConsultarDescripcion", "Solicitudes (GET)", ex.Message);
                return "ERROR al GUARDAR ENVIAR";
            }
        }

    }

}
