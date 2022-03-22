using System;
using System.IO;
using System.Text.RegularExpressions;
using System.Threading;

namespace hofmann_ITL_MAK2
{
    class Program
    {
        static void Main(string[] args)
        {
            char action;
            do
            {
                action = Menu();
                switch (action)
                {
                    case 'a':
                        HandleMenuA();
                        break;
                    case 'b':
                        HandleMenuB();
                        break;
                    case 'c':
                        Environment.Exit(0);
                        break;
                }
            } while (action != 3);
        }

        #region Arrays

        private static void HandleMenuA()
        {
            Console.Clear();
            Console.WriteLine("=== Dividiere Arrays ===\n");

            // get sizes for arrays
            int arr1Size;
            do
            {
                Console.SetCursorPosition(0, Console.CursorTop - 1);
                ClearCurrentConsoleLine(0);
                Console.Write("Größe der 1ten Array: ");
            } while (!int.TryParse(Console.ReadLine(), out arr1Size) || arr1Size < 1);
            Console.WriteLine();

            int arr2Size;
            do
            {
                Console.SetCursorPosition(0, Console.CursorTop - 1);
                ClearCurrentConsoleLine(0);
                Console.Write("Größe der 2ten Array: ");
            } while (!int.TryParse(Console.ReadLine(), out arr2Size) || arr2Size < 1);
            Console.WriteLine();

            // init arrays
            double counter = 1;
            double[] arr1 = new double[arr1Size];
            for (int i = 0; i < arr1.Length; i++)
            {
                arr1[i] = counter++;
            }

            double[] arr2 = new double[arr2Size];
            for (int i = 0; i < arr2.Length; i++)
            {
                arr2[i] = counter++;
            }

            // print arr1 and arr2
            Print(arr1);
            Print(arr2);
            Console.WriteLine();

            // get result and print it
            double[] result = DivArr(arr1, arr2);
            Print(result);

            Thread.Sleep(2000);
        }

        /// <summary>
        /// Prints an array
        /// </summary>
        /// <param name="result"></param>
        private static void Print(double[] result)
        {
            foreach (double item in result)
            {
                Console.Write($"{item} ");
            }
            Console.WriteLine();
        }

        /// <summary>
        /// Divide two arrays
        /// </summary>
        /// <param name="arr1"></param>
        /// <param name="arr2"></param>
        /// <returns></returns>
        private static double[] DivArr(double[] arr1, double[] arr2)
        {
            // inti result array
            double[] res = new double[arr1.Length > arr2.Length ? arr1.Length : arr2.Length];

            // divide arrays
            for (int i = 0; i < (arr1.Length > arr2.Length ? arr1.Length : arr2.Length); i++)
            {
                if (i < (arr1.Length < arr2.Length ? arr1.Length : arr2.Length))
                {
                    res[i] = arr1[i] / arr2[i];
                }
                else
                {
                    // if there is nothing to divide through output 0
                    res[i] = 0;
                }
            }

            return res;
        }

        #endregion

        #region Strings
        private static void HandleMenuB()
        {
            Console.Clear();
            Console.WriteLine("=== Anzahl der Gegenstände pro Woche ===\n");
;
            string path = @"U:\Y2\C#\dev\BerufsschuleY2\Xavons\BerufschuleY2\hofmann_ITL_MAK2\file.txt";
            FileInfo fInfo = new FileInfo(path);

            if (fInfo.Exists)
            {
                string fContent = ReadTextFile(fInfo);
                string subject = "INF";
                int subjectCount = 0;

                //using regex
                Regex SubReg = new Regex(subject);
                MatchCollection SubMatch = SubReg.Matches(fContent);
                subjectCount = SubMatch.Count;

                // using split and loop
                //string[] timetable = fContent.Split(':', ';', ' ');
                //foreach (string item in timetable)
                //{
                //    if (item == "INF")
                //    {
                //        subjectCount++;
                //    }
                //}

                Console.WriteLine($"This week you have {subjectCount} {subject} lessons.");
            }
            else
            {
                Console.ForegroundColor = ConsoleColor.Red;
                Console.WriteLine("You provided an invalid path.");
                Console.ResetColor();
            }

            Thread.Sleep(2000);
        }

        private static string ReadTextFile(FileInfo fInfo)
        {
            using (StreamReader sr = fInfo.OpenText())
            {
                return sr.ReadToEnd();
            }
        }
        #endregion

        #region Menu

        /// <summary>
        /// Prints the menu and asks for the action
        /// </summary>
        /// <returns></returns>
        private static char Menu()
        {
            Console.Clear();
            Console.Title = "2. ITL MAK";
            Console.WriteLine("[a] Dividiere zwei Arrays");
            Console.WriteLine("[b] Anzahl der Gegenstände pro Woche");
            Console.WriteLine("[c] Beenden\n\n");

            char action;
            do
            {
                Console.SetCursorPosition(0, Console.CursorTop - 1);
                ClearCurrentConsoleLine(0);
                Console.Write("Eingabe: ");
            } while (!char.TryParse(Console.ReadLine(), out action) || (action != 'a' && action != 'b' && action != 'c'));

            return action;
        }

        /// <summary>
        /// Clears the current console line.
        /// </summary>
        /// <param name="left"></param>
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
    }
}
