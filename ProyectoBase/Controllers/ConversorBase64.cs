using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;

namespace WebSolicitudes.Controllers
{
    public static class ConversorBase64
    {
        /// 
        /// Cabezera para descargar archivo base64
        /// <a download href="data:application/pdf;base64,JVBER...>Descargar</a>
        ///

        #region Conversión base64
        /// <summary>
        /// Convierte un archivo a base64
        /// Devuelve la URI del archivo
        /// </summary>
        /// <param name="archivo">Ruta con nombre del archivo</param>
        /// <returns>File URI</returns>
        public static string convertirABase64(string file)
        {
            try
            {
                byte[] array = File.ReadAllBytes(file);
                string res = Convert.ToBase64String(array);
                Console.WriteLine(res);
                return res;
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                return null;
            }
        }

        /// <summary>
        /// Convierte una cadena de base64 a un archivo
        /// El archivo queda en la carpeta de ejecución del programa (debug)
        /// </summary>
        /// <param name="cadena">Cadena en base64</param>
        /// <param name="nombre">Nombre archivo de salida</param>
        /// <param name="extension">Extensión archivo de salida</param>
        /// <returns>true si la conversión fue correcta</returns>
        public static Boolean convertirDesdeBase64(string cadena, string nombre, string extension)
        {
            try
            {
                if (cadena == null || cadena == string.Empty)
                    throw new Exception("Cadena vacía");
                else if (nombre == null || nombre == string.Empty)
                    throw new Exception("Nombre vacío");
                else if (extension == null || extension == string.Empty)
                    throw new Exception("Extensión vacía");
                else
                {
                    string salida = nombre + "." + extension;
                    byte[] resultadoFinal = Convert.FromBase64String(cadena);
                    File.WriteAllBytes(salida, resultadoFinal);
                    return true;
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                return false;
            }
        }
        #endregion
    }
}