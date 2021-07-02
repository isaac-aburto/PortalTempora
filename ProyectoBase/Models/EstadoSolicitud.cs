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
    
    public partial class EstadoSolicitud
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public EstadoSolicitud()
        {
            this.Solicitud = new HashSet<Solicitud>();
            this.ArchivoxEstado = new HashSet<ArchivoxEstado>();
        }
    
        public int idEstado { get; set; }
        public string nombreEstado { get; set; }
        public string cod_Estado { get; set; }
        public string etapaPipeDrive { get; set; }
        public string Descripcion { get; set; }
        public Nullable<bool> Enviado { get; set; }
        public Nullable<int> FK_ClasificacionEstado { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Solicitud> Solicitud { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ArchivoxEstado> ArchivoxEstado { get; set; }
    }
}
