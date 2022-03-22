using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace StringOperations
{
    class Program
    {
        static void Main(string[] args)
        {
            string tmpStartTag = "<schueler>";
            string tmpEndTag = "</schueler>";

            string xml = ReadXml(@"D:\timho\Documents\Dev\Dev_BS\BerufschuleY2\StringOperations\school.xml");

            if (!string.IsNullOrEmpty(xml))
            {
                int tmpStartPos = xml.IndexOf(tmpStartTag);
                int tmpEndPos = xml.IndexOf(tmpEndTag);

                while (tmpStartPos >= 0 && tmpEndPos >= 0)
                {
                    string tmpSubStr = xml.Substring(tmpStartPos + tmpStartTag.Length, tmpEndPos - tmpStartPos - tmpStartTag.Length);
                    tmpSubStr = tmpSubStr.Trim();

                    string[] tmpRes = tmpSubStr.Split(new char[] { ' ' }, StringSplitOptions.RemoveEmptyEntries);

                    if (tmpRes.Length == 2)
                    {
                        Console.WriteLine($"Nachname: {tmpRes[0]}, Vorname: {tmpRes[1]}");
                    }

                    tmpStartPos = xml.IndexOf(tmpStartTag, tmpEndPos + tmpEndTag.Length);
                    tmpEndPos = xml.IndexOf(tmpEndTag, tmpEndPos + tmpEndTag.Length);
                }
                Console.ReadLine();
            }
        }

        static string ReadXml(string path)
        {
            FileInfo f = new FileInfo(path);

            string tmpXml = string.Empty;

            if (f.Exists)
            {
                // using schließt stream automatisch - auch wenn ein fehler passiert
                using (StreamReader sr = f.OpenText())
                {
                    string tmpLine;

                    do
                    {
                        tmpLine = sr.ReadLine();

                        if (tmpLine != null)
                        {
                            tmpXml += tmpLine;
                        }

                    } while (tmpLine != null);
                }
            }
            else
            {
                return "File not found!";
            }

            return tmpXml;
        }
    }
}
