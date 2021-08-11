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
using Newtonsoft.Json;
using System.Text;
using IronPython.Runtime;
using System.Web.UI;
using RestSharp;
using System.Threading.Tasks;
using Newtonsoft.Json.Linq;
using System.Web.Util;
using System.IO;

namespace WebSolicitudes.Controllers
{
    public static class PipeDriveAPI 
    {

        //Get: Activities
        //public static async Task AddUser()
        //{
            
        //}
        public static string AddPerson(string name, string email, string phone)
        {
            string ejecucionCorrecta = "";
            try
            {
                string key = "name;email;phone";
                string value = name + ";" + email + ";" + phone;
                string url = "https://tempora-sandbox.pipedrive.com/v1/persons?api_token=350cf4a120446f88a6cb27d3cbce6ec4109b50ae";
                string xml = string.Empty;
                string metodo = "POST";
                string respuestaAPI = "";
                var idPersona = "0";
                LlamarAPIPost(metodo, url, key, value, xml);
                string idPersons = GetAllPersons();
                var idPerson = idPersons.Split(';');
                for (int i = 0; i < idPerson.Length; i++)
                {
                    if ((i+1) == idPerson.Length) {
                        idPersona = idPerson[i];
                    }
                }

                return (idPersona);
            }
            catch (Exception ex)
            {
                // Crear log de error
                ejecucionCorrecta = string.Empty;
                Util.escribirLog("PipeDriveApi", "GetActivities", ex.Message);
            }

            return "";
        }
        public static string GetAllPersons()
        {
            string ejecucionCorrecta = "";
            try
            {
                string parametros = "";
                string url = "https://tempora-sandbox.pipedrive.com/v1/persons?api_token=350cf4a120446f88a6cb27d3cbce6ec4109b50ae";
                string xml = string.Empty;
                string metodo = "GET";
                string respuestaAPI = LlamarAPIGet(metodo, url, parametros, xml);
                var idPersons = "";
                JObject json = JObject.Parse(respuestaAPI);
                JsonTextReader reader = new JsonTextReader(new StringReader(respuestaAPI));
                while (reader.Read())
                {
                    if (reader.Value != null)
                    {
                        if (reader.Value.ToString() == "id")
                        {
                            reader.Read();
                            idPersons = idPersons + ";" + reader.Value;
                        }
                    }
                    else
                    {
                        reader.Read();
                    }
                }

                return (idPersons);
            }
            catch (Exception ex)
            {
                // Crear log de error
                ejecucionCorrecta = string.Empty;
                Util.escribirLog("PipeDriveApi", "GetActivities", ex.Message);
            }

            return "";
        }
        public static string GetPerson(string nombre)
        {
            string ejecucionCorrecta = "";
            try
            {
                string parametros = "";
                string url = "https://tempora-sandbox.pipedrive.com/v1/persons?api_token=350cf4a120446f88a6cb27d3cbce6ec4109b50ae&term=" + nombre;
                string xml = string.Empty;
                string metodo = "GET";
                string respuestaAPI = LlamarAPIGet(metodo, url, parametros, xml);
                var idPersons = "";
                JObject json = JObject.Parse(respuestaAPI);
                JsonTextReader reader = new JsonTextReader(new StringReader(respuestaAPI));
                while (reader.Read())
                {
                    if (reader.Value != null)
                    {
                        if (reader.Value.ToString() == "id")
                        {
                            reader.Read();
                            if (reader.Value.ToString() == "72")
                            {
                                reader.Read();
                                if (reader.Value.ToString() == "phone") {
                                    reader.Read();
                                }
                            }
                            else {
                               reader.Read();
                            }
                            idPersons = idPersons + ";" + reader.Value;
                        }
                    }
                    else
                    {
                        reader.Read();
                    }
                }

                return (idPersons);
            }
            catch (Exception ex)
            {
                // Crear log de error
                ejecucionCorrecta = string.Empty;
                Util.escribirLog("PipeDriveApi", "GetActivities", ex.Message);
            }
            return "";
        }

