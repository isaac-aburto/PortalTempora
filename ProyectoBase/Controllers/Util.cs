using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Net;
using System.Net.Mail;

namespace WebSolicitudes.Controllers
{
    public class Util
    {
        public static void escribirLog(string proceso, string metodo, string mensaje)
        {
            try
            {
                // Crear CSV
                string rutaLog = HttpRuntime.AppDomainAppPath;
                string nombreArchivo = "LogPortal.csv";
                string rutaCompleta = rutaLog + "LogPortal.csv";
                var csv = new StringBuilder();

                // Revisar si tiene cabecera
                string primeraLinea = string.Empty;
                bool existeArchivo = System.IO.File.Exists(rutaCompleta);
                if (existeArchivo)
                    primeraLinea = System.IO.File.ReadLines(rutaCompleta).FirstOrDefault();
                if (!existeArchivo || (existeArchivo && (primeraLinea == null || primeraLinea == string.Empty)))
                {
                    string cabecera =
                        string.Format("{0};{1};{2};{3};{4}"
                        , "Fecha"
                        , "Hora"
                        , "Proceso"
                        , "Método"
                        , "Mensaje"
                        );
                    csv.Append(cabecera);
                    System.IO.File.AppendAllText(rutaCompleta, csv.ToString());
                    csv.Clear();
                }

                // Crear línea
                string nuevaLinea = Environment.NewLine +
                    string.Format("{0};{1};{2};{3};{4}"
                    , "\"" + DateTime.Now.ToShortDateString() + "\""
                    , "\"" + DateTime.Now.ToShortTimeString() + "\""
                    , "\"" + proceso + "\""
                    , "\"" + metodo + "\""
                    , "\"" + mensaje + "\""
                    );

                // Agregar a archivo
                csv.Append(nuevaLinea);
                System.IO.File.AppendAllText(rutaCompleta, csv.ToString());
                csv.Clear();
            }
            catch (Exception)
            {
            }
        }

        public static string ConvertirArchivoABase64(string file)
        {
            try
            {
                byte[] array = System.IO.File.ReadAllBytes(file);
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
        public static void EnviarMail(string texto, string txtCorreo, string titulo)
        {
            using (MailMessage mail = new MailMessage())

            {
                mail.From = new MailAddress("isaac.aburto@backspace.cl");
                mail.To.Add("isaac.aburto@backspace.cl");
                mail.Subject = titulo;
                mail.Body = texto;
                mail.IsBodyHtml = true;
                //mail.Attachments.Add(new Attachment("C:\\file.zip"));

                using (SmtpClient client = new SmtpClient())
                {
                    client.EnableSsl = true;
                    client.UseDefaultCredentials = false;
                    client.Credentials = new NetworkCredential("isaac.aburto@backspace.cl", "Isaac74644453120509");
                    client.Host = "smtp.gmail.com";
                    client.Port = 587;
                    client.DeliveryMethod = SmtpDeliveryMethod.Network;
                    client.Send(mail);
                }

            }

        }

    }
}