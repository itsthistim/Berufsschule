using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace hofmann_ITL_MAK
{
    class Program
    {
        static void Main(string[] args)
        {
            bool run = true;
            int action;
            
            do
            {
                Console.Clear();
                Console.WriteLine("1) Lottozahlen");
                Console.WriteLine("2) Schachbrett");
                Console.WriteLine("c) Beenden");

                Console.Write("\nInput: ");
                string input = Console.ReadLine();

                if (int.TryParse(input, out action))
                {
                    if (action == 1)
                    {
                        HandleMenuA();
                    }
                    else if (action == 2)
                    {
                        HandleMenuB();
                    }
                }
                else if (input == "c")
                {
                    run = false;
                }

            } while (run);
        }

        #region Menu

        private static void HandleMenuA()
        {
            Console.Clear();
            int nOfNumbers;
            string amountStr;
            do
            {
                Console.Write("Anzahl der Zahlen in der Lotterie: ");
                amountStr = Console.ReadLine();
            } while (!int.TryParse(amountStr, out nOfNumbers));

            string maxStr;
            int maxNumber;
            do
            {
                Console.Write("Höchste Zahl in der Lotterie: ");
                maxStr = Console.ReadLine();

            } while (!int.TryParse(maxStr, out maxNumber));

            // Falls negative Zahlen eingegeben werden, werden diese zu positive konvertiert.
            PrintLotteryNumbers(Math.Abs(maxNumber), Math.Abs(nOfNumbers));
        }

        private static void HandleMenuB()
        {
            Console.Clear();
            char whiteChar;
            string char1Str;
            do
            {
                Console.Write("Zeichen für \"Weiß\": ");
                char1Str = Console.ReadLine();
            } while (!Char.TryParse(char1Str, out whiteChar));

            char blackChar;
            do
            {
                Console.Write("Zeichen für \"Schwarz\": ");
                char1Str = Console.ReadLine();
            } while (!Char.TryParse(char1Str, out blackChar));

            DrawChessBoard(whiteChar, blackChar);

        }

        #endregion

        #region Draw or print actions

        private static void PrintLotteryNumbers(int maxNumber, int nOfNumbers)
        {
            Console.Clear();
            Random rand = new Random();
            for (int i = 0; i < nOfNumbers; i++)
            {
                Console.Write($"{rand.Next(1, maxNumber)}\t");
            }

            Console.ReadLine();
        }

        private static void DrawChessBoard(char whiteChar, char blackChar)
        {
            Console.Clear();
            for (int i = 0; i < 8; i++)
            {
                for (int j = 0; j < 4; j++)
                {
                    Console.Write(whiteChar);
                    Console.Write(blackChar);
                }
                Console.WriteLine();
            }

            Console.ReadLine();
        }

        #endregion
    }
}
