using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Net;
using System.Net.Mail;
using System.Security.Cryptography;
using System.Diagnostics;
using Microsoft.Scripting.Hosting;
using IronPython.Hosting;
using System.Threading.Tasks;

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
                mail.To.Add(txtCorreo);
                mail.Subject = titulo;
                mail.Body = texto;
                mail.IsBodyHtml = true;
                MailAddress copy = new MailAddress("jorge.cortez@backspace.cl");
                mail.CC.Add(copy);
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

        public static byte[] ConvertirBase64ABytes(string archivo)
        {
            try
            {
                byte[] res = Convert.FromBase64String(archivo);
                return res;
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                return null;
            }
        }

        //Encriptación de Contraseñas
        public static string GetSHA1(String texto)
        {
            SHA1 sha1 = SHA1CryptoServiceProvider.Create();
            Byte[] textOriginal = ASCIIEncoding.Default.GetBytes(texto);
            Byte[] hash = sha1.ComputeHash(textOriginal);
            StringBuilder cadena = new StringBuilder();
            foreach (byte i in hash)
            {
                cadena.AppendFormat("{0:x2}", i);
            }
            return cadena.ToString();
        }

        public static string Base64Encode(string plainText)
        {
            var plainTextBytes = System.Text.Encoding.UTF8.GetBytes(plainText);
            return System.Convert.ToBase64String(plainTextBytes);
        }
        public static string Base64Decode(string base64EncodedData)
        {
            var base64EncodedBytes = System.Convert.FromBase64String(base64EncodedData);
            return System.Text.Encoding.UTF8.GetString(base64EncodedBytes);
        }

        public static string EnviarWhatsapp(string inputEmail) {

            var psi = new ProcessStartInfo();
            psi.FileName = @"C:\Python\python.exe";
            
            var script = @"C:\Users\PC\Desktop\whatsapp.py";

            psi.Arguments = $"\"{script}";

            psi.UseShellExecute = false;
            psi.CreateNoWindow = true;
            psi.RedirectStandardOutput = true;
            psi.RedirectStandardError = true;

            var errors = "";
            var results = "";

            using (var process = Process.Start(psi)) {
                errors = process.StandardError.ReadToEnd();
                results = process.StandardOutput.ReadToEnd();
            }


            Console.WriteLine("Errors:");
            Console.WriteLine(errors);
            Console.WriteLine();
            Console.WriteLine("Resultados");
            Console.WriteLine(results);
            return results;
        }

        public static string EnviarWhatsappiron(){


            //String FileName = 


            return "";
        }

        public static void run_cmd()
        {

            string fileName = @"C:\sample_script.py";

            Process p = new Process();
            p.StartInfo = new ProcessStartInfo(@"C:\Python27\python.exe", fileName)
            {
                RedirectStandardOutput = true,
                UseShellExecute = false,
                CreateNoWindow = true
            };
            p.Start();

            string output = p.StandardOutput.ReadToEnd();
            p.WaitForExit();

            Console.WriteLine(output);

            Console.ReadLine();

        }

        public static int CalcularEdad(string FechaNacimiento) {

            var parsedDate = DateTime.Parse(FechaNacimiento);
            int edad = (DateTime.Today.AddTicks(-parsedDate.Ticks).Year - 1);


            return edad;
        }

        public static string CalcularVideo(string tecnica, int rango1, int rango2, int edad) {
            string video = string.Empty;


            if (tecnica == "FUE" && (edad >= 18 && edad <= 30) && (rango1 >= 1000 && rango2 <= 1500)) {
                return video = "../../Styles/caso/2079.mp4";
            }
            if (tecnica == "FUE" && (edad >= 18 && edad <= 30) && (rango1 >= 1500 && rango2 <= 2500))
            {
                return video = "../../Styles/caso/2637.mp4";
            }
            if (tecnica == "FUE" && (edad >= 18 && edad <= 30) && (rango1 >= 2500 && rango2 <= 2500))
            {
                return video = "../../Styles/caso/940.mp4";
            }
            if (tecnica == "FUE" && (edad >= 31 && edad <= 45) && (rango1 >= 1000 && rango2 <= 1500))
            {
                return video = "../../Styles/caso/2079.mp4";
            }
            if (tecnica == "FUE" && (edad >= 31 && edad <= 45) && (rango1 >= 1500 && rango2 <= 2500))
            {
                return video = "../../Styles/caso/2561.mp4";
            }
            if (tecnica == "FUE" && (edad >= 31 && edad <= 45) && (rango1 >= 2500 && rango2 <= 2500))
            {
                return video = "../../Styles/caso/1611.mp4";
            }
            if (tecnica == "FUE" && (edad >= 18 && edad <= 30) && (rango1 >= 1000 && rango2 <= 1500))
            {
                return video = "../../Styles/caso/2079.mp4";
            }
            if (tecnica == "FUE" && (edad >= 46 && edad <= 9999) && (rango1 >= 1000 && rango2 <= 1500))
            {
                return video = "../../Styles/caso/2742.mp4";
            }
            if (tecnica == "FUE" && (edad >= 46 && edad <= 9999) && (rango1 >= 1500 && rango2 <= 2500))
            {
                return video = "../../Styles/caso/2738.mp4";
            }
            if (tecnica == "FUE" && (edad >= 46 && edad <= 9999) && (rango1 >= 2500 && rango2 <= 2500))
            {
                return video = "../../Styles/caso/1611.mp4";
            }
            if (tecnica == "FUSS" && (edad >= 18 && edad <= 30) && (rango1 >= 1000 && rango2 <= 1500))
            {
                return video = "../../Styles/caso/373.mp4";
            }
            if (tecnica == "FUSS" && (edad >= 18 && edad <= 30) && (rango1 >= 1500 && rango2 <= 2500))
            {
                return video = "../../Styles/caso/373.mp4";
            }
            if (tecnica == "FUSS" && (edad >= 18 && edad <= 30) && (rango1 >= 2500 && rango2 <= 2500))
            {
                return video = "../../Styles/caso/2905.mp4";
            }
            if (tecnica == "FUSS" && (edad >= 31 && edad <= 45) && (rango1 >= 1000 && rango2 <= 1500))
            {
                return video = "../../Styles/caso/373.mp4";
            }
            if (tecnica == "FUSS" && (edad >= 31 && edad <= 45) && (rango1 >= 1500 && rango2 <= 2500))
            {
                return video = "../../Styles/caso/2447.mp4";
            }
            if (tecnica == "FUSS" && (edad >= 31 && edad <= 45) && (rango1 >= 2500 && rango2 <= 2500))
            {
                return video = "../../Styles/caso/2905.mp4";
            }
            if (tecnica == "FUSS" && (edad >= 46 && edad <= 9999) && (rango1 >= 1000 && rango2 <= 1500))
            {
                return video = "../../Styles/caso/2447.mp4";
            }
            if (tecnica == "FUSS" && (edad >= 46 && edad <= 9999) && (rango1 >= 1500 && rango2 <= 2500))
            {
                return video = "../../Styles/caso/611.mp4";
            }
            if (tecnica == "FUSS" && (edad >= 46 && edad <= 9999) && (rango1 >= 2500 && rango2 <= 2500))
            {
                return video = "../../Styles/caso/213.mp4";
            }

            return video;
        }
    }
}