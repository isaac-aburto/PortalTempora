using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Web;
using System.Web.Mvc;

namespace WebSolicitudes.Controllers
{
    public class WhatsappController : Controller
    {
        //
        // GET: /Whatsapp/

        public static string EnviarWsp()
        {
            string respuesta = string.Empty;
            try
            {
                string xml = string.Empty;
                // Establecer protocolo de seguridad
                System.Net.ServicePointManager.SecurityProtocol = (SecurityProtocolType)3072;

                // Link del servidor y la función
                Uri uri = new Uri("https://app-server.wati.io/api/v1/sendSessionMessage/56953306060?messageText=Prueba%20de%20APi");

                // Cuerpo del XML
                StringContent content = new StringContent(xml);

                // Crear cliente
                HttpClient client = new HttpClient();

                // Agregar headers
                client.DefaultRequestHeaders.Accept.Add(
                    new MediaTypeWithQualityHeaderValue("application/xml")
                );

                // Hacer llamada a la API
                HttpResponseMessage response = client.PostAsync(uri, content).Result;

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
            catch (AggregateException aggEx)
            {
                respuesta = "Error: 404 " + aggEx.InnerException;
                Util.escribirLog("TableauAPI", "Llamar API", respuesta);
            }
            catch (WebException webEx)
            {
                if (webEx.Status == WebExceptionStatus.ProtocolError)
                {
                    respuesta = "Error: " + ((HttpWebResponse)webEx.Response).StatusCode + " " + ((HttpWebResponse)webEx.Response).StatusDescription;
                    Util.escribirLog("TableauAPI", "Status Code : {0}", ((HttpWebResponse)webEx.Response).StatusCode.ToString());
                    Util.escribirLog("TableauAPI", "Status Description : {0}", ((HttpWebResponse)webEx.Response).StatusDescription);
                }
            }
            catch (Exception ex)
            {
                respuesta = "Error: " + ex.Message;
                Util.escribirLog("TableauAPI", "Llamar API", ex.Message);
            }
            return (respuesta);
        }

    }
}
