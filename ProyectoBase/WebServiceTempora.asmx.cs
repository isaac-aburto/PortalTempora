using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.ServiceModel.Web;
using System.Web.Http;
using System.Web.Script.Services;
using System.Web.Services;
using WebSolicitudes.Controllers;
using WebSolicitudes.Models;

namespace WebSolicitudes
{
    /// <summary>
    /// Descripción breve de WebServiceTempora
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [ScriptService]
    [System.ComponentModel.ToolboxItem(false)]
    // Para permitir que se llame a este servicio web desde un script, usando ASP.NET AJAX, quite la marca de comentario de la línea siguiente. 
    // [System.Web.Script.Services.ScriptService]
    public class WebServiceTempora : System.Web.Services.WebService
    {

        [WebMethod]
        public String CrearTicket()
        {
            return "Respuesta correcta";
        }
        [WebMethod]
        public String CrearDeal(String json) {
            JObject json2 = JObject.Parse(json);
            Webhook flight = Newtonsoft.Json.JsonConvert.DeserializeObject<Webhook>(json);
            return "Respuesta Correcta";
        }
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        [WebMethod]
        public String CrearDeal2(Models.Webhook id)
        {
            return "Respuesta Correcta";
        }
        [WebMethod]
        public String CrearDeal3(int v, Matches_Filters matches_filters, Meta meta, int retry, Current current, Previous previous, string @event)
        {
            try
            {
                using (ModeloTempora conexionDB = new ModeloTempora())
                {
                    //Crear Cliente
                    Cliente cliente = new Cliente();
                    cliente.nombre = current.person_name;
                    cliente.idPipedrive = current.person_id.ToString();
                    //Consulta API para completar datos de Paciente
                    string valoresPerson = PipeDriveAPI.GetPerson(current.person_name);
                    //ACÁ IRÁ
                    conexionDB.Cliente.Add(cliente);
                    conexionDB.SaveChanges();

                    //Crear Solicitud
                    Solicitud solicitud = new Solicitud();
                    solicitud.FK_idCliente = cliente.idCliente;
                    solicitud.SolicitudCompleta = 1;
                    solicitud.Fk_idEstado = 1;
                    solicitud.FechaSolicitudIncompleta = DateTime.Now;
                    solicitud.UltimoCambio = DateTime.Now;
                    solicitud.FechaSolicitud = DateTime.Now;
                    solicitud.CorreoSolicitudIncompleta = true;
                    solicitud.idPipedrive = current.id.ToString();
                    solicitud.ValorTotal = current.weighted_value;
                    conexionDB.Solicitud.Add(solicitud);
                    conexionDB.SaveChanges();
                }
            }
            catch (Exception ex)
            {
                Util.escribirLog("CrearDeal3", "WebServiceTempora", ex.Message);
                return "Error: " + ex.Message;
            }
            return "Respuesta Correcta";
        }
        //[WebMethod]
        //public String CrearPerson(int v, Matches_Filters matches_filters, Meta meta, int retry, Current current, object previous, string @event, WebhookCrearPerson.Email email, WebhookCrearPerson.Phone phone)
        //{
        //    try
        //    {
        //        using (ModeloTempora conexionDB = new ModeloTempora())
        //        {
        //            int idCliente = int.Parse(ValorGlobalIdPerson);
        //            //Completar Cliente
        //            Cliente cliente = conexionDB.Cliente.Find(idCliente);
        //            cliente.correo = email.value;
        //            cliente.celular = phone.value;

        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        Util.escribirLog("CrearDeal3", "WebServiceTempora", ex.Message);
        //        return "Error: " + ex.Message;
        //    }
        //    return "Respuesta Correcta";
        //}

    }

}