            public static string PostActivities(string deal_id, string person_id, string user_id, string subject, string public_description, string type) {
            string ejecucionCorrecta = "";
            try {
                string parametros = "&deal_id=" + deal_id + "&person_id=" + person_id + "&user_id=" + user_id + "&subjet=" + subject + "&public_description=" + public_description + "&type=" + type;
                string key = "deal_id;person_id;user_id;subjet;public_description;type";
                string values = deal_id + ";" + person_id + ";" + user_id + ";" + subject + ";" + public_description + ";"+ type;
                string url = "https://tempora-sandbox.pipedrive.com/v1/activities?api_token=350cf4a120446f88a6cb27d3cbce6ec4109b50ae";
                string xml = string.Empty;
                string metodo = "POST";
                string respuestaAPI = "";
                respuestaAPI = "";


                //Create my object
                var myData = new
                {
                    deal_id = deal_id,
                    person_id = person_id,
                    user_id = user_id,
                    subject = subject,
                    public_description = public_description,
                    type = type
                };

                //Tranform it to Json object
                string jsonData = JsonConvert.SerializeObject(myData);

                //Parse the json object
                JObject jsonObject = JObject.Parse(jsonData);




                LlamarAPIPrueba(metodo, url, parametros, jsonObject);
                ////LlamarAPIGet(metodo, url, parametros, xml);
                //if (respuestaAPI.Contains("Error")) {
                //    respuestaAPI = "Error en Get";
                //} else {
                //    respuestaAPI = "Insertado!";
                //}

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
                string respuestaAPI = LlamarAPIGet(metodo, url, parametros, xml);
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
                string respuestaAPI = LlamarAPIGet(metodo, url, parametros, xml);
                var idDeals = "";
                JObject json = JObject.Parse(respuestaAPI);
                JsonTextReader reader = new JsonTextReader(new StringReader(respuestaAPI));
                while (reader.Read())
                {
                    if (reader.Value != null)
                    {
                        if (reader.Value.ToString() == "id") {
                            reader.Read();
                            idDeals = idDeals + ";" + reader.Value;
                        }
                    }
                    else
                    {
                        reader.Read();
                    }
                }
                //foreach (JProperty property in json.Properties())
                //{
                //    if (property.Name == "data") {
                //        Console.WriteLine(property.Name + " - " + property.Value);
                //    }
                    
                //}
                // Transformar objeto XML
                //XmlDocument xmlRespuesta = JsonConvert.DeserializeXmlNode(respuestaAPI);

                // Obtener token
                //string idSitio = xmlRespuesta
                //    .GetElementsByTagName("site")
                //    .Item(0)
                //    .Attributes["id"]
                //    .Value;

                return (idDeals);
            }
            catch (Exception ex)
            {
                // Crear log de error
                ejecucionCorrecta = string.Empty;
                Util.escribirLog("PipeDriveApi", "PostDeal", ex.Message);
            }

            return "";
        }

