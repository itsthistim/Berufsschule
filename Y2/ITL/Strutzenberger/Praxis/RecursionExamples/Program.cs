using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RecursionExamples
{
    class Program
    {
        static void Main(string[] args)
        {
            int n = 100;
            Console.WriteLine($"Summe aller Zahlen bis {n}: {Summe(n)}");
            Console.ReadLine();
        }

        private static int Summe(int s)
        {
            if (s == 1)
            {
                return 1;
            }

            return s + Summe(s - 1);
        }
    }
}
