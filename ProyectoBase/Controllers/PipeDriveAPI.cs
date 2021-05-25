﻿using System;
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
                string respuestaAPI = LlamarAPI(host, parametros, xml, token, metodo);

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


        public static string LlamarAPI(string url, string parametros, string xml, string token, string metodo)
        {
            string respuesta = string.Empty;
            try
            {
                // Establecer protocolo de seguridad
                System.Net.ServicePointManager.SecurityProtocol = (SecurityProtocolType)3072;

                // Link del servidor y la función
                Uri uri = new Uri(url + parametros);

                // Cuerpo del XML
                StringContent content = new StringContent(xml);

                // Crear cliente
                HttpClient client = new HttpClient();

                // Agregar headers
                client.DefaultRequestHeaders.Accept.Add(
                    new MediaTypeWithQualityHeaderValue("application/xml")
                );

                // Agregar Token
                client.DefaultRequestHeaders.Add("X-Tableau-Auth", token);

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
                Util.escribirLog("TableauAPI", "Llamar API", ex.Message);
            }
            return (respuesta);
        }

    }
}