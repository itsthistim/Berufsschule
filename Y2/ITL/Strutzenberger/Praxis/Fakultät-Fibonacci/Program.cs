using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Factorial_Fibonacci
{
    class Program
    {
        static void Main(string[] args)
        {
            Stopwatch sw = new Stopwatch();
            
            ulong fibN = 2;
            ulong facN = 6;

            #region Fibonacci
            Console.WriteLine("=== Fibonacci ===");
            Console.WriteLine($"Looking for the {fibN}. Fibonacci number:");

            sw.Restart();
            ulong fibRes = IterativeFibonacci(fibN);
            sw.Stop();

            Console.WriteLine($"\nIterative: {fibRes}");
            Console.WriteLine($"Time: {sw.ElapsedMilliseconds}.{sw.ElapsedTicks}ms");
            Console.Write("First 20 numbers in sequence: ");
            for (ulong i = 0; i < 20; i++)
            {
                Console.Write($"{IterativeFibonacci(i)} ");
            }

            sw.Restart();
            fibRes = RecursiveFibonacci(fibN);
            sw.Stop();

            Console.WriteLine($"\n\nRecursive: {fibRes}");
            Console.WriteLine($"Time: {sw.ElapsedMilliseconds}.{sw.ElapsedTicks}ms");
            Console.Write("First 20 numbers in sequence: ");
            for (ulong i = 0; i < 20; i++)
            {
                Console.Write($"{RecursiveFibonacci(i)} ");
            }
            #endregion
            #region Factorial
            Console.WriteLine("\n\n=== Factorial ===");
            Console.WriteLine($"Looking for {facN}!:");

            sw.Restart();
            ulong facRes = IterativeFactorial(facN);
            sw.Stop();

            Console.WriteLine($"\nIterative: {facRes}");
            Console.WriteLine($"Time: {sw.ElapsedMilliseconds}.{sw.ElapsedTicks}ms");

            sw.Restart();
            facRes = RecursiveFactorial(facN);
            sw.Stop();

            Console.WriteLine($"\nRecursive: {facRes}");
            Console.WriteLine($"Time: {sw.ElapsedMilliseconds}.{sw.ElapsedTicks}ms");

            #endregion

            Console.ReadLine();
        }

        #region Fibonacci
        private static ulong IterativeFibonacci(ulong n)
        {
            if (n <= 1)
            {
                return n;
            }

            ulong a = 0;
            ulong b = 1;

            for (ulong i = 0; i < n - 1; i++)
            {
                ulong c = a + b;
                a = b;
                b = c;
            }

            return b;
        }

        private static ulong RecursiveFibonacci(ulong n)
        {
            if (n == 0)
            {
                return 0;
            }
            else if (n == 1)
            {
                return 1;
            }
            else
            {
                return RecursiveFibonacci(n - 1) + RecursiveFibonacci(n - 2);
            }
        }
        #endregion
        #region Factorial
        private static ulong IterativeFactorial(ulong n)
        {
            ulong result = 1;

            for (ulong i = 1; i <= n; i++)
            {
                result *= i;
            }

            return result;
        }

        private static ulong RecursiveFactorial(ulong n)
        {
            if (n == 0)
            {
                return 1;
            }
            else
            {
                return n * RecursiveFactorial(n - 1);
            }
        }
        #endregion
    }
}
