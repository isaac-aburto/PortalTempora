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
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class ModeloTempora : DbContext
    {
        public ModeloTempora()
            : base("name=ModeloTempora")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<Archivos> Archivos { get; set; }
        public virtual DbSet<Ciudad> Ciudad { get; set; }
        public virtual DbSet<Cliente> Cliente { get; set; }
        public virtual DbSet<EstadoSolicitud> EstadoSolicitud { get; set; }
        public virtual DbSet<Fotos> Fotos { get; set; }
        public virtual DbSet<Perfil> Perfil { get; set; }
        public virtual DbSet<RangoFoliculos> RangoFoliculos { get; set; }
        public virtual DbSet<Region> Region { get; set; }
        public virtual DbSet<SLA> SLA { get; set; }
        public virtual DbSet<Solicitud> Solicitud { get; set; }
        public virtual DbSet<sysdiagrams> sysdiagrams { get; set; }
        public virtual DbSet<Tecnica> Tecnica { get; set; }
        public virtual DbSet<Usuario> Usuario { get; set; }
        public virtual DbSet<ZonaAReparar> ZonaAReparar { get; set; }
        public virtual DbSet<ZonaxSolicitud> ZonaxSolicitud { get; set; }
        public virtual DbSet<ArchivoxEstado> ArchivoxEstado { get; set; }
        public virtual DbSet<País> País { get; set; }
        public virtual DbSet<RangoxSolicitud> RangoxSolicitud { get; set; }
        public virtual DbSet<ClasificacionEstado> ClasificacionEstado { get; set; }
        public virtual DbSet<FotosSeisMeses> FotosSeisMeses { get; set; }
        public virtual DbSet<FotosTresMeses> FotosTresMeses { get; set; }
        public virtual DbSet<FotosUnMes> FotosUnMes { get; set; }
        public virtual DbSet<ArchivoVideo> ArchivoVideo { get; set; }
        public virtual DbSet<SeccionArchivo> SeccionArchivo { get; set; }
    }
}
