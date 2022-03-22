using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DrawCharacter
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.ForegroundColor = ConsoleColor.Blue;
            Console.BackgroundColor = ConsoleColor.Gray;
            Console.Clear();

            if (args.Length < 3)
            {
                Console.WriteLine("Not enough parameters.\n<int: columns> <int: rows> <char: letter>");
            }
            else
            {
                bool validColumns = int.TryParse(args[0], out int columns);
                bool validRows = int.TryParse(args[1], out int rows);
                char letter = args[2].ToCharArray()[0];

                Console.SetWindowSize(10 + columns + 10, columns * 2 > 63 ? 63 : columns * 2);

                if (!validColumns || !validRows || char.IsWhiteSpace(letter))
                {
                    Console.WriteLine("Invalid parameters.\n<int: columns> <int: rows> <char: letter>");
                }
                else
                {
                    for (int i = 0; i < rows; i++)
                    {
                        Console.SetCursorPosition(10, 5 + i);
                        for (int j = 0; j < columns; j++)
                        {
                            Console.Write(letter);
                        }
                    }
                }
            }

            Console.ReadLine();
        }
    }
}
