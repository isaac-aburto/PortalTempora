using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Web;
using System.Net.Http.Formatting;
using System.Net;
using System.Xml;
using WebSolicitudes.Models;

namespace WebSolicitudes.Controllers
{
    public static class PipeDriveAPI 
    {

        //Get: Activities
        public static string PostActivities(string user_id, string subject, string due_date) {
            string ejecucionCorrecta = "";
            try {
                string parametros = "&user_id=" + user_id + "&subjet=" + subject + "&due_date=" + due_date;
                string url = "https://tempora-sandbox.pipedrive.com/v1/activities?api_token=350cf4a120446f88a6cb27d3cbce6ec4109b50ae";
                string xml = string.Empty;
                string metodo = "POST";
                string respuestaAPI = LlamarAPI(metodo, url, parametros, xml);
                if (respuestaAPI.Contains("Error")) {
                    respuestaAPI = "Error en Get";
                } else {
                    respuestaAPI = "Insertado!";
                }

                return (respuestaAPI);
            }
            catch (Exception ex)
            {
                // Crear log de error
                ejecucionCorrecta = string.Empty;
                Util.escribirLog("PipeDriveApi", "GetActivities", ex.Message);
            }

            return "";
        }

        public static string GetActivities(string user_id)
        {
            string ejecucionCorrecta = "";
            try
            {
                string parametros = "&user_id=" + user_id;
                string url = "https://tempora-sandbox.pipedrive.com/v1/activities?api_token=350cf4a120446f88a6cb27d3cbce6ec4109b50ae";
                string xml = string.Empty;
                string metodo = "GET";
                string respuestaAPI = LlamarAPI(metodo, url, parametros, xml);
                if (respuestaAPI.Contains("Error"))
                {
                    respuestaAPI = "Error en Get";
                }
                else
                {
                    respuestaAPI = "GET!";
                }

                return (respuestaAPI);
            }
            catch (Exception ex)
            {
                // Crear log de error
                ejecucionCorrecta = string.Empty;
                Util.escribirLog("PipeDriveApi", "GetActivities", ex.Message);
            }

            return "";
        }

        //Get: Deals
        public static string GetAllDeals()
        {
            string ejecucionCorrecta = "";
            try
            {
                string parametros = "";
                string url = "https://tempora-sandbox.pipedrive.com/v1/deals?api_token=350cf4a120446f88a6cb27d3cbce6ec4109b50ae";
                string xml = string.Empty;
                string metodo = "GET";
                string respuestaAPI = LlamarAPI(metodo, url, parametros, xml);
                if (respuestaAPI.Contains("Error"))
                {
                    respuestaAPI = "Error en Get";
                }
                else
                {
                    respuestaAPI = "GET!";
                }

                return (respuestaAPI);
            }
            catch (Exception ex)
            {
                // Crear log de error
                ejecucionCorrecta = string.Empty;
                Util.escribirLog("PipeDriveApi", "PostDeal", ex.Message);
            }

            return "";
        }

        public static string PostDeal(string title, string user_id, string value, string status)
        {
            string ejecucionCorrecta = "";
            try
            {
                string parametros = "&title=" + title + "&user_id=" + user_id + "&value=" + value + "&status=" + status;
                string url = "https://tempora-sandbox.pipedrive.com/v1/deals?api_token=350cf4a120446f88a6cb27d3cbce6ec4109b50ae";
                string xml = string.Empty;
                string metodo = "POST";
                string respuestaAPI = LlamarAPI(metodo, url, parametros, xml);
                if (respuestaAPI.Contains("Error"))
                {
                    respuestaAPI = "Error en POST";
                }
                else
                {
                    respuestaAPI = "POST!";
                }

                return (respuestaAPI);
            }
            catch (Exception ex)
            {
                // Crear log de error
                ejecucionCorrecta = string.Empty;
                Util.escribirLog("PipeDriveApi", "PostDeal", ex.Message);
            }

            return "";
        }





        //
        // GET: /PipeDriveAPI/
        public static string GetWorkbooks(string token, string host, string idSitio)
        {
            string ejecucionCorrecta = "";
            try
            {
                int cantidadPorPagina = 100;
                string parametros = "/sites/" + idSitio + "/workbooks?pageSize=" + cantidadPorPagina;

                // Armar XMLs
                string xml = string.Empty;
                string metodo = "GET";

                // Llamar a la api
                string respuestaAPI = LlamarAPI(metodo, parametros, xml, metodo);

                // Transformar objeto XML
                XmlDocument xmlRespuesta = new XmlDocument();
                xmlRespuesta.LoadXml(respuestaAPI);

                return (respuestaAPI);
            }
            catch (Exception ex)
            {
                // Crear log de error
                ejecucionCorrecta = string.Empty;
                Util.escribirLog("TableauAPI", "GetWorkbooks", ex.Message);
            }
            return (ejecucionCorrecta);
        }


        public static string LlamarAPI(string metodo, string url, string parametros, string xml)
        {
            string respuesta = string.Empty;
            try
            {
                // Parámetros de prueba //
                string urlConsulta = url + parametros;

                // Establecer protocolo de seguridad
                System.Net.ServicePointManager.SecurityProtocol = (SecurityProtocolType)3072;

                // Link del servidor y la función
                Uri uri = new Uri(url);

                // Cuerpo del XML
                StringContent content = new StringContent(xml);

                // Crear cliente
                HttpClient client = new HttpClient();

                // Agregar headers
                //client.DefaultRequestHeaders.Accept.Add(
                //    new MediaTypeWithQualityHeaderValue("application/x-www-form-urlencoded")
                //);

                client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
                //// Agregar Token
                //client.DefaultRequestHeaders.Add("X-Tableau-Auth", token);

                // Hacer llamada a la API
                HttpResponseMessage response = new HttpResponseMessage();

                if (metodo.ToUpper() == "POST")
                    response = client.PostAsync(uri, content).Result;
                else if (metodo.ToUpper() == "GET")
                    response = client.GetAsync(uri).Result;
                else
                    throw new Exception("Error: Método inválido. Solo se acepta GET y POST");

                // Si es correcta, lee todo como string
                if (response.IsSuccessStatusCode)
                {
                    respuesta = response.Content.ReadAsStringAsync().Result;
                }
                // Si no es correcta, muestra el mensaje de error
                else
                {
                    respuesta = "Error: " + (int)response.StatusCode + " - " + response.ReasonPhrase;
                }

                // Cerrar conexión
                client.Dispose();
            }
            catch (Exception ex)
            {
                respuesta = "Error: " + ex.Message;
                Util.escribirLog("PipeDriveApi", "Llamar API", ex.Message);
            }
            return (respuesta);
        }

    }
}
