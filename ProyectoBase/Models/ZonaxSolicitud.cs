//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace WebSolicitudes.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class ZonaxSolicitud
    {
        public int idZonaxSolicitud { get; set; }
        public Nullable<int> FK_idZona { get; set; }
        public Nullable<int> FK_idSolicitud { get; set; }
    
        public virtual Solicitud Solicitud { get; set; }
        public virtual ZonaAReparar ZonaAReparar { get; set; }
    }
}