using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace Arrays
{
    class Program
    {
        static void Main(string[] args)
        {
            int action;
            do
            {
                Console.Clear();
                PrintMenu();
                Console.WriteLine("\n");

                do
                {
                    Console.SetCursorPosition(0, Console.CursorTop - 1);
                    ClearCurrentConsoleLine(0);
                    Console.Write("Eingabe: ");
                } while (!int.TryParse(Console.ReadLine(), out action));
                Console.WriteLine();

                switch (action)
                {
                    case 1:
                        HandleMenu01();
                        break;
                    case 2:
                        HandleMenu02();
                        break;
                    case 3:
                        HandleMenu03();
                        break;
                    case 4:
                        HandleMenu04();
                        break;
                    case 5:
                        HandleMenu05();
                        break;
                    case 6:
                        HandleMenu06();
                        break;
                    case 7:
                        HandleMenu07();
                        break;
                    case 8:
                        Environment.Exit(0);
                        break;
                }
            } while (action != 8);
        }

        #region Menu
        private static void PrintMenu()
        {
            Console.Title = "Arrays und statische Methoden";

            Console.WriteLine("[1] Eindimensionales Array");
            Console.WriteLine("[2] Multipliziere Arrays");
            Console.WriteLine("[3] Primzahlen");
            Console.WriteLine("[4] Zufallszahlen");
            Console.WriteLine("[5] Zweidimensionales Array (gleiche Spaltenlänge)");
            Console.WriteLine("[6] Zweidimensionales Array (ungleiche Spaltenlänge)");
            Console.WriteLine("[7] Chess Board");
            Console.WriteLine("[8] Programm beenden");
        }
        private static void ClearCurrentConsoleLine(int left)
        {
            if (left >= 0 && left <= Console.BufferWidth)
            {
                int currentLineCursor = Console.CursorTop;
                Console.SetCursorPosition(0, Console.CursorTop);
                Console.Write(new string(' ', Console.WindowWidth));
                Console.SetCursorPosition(left, currentLineCursor);
            }
        }
        #endregion

        #region Actions

        #region Onedimensional Array
        private static void HandleMenu01()
        {
            Console.Clear();
            Console.WriteLine("=== Eindimensionales Array ===\n\n");

            int length;
            int val;

            do
            {
                Console.SetCursorPosition(0, Console.CursorTop - 1);
                ClearCurrentConsoleLine(0);
                Console.Write("Length: ");
            } while (!int.TryParse(Console.ReadLine(), out length) || length <= 0);

            Console.WriteLine();

            do
            {
                Console.SetCursorPosition(0, Console.CursorTop - 1);
                ClearCurrentConsoleLine(0);
                Console.Write("Initialiserungswert: ");
            } while (!int.TryParse(Console.ReadLine(), out val));
            Console.WriteLine();

            int[] arr = new int[length];
            InitArray(arr, val);
            PrintArray(arr);
            Thread.Sleep(2000);
        }

        private static void PrintArray(int[] arr)
        {
            foreach (int item in arr)
            {
                Console.Write($"{item} ");
            }
        }
        private static void InitArray(int[] arr, int val)
        {
            for (int i = 0; i < arr.Length; i++)
            {
                arr[i] = val;
            }
        }
        #endregion
        #region Multiply Array
        private static void HandleMenu02()
        {
            Console.Clear();
            int length;
            int val;

            int[] arr1 = new int[] { 0 };
            int[] arr2 = new int[] { 0 };

            for (int i = 0; i < 2; i++)
            {
                Console.Clear();
                Console.WriteLine("=== Arrays multiplizieren ===");
                Console.WriteLine($"------ Array {i + 1}: ------\n\n");

                do
                {
                    Console.SetCursorPosition(0, Console.CursorTop - 1);
                    ClearCurrentConsoleLine(0);
                    Console.Write("Länge: ");
                } while (!int.TryParse(Console.ReadLine(), out length) || length <= 0);

                Console.WriteLine("\n");

                if (i == 0)
                {
                    arr1 = new int[length];
                    for (int j = 0; j < arr1.Length; j++)
                    {
                        do
                        {
                            Console.SetCursorPosition(0, Console.CursorTop - 1);
                            ClearCurrentConsoleLine(0);
                            Console.Write($"{j + 1}. Wert: "); ;
                        } while (!int.TryParse(Console.ReadLine(), out val));

                        arr1[j] = val;
                    }
                }
                else
                {
                    arr2 = new int[length];
                    for (int j = 0; j < arr2.Length; j++)
                    {
                        do
                        {
                            Console.SetCursorPosition(0, Console.CursorTop - 1);
                            ClearCurrentConsoleLine(0);
                            Console.Write($"{j + 1}. Wert: "); ;
                        } while (!int.TryParse(Console.ReadLine(), out val));

                        arr2[j] = val;
                    }
                }
            }

            Console.WriteLine("\n");
            PrintArray(arr1);
            Console.WriteLine();
            PrintArray(arr2);

            Console.WriteLine("\n");
            MultiplyArray(arr1, arr2);
            Thread.Sleep(2000);
        }

        private static void MultiplyArray(int[] arr1, int[] arr2)
        {
            int[] res = new int[arr1.Length > arr2.Length ? arr1.Length : arr2.Length];

            for (int i = 0; i < (arr1.Length > arr2.Length ? arr1.Length : arr2.Length); i++)
            {
                if (i < (arr1.Length < arr2.Length ? arr1.Length : arr2.Length))
                {
                    res[i] = arr1[i] * arr2[i];
                }
                else
                {
                    res[i] = (arr1.Length > arr2.Length ? arr1[i] : arr2[i]) * 0;
                }
            }

            PrintArray(res);
        }

        #endregion
        #region Primenumber Array
        private static void HandleMenu03()
        {
            Console.Clear();
            Console.WriteLine("=== Primzahlen ===\n\n");

            int primaryNumberCount;
            do
            {
                Console.SetCursorPosition(0, Console.CursorTop - 1);
                ClearCurrentConsoleLine(0);
                Console.Write("Anzahl der Primzahlen: "); ;
            } while (!int.TryParse(Console.ReadLine(), out primaryNumberCount) || primaryNumberCount <= 0);

            CreatePrimeNumbers(primaryNumberCount);
        }
        private static void CreatePrimeNumbers(int primeNumberCount)
        {
            int[] array = new int[primeNumberCount];

            int j = 0;
            for (int i = 2; j < primeNumberCount; i++)
            {
                if (IsPrimeNumber(i))
                {
                    array[j++] = i;
                }
            }

            Console.WriteLine();
            PrintArray(array);
            Thread.Sleep(2000);
        }
        public static bool IsPrimeNumber(int x)
        {
            if (x <= 1)
            {
                return false;
            }

            if (x == 2)
            {
                return true;
            }

            if (x % 2 == 0)
            {
                return false;
            }

            int maxPrime = Convert.ToInt32(Math.Sqrt(x));

            for (int i = 3; i <= maxPrime; i += 2)
            {
                if (x % i == 0)
                {
                    return false;
                }
            }

            return true;
        }
        #endregion
        #region Zufallszahlen
        private static void HandleMenu04()
        {
            Console.Clear();
            Console.WriteLine("=== Zufallszahlen ===\n\n");

            int randomNumberCount;
            do
            {
                Console.SetCursorPosition(0, Console.CursorTop - 1);
                ClearCurrentConsoleLine(0);
                Console.Write("Anzahl der zufälligen Zahlen: "); ;
            } while (!int.TryParse(Console.ReadLine(), out randomNumberCount) || randomNumberCount <= 0);

            Console.WriteLine();

            int maxNumber;
            do
            {
                Console.SetCursorPosition(0, Console.CursorTop - 1);
                ClearCurrentConsoleLine(0);
                Console.Write("Höchste generierbare Zahl: ");
            } while (!int.TryParse(Console.ReadLine(), out maxNumber) || maxNumber < 0);

            CreateRandomNumbers(randomNumberCount, maxNumber);
            Thread.Sleep(2000);
        }

        private static void CreateRandomNumbers(int randomNumberCount, int maxNumber)
        {
            Random rand = new Random();
            int[] randomNumbers = new int[randomNumberCount];

            for (int i = 0; i < randomNumbers.Length; i++)
            {
                randomNumbers[i] = rand.Next(0, maxNumber + 1);
            }

            Console.WriteLine();
            PrintArray(randomNumbers);
        }
        #endregion
        #region 2D Array mit gleicher Spaltenlänge
        private static void HandleMenu05()
        {
            Console.Clear();
            Console.WriteLine("=== 2D-Array mit gleicher Spaltenlänge ===\n\n");

            int rows;
            int columns;
            int val;

            do
            {
                Console.SetCursorPosition(0, Console.CursorTop - 1);
                ClearCurrentConsoleLine(0);
                Console.Write("Anzahl der Spalten: ");
            } while (!int.TryParse(Console.ReadLine(), out columns) || columns <= 0);
            Console.WriteLine();

            do
            {
                Console.SetCursorPosition(0, Console.CursorTop - 1);
                ClearCurrentConsoleLine(0);
                Console.Write("Anzahl der Zeilen: ");
            } while (!int.TryParse(Console.ReadLine(), out rows) || rows <= 0);
            Console.WriteLine();

            do
            {
                Console.SetCursorPosition(0, Console.CursorTop - 1);
                ClearCurrentConsoleLine(0);
                Console.Write("Initialisierungswert: ");
            } while (!int.TryParse(Console.ReadLine(), out val));
            Console.WriteLine();

            int[,] tab = new int[rows,columns];
            
            InitTab(tab, val);
            PrintTab(tab);
            Thread.Sleep(2000);
        }

        private static void PrintTab(int[,] tab)
        {
            for (int i = 0; i < tab.GetLength(0); i++)
            {
                for (int j = 0; j < tab.GetLength(1); j++)
                {
                    Console.Write($"{tab[i,j]} ");
                }
                Console.WriteLine();
            }
        }

        private static void InitTab(int[,] tab, int val)
        {
            for (int i = 0; i < tab.GetLength(0); i++)
            {
                for (int j = 0; j < tab.GetLength(1); j++)
                {
                    tab[i, j] = val;
                }
            }
        }

        #endregion
        #region 2D Array mit ungleicher Spaltenlänge
        private static void HandleMenu06()
        {
            Console.Clear();
            Console.WriteLine("=== 2D Array mit ungleicher Spaltenlänge ===\n\n");

            int columns;
            int val;

            do
            {
                Console.SetCursorPosition(0, Console.CursorTop - 1);
                ClearCurrentConsoleLine(0);
                Console.Write("Anzahl der Spalten: ");
            } while (!int.TryParse(Console.ReadLine(), out columns) || columns <= 0);
            Console.WriteLine();

            do
            {
                Console.SetCursorPosition(0, Console.CursorTop - 1);
                ClearCurrentConsoleLine(0);
                Console.Write("Initialisierungswert: ");
            } while (!int.TryParse(Console.ReadLine(), out val));
            Console.WriteLine("\n");

            int[][] tab = new int[columns][];

            InitTab(tab, val);
            PrintTab(tab);
            Thread.Sleep(2000);
        }

        private static void PrintTab(int[][] tab)
        {
            for (int i = 0; i < tab.Length; i++)
            {
                for (int j = 0; j < tab[i].Length; j++)
                {
                    Console.Write($"{tab[i][j]} ");
                }
                Console.WriteLine();
            }
        }

        private static void InitTab(int[][] tab, int val)
        {
            for (int i = 0; i < tab.Length; i++)
            {
                int length;
                do
                {
                    Console.SetCursorPosition(0, Console.CursorTop - 1);
                    ClearCurrentConsoleLine(0);
                    Console.Write($"Zeilen in der {i + 1}. Spalte: ");
                } while (!int.TryParse(Console.ReadLine(), out length) || length <= 0);

                int[] column = new int[length];
                for (int j = 0; j < column.Length; j++)
                {
                    column[j] = val;
                }
                tab[i] = column;
            }

            Console.WriteLine("\n");
        }
        #endregion
        #region Chess Board
        private static void HandleMenu07()
        {
            Console.Clear();
            Console.WriteLine("=== Chess Board ===\n\n");

            char[,] board = new char[8,8];

            for (int i = 0; i < board.GetLength(0); i++)
            {
                for (int j = 0; j < board.GetLength(1); j++)
                {
                    if ((i % 2 == 0 && j % 2 == 0) || (i % 2 != 0 && j % 2 != 0))
                    {
                        board[i, j] = '#';
                    }
                    else
                    {
                        board[i, j] = '_';
                    }
                }
            }

            PrintTab(board);
            Thread.Sleep(2000);
        }

        private static void PrintTab(char[,] tab)
        {
            for (int i = 0; i < tab.GetLength(0); i++)
            {
                for (int j = 0; j < tab.GetLength(1); j++)
                {
                    Console.Write($"{tab[i,j]} ");
                }
                Console.WriteLine();
            }
        }

        #endregion
        
        #endregion
    }
}
