using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TextRepeater
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.BackgroundColor = ConsoleColor.DarkBlue;
            Console.ForegroundColor = ConsoleColor.White;
            Console.Clear();
            //Console.SetWindowSize(60, 60);

            if (args.Length < 2 || !int.TryParse(args[0], out int number))
            {
                Console.WriteLine("Invalid parameters.");
            }
            else
            {
                if (number < 2 || string.IsNullOrEmpty(args[1].Trim()))
                {
                    Console.WriteLine("Invalid parameters.\n(Amount of iterations has to be greater than 1 and the string can't be empty.)");
                }
                else
                {
                    for (int i = 0; i < number; i++)
                    {
                        //Console.WriteLine(args[1].Trim());

                        Console.SetCursorPosition(10, 5 + i);
                        Console.Write(args[1].Trim());
                    }
                }
            }

            Console.ReadLine();
        }
    }
}
