using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace StatischeMethoden
{
    class Program
    {
        static void Main(string[] args)
        {
            int tmpLeft = 5;
            int tmpTop = 2;
            int tmpWait = 2000;

            char tmpInput = '\0';
            do
            {
                DrawMenu(tmpLeft, tmpTop);
                
                tmpInput = Console.ReadKey().KeyChar;
                
                switch (tmpInput)
                {
                    case '1':
                        HandleMenu1(tmpLeft, tmpTop, tmpWait);
                        break;
                    case '2':
                        HandleMenu2(tmpLeft, tmpTop, tmpWait);
                        break;
                    case '3':
                        break;
                    default:
                        HandleMenuDefault(tmpLeft, tmpTop, tmpWait);
                        break;
                }
            } while (tmpInput != '3');
        }

        static void DrawMenu(int left, int top)
        {
            Console.Clear();
            Console.SetCursorPosition(left, top++);
            Console.Write("1) Addiere zwei Zahlen");
            Console.SetCursorPosition(left, top++);
            Console.Write("2) Dividiere zwei Zahlen");
            Console.SetCursorPosition(left, top);
            Console.Write("3) Programm beenden");
        }

        static bool ReadNumbers(int left, int top, out int val1, out int val2)
        {
            val2 = 0;
            Console.Clear();
            
            Console.SetCursorPosition(left, top++);
            Console.Write("1. Zahl = ");
            string tmpInput1 = Console.ReadLine();

            Console.SetCursorPosition(left, top++);
            Console.Write("2. Zahl = ");
            string tmpInput2 = Console.ReadLine();

            if (int.TryParse(tmpInput1, out val1) && int.TryParse(tmpInput2, out val2))
            {
                return true;
            }

            return false;
        }

        static void HandleMenu1(int top, int left, int waitTime)
        {
            if (ReadNumbers(left, top, out int val1, out int val2))
            {
                Console.Write($"Ergebnis = {Sum(val1, val2)}");
            }
            else
            {
                Console.Write("Falsche Eingabe.");
            }

            Thread.Sleep(waitTime);
        }

        static void HandleMenu2(int top, int left, int waitTime)
        {
            if (ReadNumbers(left, top, out int val1, out int val2))
            {
                int tmpResult = 0;

                if (!Div(val1, val2, ref tmpResult))
                {
                    Console.WriteLine("Division durch 0!");
                }
                else
                {
                    Console.Write($"Ergebnis = {tmpResult}");
                }
            }
            else
            {
                Console.Write("Falsche Eingabe.");
            }

            Thread.Sleep(waitTime);
        }

        static int Sum(int val1, int val2)
        {
            return val1 + val2;
        }

        static bool Div(int val1, int val2, ref int res)
        {
            if (val2 == 0)
            {
                return false;
            }

            res = val1 / val2;
            return true;
        }

        static void HandleMenuDefault(int top, int left, int waitTime)
        {
            Console.Clear();
            Console.SetCursorPosition(left, top);
            Console.Write("Falsche Eingabe.");

            Thread.Sleep(waitTime);
        }
    }
}
