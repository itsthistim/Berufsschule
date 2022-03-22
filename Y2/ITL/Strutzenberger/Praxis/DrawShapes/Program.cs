using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace DrawShapes
{
    class Program
    {
        static void Main(string[] args)
        {
            int left = 5;
            int top = 2;

            char action;
            do
            {
                Console.Clear();
                DrawMenu(left, top);
                action = Console.ReadKey().KeyChar;

                switch (action)
                {
                    case '1':
                        GetVLine(left, top);
                        break;
                    case '2':
                        GetHLine(left, top);
                        break;
                    case '3':
                        GetRectangle(left, top);
                        break;
                    case '4':
                        GetGrid(left, top);
                        break;
                    case '5':
                        break;
                    default:
                        Console.Clear();
                        if (left < 0 && left > Console.BufferWidth)
                        {
                            Console.WriteLine("Invalid \"left\" parameter.");
                        }
                        else if (top < 0 || top > Console.BufferHeight)
                        {
                            Console.WriteLine("Invalid \"top\" parameter.");
                        }
                        else
                        {
                            Console.SetCursorPosition(left, top++);
                            Console.WriteLine("Invalid input.");
                            Console.SetCursorPosition(left, top);
                            Console.WriteLine("Press any key to try again!");
                            Console.ReadLine();
                        }
                        break;
                }


            } while (action != '5');
        }

        #region Menu
        private static void DrawMenu(int left, int top)
        {
            if (left < 0 && left > Console.BufferWidth)
            {
                Console.WriteLine("Invalid \"left\" parameter.");
            }
            else if (top < 0 || top > Console.BufferHeight)
            {
                Console.WriteLine("Invalid \"top\" parameter.");
            }
            else
            {
                Console.Clear();
                Console.SetCursorPosition(left, top++);
                Console.Write("1) Draw vertical line");
                Console.SetCursorPosition(left, top++);
                Console.Write("2) Draw horizontal line");
                Console.SetCursorPosition(left, top++);
                Console.Write("3) Draw rectangle");
                Console.SetCursorPosition(left, top++);
                Console.Write("4) Draw grid");
                Console.SetCursorPosition(left, top);
                Console.Write("5) End the program");
            }
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

        private static void GetGrid(int left, int top)
        {
            Console.Clear();
            if (left < 0 && left > Console.BufferWidth)
            {
                Console.WriteLine("Invalid \"left\" parameter.");
            }
            else if (top < 0 || top > Console.BufferHeight)
            {
                Console.WriteLine("Invalid \"top\" parameter.");
            }
            else
            {
                string inputLeft;
                do
                {
                    Console.SetCursorPosition(left, top);
                    ClearCurrentConsoleLine(left);
                    Console.Write("Left Position: ");
                    inputLeft = Console.ReadLine();
                } while (!IsValidLeft(inputLeft));
                int posLeft = Convert.ToInt32(inputLeft);
                top++;

                string inputTop;
                do
                {
                    Console.SetCursorPosition(left, top);
                    ClearCurrentConsoleLine(left);
                    Console.Write("Top Position: ");
                    inputTop = Console.ReadLine();
                } while (!IsValidTop(inputTop));
                int posTop = Convert.ToInt32(inputTop);
                top++;

                string inputCellSize;
                do
                {
                    Console.SetCursorPosition(left, top);
                    ClearCurrentConsoleLine(left);
                    Console.Write("Size of cells: ");
                    inputCellSize = Console.ReadLine();
                } while (!IsValidCellSize(inputCellSize));
                int cellSize = Convert.ToInt32(inputCellSize);
                top++;

                string inputCollCount;
                do
                {
                    Console.SetCursorPosition(left, top);
                    ClearCurrentConsoleLine(left);
                    Console.Write("Amount of collumns: ");
                    inputCollCount = Console.ReadLine();
                } while (!IsValidAmountOfColls(inputCollCount));
                int nOfColls = Convert.ToInt32(inputCollCount);
                top++;

                string inputRowCount;
                do
                {
                    Console.SetCursorPosition(left, top);
                    ClearCurrentConsoleLine(left);
                    Console.Write("Amount of rows: ");
                    inputRowCount = Console.ReadLine();
                } while (!IsValidAmountOfRows(inputRowCount));
                int nOfRows = Convert.ToInt32(inputRowCount);

                Console.Clear();
                DrawGrid(posLeft, posTop, cellSize, nOfColls, nOfRows);
            }

            Thread.Sleep(2000);
        }

        private static void GetRectangle(int left, int top)
        {
            Console.Clear();
            if (left < 0 && left > Console.BufferWidth)
            {
                Console.WriteLine("Invalid \"left\" parameter.");
            }
            else if (top < 0 || top > Console.BufferHeight)
            {
                Console.WriteLine("Invalid \"top\" parameter.");
            }
            else
            {
                string inputLeft;
                do
                {
                    Console.SetCursorPosition(left, top);
                    ClearCurrentConsoleLine(left);
                    Console.Write("Left Position: ");
                    inputLeft = Console.ReadLine();
                } while (!IsValidLeft(inputLeft));
                int posLeft = Convert.ToInt32(inputLeft);
                top++;

                string inputTop;
                do
                {
                    Console.SetCursorPosition(left, top);
                    ClearCurrentConsoleLine(left);
                    Console.Write("Top Position: ");
                    inputTop = Console.ReadLine();
                } while (!IsValidTop(inputTop));
                int posTop = Convert.ToInt32(inputTop);
                top++;

                string inputHeight;
                do
                {
                    Console.SetCursorPosition(left, top);
                    ClearCurrentConsoleLine(left);
                    Console.Write("Height: ");
                    inputHeight = Console.ReadLine();
                } while (!IsValidHeight(inputHeight));
                int height = Convert.ToInt32(inputHeight);
                top++;

                string inputWidth;
                do
                {
                    Console.SetCursorPosition(left, top);
                    ClearCurrentConsoleLine(left);
                    Console.Write("Width: ");
                    inputWidth = Console.ReadLine();
                } while (!IsValidWidth(inputWidth));
                int width = Convert.ToInt32(inputWidth);

                Console.Clear();
                DrawRectangle(posLeft, posTop, height, width);
            }
            
            Thread.Sleep(2000);
        }

        private static void GetHLine(int left, int top)
        {
            Console.Clear();
            if (left < 0 && left > Console.BufferWidth)
            {
                Console.WriteLine("Invalid \"left\" parameter.");
            }
            else if (top < 0 || top > Console.BufferHeight)
            {
                Console.WriteLine("Invalid \"top\" parameter.");
            }
            else
            {
                string inputLeft;
                do
                {
                    Console.SetCursorPosition(left, top);
                    ClearCurrentConsoleLine(left);
                    Console.Write("Left Position: ");
                    inputLeft = Console.ReadLine();
                } while (!IsValidLeft(inputLeft));
                int posLeft = Convert.ToInt32(inputLeft);
                top++;

                string inputTop;
                do
                {
                    Console.SetCursorPosition(left, top);
                    ClearCurrentConsoleLine(left);
                    Console.Write("Top Position: ");
                    inputTop = Console.ReadLine();
                } while (!IsValidTop(inputTop));
                int posTop = Convert.ToInt32(inputTop);
                top++;

                string inputWidth;
                do
                {
                    Console.SetCursorPosition(left, top);
                    ClearCurrentConsoleLine(left);
                    Console.Write("Width: ");
                    inputWidth = Console.ReadLine();
                } while (!IsValidWidth(inputWidth));
                int width = Convert.ToInt32(inputWidth);

                Console.Clear();
                DrawHLine(posLeft, posTop, width);
            }
            
            Thread.Sleep(2000);
        }

        private static void GetVLine(int left, int top)
        {
            Console.Clear();
            if (left < 0 && left > Console.BufferWidth)
            {
                Console.WriteLine("Invalid \"left\" parameter.");
            }
            else if (top < 0 || top > Console.BufferHeight)
            {
                Console.WriteLine("Invalid \"top\" parameter.");
            }
            else
            {
                string inputLeft;
                do
                {
                    Console.SetCursorPosition(left, top);
                    ClearCurrentConsoleLine(left);
                    Console.Write("Left Position: ");
                    inputLeft = Console.ReadLine();
                } while (!IsValidLeft(inputLeft));
                int posLeft = Convert.ToInt32(inputLeft);
                top++;

                string inputTop;
                do
                {
                    Console.SetCursorPosition(left, top);
                    ClearCurrentConsoleLine(left);
                    Console.Write("Top Position: ");
                    inputTop = Console.ReadLine();
                } while (!IsValidTop(inputTop));
                int posTop = Convert.ToInt32(inputTop);
                top++;

                string inputHeight;
                do
                {
                    Console.SetCursorPosition(left, top);
                    ClearCurrentConsoleLine(left);
                    Console.Write("Height: ");
                    inputHeight = Console.ReadLine();

                } while (!IsValidHeight(inputHeight));
                int height = Convert.ToInt32(inputHeight);

                Console.Clear();
                DrawVLine(posLeft, posTop, height);
            }
            
            Thread.Sleep(2000);
        }
        #endregion

        #region Actions
        private static void DrawGrid(int left, int top, int cellSize, int nOfColls, int nOfRows)
        {
            int height = (nOfRows * 2) + 1;
            int width = (cellSize * nOfColls) + nOfColls + 1;

            DrawRectangle(left, top, height, width);

            int rowCounter = 2;
            for (int i = 0; i < nOfRows - 1; i++)
            {
                DrawRectangle(left, top, height - rowCounter, width);
                rowCounter += 2;
            }

            int collCounter = cellSize + 1;
            for (int i = 0; i < nOfColls - 1; i++)
            {
                DrawRectangle(left, top, height, width - collCounter);
                collCounter += cellSize + 1;
            }
        }

        private static void DrawRectangle(int left, int top, int height, int width)
        {
            DrawHLine(left, top, width);
            DrawVLine(left + width - 1, top, height - 1);
            DrawVLine(left, top, height - 1);
            DrawHLine(left, top + height - 1, width);
        }

        private static void DrawHLine(int left, int top, int width)
        {
            Console.SetCursorPosition(left, top++);

            for (int i = 0; i < width; i++)
            {
                Console.Write("*");
            }
        }

        private static void DrawVLine(int left, int top, int height)
        {
            for (int i = 0; i < height; i++)
            {
                Console.SetCursorPosition(left, top++);
                Console.Write("*");
            }
        }
        #endregion

        #region Validators
        private static bool IsValidAmountOfRows(string input)
        {
            if (int.TryParse(input, out int nOfRows))
            {
                if (nOfRows > 0)
                {
                    return true;
                }
            }

            return false;
        }

        private static bool IsValidAmountOfColls(string input)
        {
            if (int.TryParse(input, out int nOfColl))
            {
                if (nOfColl > 0)
                {
                    return true;
                }
            }

            return false;
        }

        private static bool IsValidCellSize(string input)
        {
            if (int.TryParse(input, out int cellSize))
            {
                if (cellSize > 0)
                {
                    return true;
                }
            }

            return false;
        }

        private static bool IsValidWidth(string input)
        {
            if (int.TryParse(input, out int width))
            {
                if (width > 0)
                {
                    return true;
                }
            }

            return false;
        }

        private static bool IsValidHeight(string input)
        {
            if (int.TryParse(input, out int height))
            {
                if (height > 0)
                {
                    return true;
                }
            }

            return false;
        }

        private static bool IsValidTop(string input)
        {
            if (int.TryParse(input, out int top))
            {
                if (top >= 0 && top <= Console.BufferHeight)
                {
                    return true;
                }
            }

            return false;
        }

        private static bool IsValidLeft(string input)
        {
            if (int.TryParse(input, out int left))
            {
                if (left >= 0 && left <= Console.BufferWidth)
                {
                    return true;
                }
            }

            return false;
        }
        #endregion
    }
}
