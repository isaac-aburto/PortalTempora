using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Xml;

namespace WebSolicitudes.Controllers
{
    public class CasosController : Controller
    {
        //
        // GET: /Casos/

        public ActionResult Index()
        {
            return RedirectToAction("Creacion", "Casos");
        }

        //
        // GET: /Casos/Creacion

        public ActionResult Creacion()
        {
            #region Cargar campos

            ViewData["txtNombreSolicitante"] = "Nombre Apellido";
            ViewData["txtCorreoSolicitante"] = "correo@gmail.com";
            ViewData["txtFechaCreacion"] = DateTime.Today.ToString("dd/MM/yyyy");

            #endregion

            return View();
        }

        //
        // POST: /Casos/Creacion

        [HttpPost]
        public ActionResult Creacion(FormCollection collection, IEnumerable<HttpPostedFileBase> files)
        {
            try
            {
                #region Leer variables

                // Cabecera
                string txtNombreSolicitante = collection["txtNombreSolicitante"] ?? string.Empty;
                string txtCorreoSolicitante = collection["txtCorreoSolicitante"] ?? string.Empty;
                string txtFechaCreacion = collection["txtFechaCreacion"] ?? string.Empty;

                // Datos solicitud
                string txtNombres = collection["txtNombres"] ?? string.Empty;
                string txtApellidoPaterno = collection["txtApellidoPaterno"] ?? string.Empty;
                string txtApellidoMaterno = collection["txtApellidoMaterno"] ?? string.Empty;
                DateTime.TryParse(collection["txtFechaNacimiento"], out DateTime txtFechaNacimiento);
                int.TryParse(collection["txtNacionalidad"], out int txtNacionalidad);

                // Obtener usuario Bizagi
                string usuarioBizagi = System.Configuration.ConfigurationManager.AppSettings["usuarioBizagi"].ToString();
                string dominioBizagi = System.Configuration.ConfigurationManager.AppSettings["dominioBizagi"].ToString();

                #endregion

                #region Armar XML

                string xmlCreacion = @"
                <BizAgiWSParam>
                    <userName>" + usuarioBizagi + @"</userName>
                    <domain>" + dominioBizagi + @"</domain>
                    <Cases>
                        <Case>
                            <Process>ProcesoContrataciones</Process>
                            <Entities>
                                <M_Proceso>
                                    <Solicitud>
                                        <NombreSolicitante>" + txtNombreSolicitante + @"</NombreSolicitante>
                                        <CorreoSolicitante>" + txtCorreoSolicitante + @"</CorreoSolicitante>
                                        <FechaCreacion>" + txtFechaCreacion + @"</FechaCreacion>

                                        <Nombres>" + txtNombres + @"</Nombres>
                                        <ApellidoPaterno>" + txtApellidoPaterno + @"</ApellidoPaterno>
                                        <ApellidoMaterno>" + txtApellidoMaterno + @"</ApellidoMaterno>
                                        <FechaNacimiento>" + txtFechaNacimiento.ToShortDateString() + @"</FechaNacimiento>
                                        <Nacionalidad>" + txtNacionalidad + @"</Nacionalidad>
                                    </Solicitud>
                                </M_Proceso>
                            </Entities>
                        </Case>
                    </Cases>
                <BizAgiWSParam>
                ";

                xmlCreacion = xmlCreacion.Replace("\n", "");
                xmlCreacion = xmlCreacion.Replace("\t", "");
                xmlCreacion = xmlCreacion.Replace("\r", "");

                #endregion

                #region Respuesta Bizagi

                // TO DO: CARGAR CONEXIÓN DE BIZAGI
                //ServiceEngine.WorkflowEngineSOASoapClient workflowEngine = new ServiceEngine.WorkflowEngineSOASoapClient();

                Util.escribirLog("Creacion", "XML Creación", xmlCreacion);
                //string respuesta = workflowEngine.createCasesAsString(xmlCreacion);
                string respuesta = "Respuesta Bizagi";

                Util.escribirLog("Creacion", "XML Respuesta creación", respuesta);
                #endregion

            }
            catch (Exception ex)
            {
                Util.escribirLog("Creacion", "Error Creación", ex.Message);
                return RedirectToAction("Creacion", new { estado = 0 });
            }
            return View();
        }