        public static string PostDeal(string title, string user_id, string value, string status, string person_id)
        {
            string ejecucionCorrecta = "";
            try
            {
                string key = "title;user_id;value;status;person_id";
                string values = title + ";" + user_id + ";" + value + ";" + status + ";" + person_id;
                string url = "https://tempora-sandbox.pipedrive.com/v1/deals?api_token=350cf4a120446f88a6cb27d3cbce6ec4109b50ae";
                string xml = string.Empty;
                string metodo = "POST";
                string respuestaAPI = "";
                var idDeal = "0";
                LlamarAPIPost(metodo, url, key, values, xml);
                string idDeals = GetAllDeals();
                var Deal = idDeals.Split(';');
                for (int i = 0; i < Deal.Length; i++)
                {
                    if ((i + 1) == Deal.Length)
                    {
                        idDeal = (int.Parse(Deal[i]) + 1).ToString();
                    }
                }


                return (idDeal);
            }
            catch (Exception ex)
            {
                // Crear log de error
                ejecucionCorrecta = string.Empty;
                Util.escribirLog("PipeDriveApi", "PostDeal", ex.Message);
            }

            return "";
        }
        public static string PostUser(string name, string email)
        {
            string ejecucionCorrecta = "";
            try
            {
                string key = "name;email";
                string values = name + ";" + email;
                string url = "https://tempora-sandbox.pipedrive.com/v1/users?api_token=350cf4a120446f88a6cb27d3cbce6ec4109b50ae";
                string xml = string.Empty;
                string metodo = "POST";
                var idUser = "";
                LlamarAPIPost(metodo, url, key, values, xml);
                string idUsers = GetAllUsers();
                var User = idUsers.Split(';');
                for (int i = 0; i < User.Length; i++)
                {
                    idUser = User[i];
                }
                return idUser;
            }
            catch (Exception ex)
            {
                // Crear log de error
                ejecucionCorrecta = string.Empty;
                Util.escribirLog("PipeDriveApi", "PostDeal", ex.Message);
                return "";
            }
        }
        public static string SincronizarUsers()
        {
            string correos = "";
            using (ModeloTempora conexionDB = new ModeloTempora())
            {

                
                var usuarios = conexionDB.Usuario.Select(s=> new { s.Correo, s.Nombre, s.Apellido }).ToList();
                //Sincronizar de BD a PD
                foreach (var usuarioBD in usuarios) {
                    var correoBD = usuarioBD.Correo;
                    bool encontro = GetUserbyEmail(usuarioBD.Correo, "0");
                    if (encontro == false) {
                        //CREAR USUARIO EN PD
                        string resultado = PostUser(usuarioBD.Nombre + " " + usuarioBD.Apellido, usuarioBD.Correo);
                    }
                }
                //Sincronizar de PD a BD
                string usuariosPD = GetUsersSincronizar();
                string[] separators = { ",", "\"", ";", ":", "{", "}", "[", "]", " ", "\n", "\r"};
                string[] words = usuariosPD.Split(separators, StringSplitOptions.RemoveEmptyEntries);
                var nombre = "";
                var id = "";
                for (int i = 0; i < words.Length; i++)
                    if (words[i] == "name")
                    {
                        nombre = words[i + 1];
                    }
                    else
                    {
                        if (words[i] == "id") {
                            id = words[i + 1];
                        }
                        if (words[i] == "email")
                        {
                            var correo = words[i + 1];
                            Console.WriteLine(words[i]);
                            Usuario usuario = conexionDB.Usuario.Where(w => w.Correo == correo).FirstOrDefault();
                            if (usuario == null)
                            {
                                Usuario nuevoUsuario = new Usuario();
                                nuevoUsuario.Nombre = nombre;
                                nuevoUsuario.idPipeDrive = id;
                                nuevoUsuario.Correo = correo;
                                nuevoUsuario.FK_idPerfil = 3;
                                conexionDB.Usuario.Add(nuevoUsuario);
                                conexionDB.SaveChanges();
                            }
                        }
                    }

            }

            return "";
        }
        public static string GetAllUsers()
        {
            string ejecucionCorrecta = "";
            try
            {
                string parametros = "";
                string url = "https://tempora-sandbox.pipedrive.com/v1/users?api_token=350cf4a120446f88a6cb27d3cbce6ec4109b50ae";
                string xml = string.Empty;
                string metodo = "GET";
                string respuestaAPI = LlamarAPIGet(metodo, url, parametros, xml);
                var idUsers = "";
                JObject json = JObject.Parse(respuestaAPI);
                JsonTextReader reader = new JsonTextReader(new StringReader(respuestaAPI));
                while (reader.Read())
                {
                    if (reader.Value != null)
                    {
                        if (reader.Value.ToString() == "id")
                        {
                            reader.Read();
                            idUsers = idUsers + ";" + reader.Value;
                        }
                    }
                    else
                    {
                        reader.Read();
                    }
                }
                return (idUsers);
            }
            catch (Exception ex)
            {
                // Crear log de error
                ejecucionCorrecta = string.Empty;
                Util.escribirLog("PipeDriveApi", "PostDeal", ex.Message);
            }

            return "";
        }

