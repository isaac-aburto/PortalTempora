using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http;
using System.Web.Services;

namespace WebSolicitudes
{
    /// <summary>
    /// Descripción breve de WebServiceTempora
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // Para permitir que se llame a este servicio web desde un script, usando ASP.NET AJAX, quite la marca de comentario de la línea siguiente. 
    // [System.Web.Script.Services.ScriptService]
    public class WebServiceTempora : System.Web.Services.WebService
    {

        [WebMethod]
        //[HttpPost]
        //public string webhook(string req, string res)
        //{// Creates the endpoint for our webhook 
        // //app.post('/webhook', (req, res) => {

        //    //let body = req.body;

        //    //// Checks this is an event from a page subscription
        //    //if (body.object === 'page') {

        //    //    // Iterates over each entry - there may be multiple if batched
        //    //    body.entry.forEach(function(entry) {

        //    //        // Gets the message. entry.messaging is an array, but 
        //    //        // will only ever contain one message, so we get index 0
        //    //        let webhook_event = entry.messaging[0];
        //    //        console.log(webhook_event);
        //    //    });

        //    //    // Returns a '200 OK' response to all requests
        //    //    res.status(200).send('EVENT_RECEIVED');
        //    //} else
        //    //{
        //    //    // Returns a '404 Not Found' if event is not from a page subscription
        //    //    res.sendStatus(404);
        //    //}
        //    return "Hola a todos";
        //}

        //[HttpGet]
        //public string webhook(string hub_verify_token, string hub_challenge, string hub_mode)
        //{
        //    return "Hola a todos";
        //}

        [HttpGet]
        public string webhook(Dictionary<string, string> varName)
        { 
            foreach(var eachvals in varName) { 
                //string Keyval = eachvals.["Key"]; 
                //string Value = eachvals.["Value"]; 
            }
            return "holaa";
        }
    }
        
}