        //
        // GET: /Casos/Resumen/NroCaso

        public ActionResult Resumen(int id)
        {
            #region Búsqueda Bizagi

            // TO DO: CARGAR CONEXIÓN DE BIZAGI
            //ServiceEntity.EntityManagerSOASoapClient entityManager = new ServiceEntity.EntityManagerSOASoapClient();

            string xmlBusqueda = @"
                <BizAgiWSParam>
	                <CaseInfo>
		                <CaseNumber>" + id + @"</CaseNumber>
	                </CaseInfo>
	                <XPaths>
                        <XPath XPath=""M_Proceso.Solicitud.NombreSolicitante""/>
		                <XPath XPath=""M_Proceso.Solicitud.CorreoSolicitante""/>
                        <XPath XPath=""M_Proceso.Solicitud.FechaCreacion""/>

		                <XPath XPath=""M_Proceso.Solicitud.Nombres""/>
		                <XPath XPath=""M_Proceso.Solicitud.ApellidoPaterno""/>
                        <XPath XPath=""M_Proceso.Solicitud.ApellidoMaterno""/>
                        <XPath XPath=""M_Proceso.Solicitud.FechaNacimiento""/>
                        <XPath XPath=""M_Proceso.Solicitud.Nacionalidad""/>
                    </XPaths>
                </BizAgiWSParam>
            ";

            xmlBusqueda = xmlBusqueda.Replace("\n", "");
            xmlBusqueda = xmlBusqueda.Replace("\t", "");
            xmlBusqueda = xmlBusqueda.Replace("\r", "");

            Util.escribirLog("Busqueda", "XML Forma de resumen: Búsqueda", xmlBusqueda);
            //string respuestaBusqueda = entityManager.getCaseDataUsingXPathsAsString(xmlBusqueda);
            string respuestaBusqueda = "RESPUESTA BIZAGI";
            Util.escribirLog("Busqueda", "XML Forma de resumen: Respuesta búsqueda", xmlBusqueda);
            
            /*
            // Convertir respuesta a XML
            XmlDocument doc = new XmlDocument();
            doc.LoadXml(respuestaBusqueda);

            // Seleccionar campos
            string txtNombreSolicitante = doc.SelectSingleNode("XPath[@XPath='M_Proceso.Solicitud.Nombres").InnerText;
            string txtApellidoPaterno = doc.SelectSingleNode("XPath[@XPath='M_Proceso.Solicitud.ApellidoPaterno").InnerText;
            string txtApellidoMaterno = doc.SelectSingleNode("XPath[@XPath='M_Proceso.Solicitud.ApellidoMaterno").InnerText;
            string txtFechaNacimiento = doc.SelectSingleNode("XPath[@XPath='M_Proceso.Solicitud.FechaNacimiento").InnerText;
            string txtNacionalidad = doc.SelectSingleNode("XPath[@XPath='M_Proceso.Solicitud.Nacionalidad").InnerText;
            */
            #endregion

            #region Cargar campos

            ViewData["txtNroCaso"] = id;

            ViewData["txtNombreSolicitante"] = "Nombre Apellido";
            ViewData["txtCorreoSolicitante"] = "correo@gmail.com";
            ViewData["txtFechaCreacion"] = DateTime.Today.ToString("dd/MM/yyyy");

            ViewData["txtNombres"] = "Nombre";
            ViewData["txtApellidoPaterno"] = "Apellido Paterno";
            ViewData["txtApellidoMaterno"] = "Apellido Materno";
            ViewData["txtFechaNacimiento"] = DateTime.Today.ToString("dd/MM/yyyy");
            ViewData["txtNacionalidad"] = "Nacionalidad";

            #endregion

            return View();
        }
    }
}
