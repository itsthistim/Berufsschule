using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataStructures
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.Title = "Datenstrukturen";

            #region List
            Console.WriteLine("------------- List -------------");
            List<int> tmpList = new List<int>();
            tmpList.Add(100);
            tmpList.Add(200);
            tmpList.Add(300);

            tmpList.RemoveAt(0);

            for (int i = 0; i < tmpList.Count; i++)
            {
                Console.Write($"{tmpList[i]} ");
            }

            Console.WriteLine();

            foreach (int tmpVal in tmpList)
            {
                Console.Write($"{tmpVal} ");
            }

            Console.WriteLine($"\n{tmpList.Average()}");
            Console.WriteLine("--------------------------------");
            #endregion
            #region Dictionary
            Console.WriteLine("\n---------- Dictionary ----------");

            SortedDictionary<string, int> tmpDict = new SortedDictionary<string, int>();
            string tmpInput = "Hugo;Peter;Hugo;Paul;Anna";

            foreach (string tmpVal in tmpInput.Split(';'))
            {
                if (tmpDict.ContainsKey(tmpVal))
                {
                    tmpDict[tmpVal]++;
                }
                else
                {
                    tmpDict.Add(tmpVal, 1);
                }
            }

            foreach (KeyValuePair<string, int> tmpPair in tmpDict) // oder 'var' statt 'KeyValuePair<string, int>'
            {
                Console.WriteLine($"Name: {tmpPair.Key}; Anzahl: {tmpPair.Value}");
            }

            Console.WriteLine("--------------------------------");
            #endregion
            #region Durchschnitt Klasse
            Console.WriteLine("\n--- Durchschnitt Klassennote ---");
            Dictionary<string, List<double>> result = new Dictionary<string, List<double>>();
            string grades = "INF=2;AWL=1;INF=3;AMA=2;AMA=3";

            foreach (string item in grades.Split(';'))
            {
                string[] info = item.Split('=');
                string subject = info[0];
                string grade = info[1];

                if (!result.ContainsKey(subject))
                {
                    result.Add(subject, new List<double>());
                }

                result[info[0]].Add(double.Parse(grade));
            }

            foreach (var pair in result)
            {
                Console.WriteLine($"Gegenstand: {pair.Key}; Notendurchschnitt: {pair.Value.Average()}");
            }
            Console.WriteLine("--------------------------------");

            #endregion

            Console.ReadLine();
        }
    }
}