        public static bool GetUserbyEmail(string term, string email)
        {
            string ejecucionCorrecta = "";
            List<string> idUsers = new List<string>();
            try
            {
                string parametros = "";
                string url = "https://tempora-sandbox.pipedrive.com/v1/users/find?api_token=350cf4a120446f88a6cb27d3cbce6ec4109b50ae&term="+ term + "&search_by_email=1";
                string xml = string.Empty;
                string metodo = "GET";
                string respuestaAPI = LlamarAPIGet(metodo, url, parametros, xml);
                JObject json = JObject.Parse(respuestaAPI);
                string a = json.ToString();
                int numero = a.Length;
                if (numero <= 40)
                {
                    return false;
                }
                else {
                    return true;
                }
                
            }
            catch (Exception ex)
            {
                // Crear log de error
                ejecucionCorrecta = string.Empty;
                Util.escribirLog("PipeDriveApi", "PostDeal", ex.Message);
            }

            return (true);
        }
        public static string GetUsersSincronizar()
        {
            string ejecucionCorrecta = "";
            List<string> idUsers = new List<string>();
            try
            {
                string parametros = "";
                string url = "https://tempora-sandbox.pipedrive.com/v1/users?api_token=350cf4a120446f88a6cb27d3cbce6ec4109b50ae";
                string xml = string.Empty;
                string metodo = "GET";
                string respuestaAPI = LlamarAPIGet(metodo, url, parametros, xml);
                JObject json = JObject.Parse(respuestaAPI);
                return json.ToString();
            }
            catch (Exception ex)
            {
                // Crear log de error
                ejecucionCorrecta = string.Empty;
                Util.escribirLog("PipeDriveApi", "PostDeal", ex.Message);
            }

            return ("");
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
                string respuestaAPI = LlamarAPIGet(metodo, parametros, xml, metodo);

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


        public static string LlamarAPIGet(string metodo, string url, string parametros, string xml)
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

        public static void LlamarAPIPost(string metodo, string url, string Keys, string Value, string xml)
        {
            string respuesta = string.Empty;
            try
            {
                // Parámetros de prueba //
                string urlConsulta = url;

                // Establecer protocolo de seguridad
                System.Net.ServicePointManager.SecurityProtocol = (SecurityProtocolType)3072;

                // Link del servidor y la función
                Uri uri = new Uri(url);

                // Cuerpo del XML
                StringContent content = new StringContent(xml);

                // Crear cliente
                HttpClient client = new HttpClient();

                int _TimeoutSec = 90;
                client.Timeout = new TimeSpan(0, 0, _TimeoutSec);
                string _ContentType = "application/x-www-form-urlencoded";
                client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue(_ContentType));
                string[] keys = Keys.Split(';');
                string[] values = Value.Split(';');
                for (int i = 0; i < keys.Length; i++)
                {
                    client.DefaultRequestHeaders.Add(keys[i], values[i]);
                    //client.DefaultRequestHeaders.Add("title", "Isaac2 deal - Sandbox API C");
                }
                //var _UserAgent = "d-fens HttpClient";
                //client.DefaultRequestHeaders.Add("User-Agent", _UserAgent);

                var nvc = new List<KeyValuePair<string, string>>();
                
                for (int i = 0; i < keys.Length; i++)
                {
                    nvc.Add(new KeyValuePair<string, string>(keys[i], values[i]));
                }
                var req = new HttpRequestMessage(HttpMethod.Post, url) { Content = new FormUrlEncodedContent(nvc) };
                var res = client.SendAsync(req);
                HttpResponseMessage response = new HttpResponseMessage();

                if (metodo.ToUpper() == "POST")
                {
                    response = client.PostAsync(uri, null).Result;
                    var workItem = JsonConvert.DeserializeObject<WorkItem>(response.Content.ToString());
                }
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
            
        }

        public static string LlamarAPIPrueba(string metodo, string url, string parametros, JObject jsonObject)
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
                //StringContent content = new StringContent(xml);

                // Crear cliente
                HttpClient client = new HttpClient();

                // Agregar headers
                //client.DefaultRequestHeaders.Accept.Add(
                //    new MediaTypeWithQualityHeaderValue("application/x-www-form-urlencoded")
                //);

                var content = new StringContent(jsonObject.ToString(), Encoding.UTF8, "application/json");


                client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
                //// Agregar Token
                //client.DefaultRequestHeaders.Add("X-Tableau-Auth", token);

                // Hacer llamada a la API
                HttpResponseMessage response = new HttpResponseMessage();

                if (metodo.ToUpper() == "POST")
                    response = client.PostAsync(url, content).Result;
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
