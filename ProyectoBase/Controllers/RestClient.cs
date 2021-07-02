using RestSharp;
using System;

namespace WebSolicitudes.Controllers
{
    internal class RestClient
    {
        private string v;

        public RestClient(string v)
        {
            this.v = v;
        }

        public int Timeout { get; internal set; }

        
    }
}