using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SortAlgorithms
{
    class Program
    {
        static int quickCounter = 0;

        static void Main(string[] args)
        {
            Stopwatch sw = new Stopwatch();
            int[] numbers = CreateArray(1000, 1, 1000);

            Console.WriteLine("---- Unsorted");
            for (int i = 0; i < numbers.Length; i++)
            {
                Console.Write($"{numbers[i]} ");
            }

            #region Bubblesort
            sw.Restart();
            int countBubbleSort = BubbleSort(numbers);
            sw.Stop();

            Console.WriteLine("\n\n---- Bubblesort");
            for (int i = 0; i < numbers.Length; i++)
            {
                Console.Write($"{numbers[i]} ");
            }

            Console.WriteLine($"\n---- Runs Bubblesort: {countBubbleSort}");
            Console.WriteLine($"---- Time Bubblesort: {sw.Elapsed.TotalMilliseconds}ms");
            #endregion

            #region Quicksort
            sw.Restart();
            QuickSort(numbers, 0, numbers.Length - 1);
            sw.Stop();

            Console.WriteLine("\n---- Quicksort");
            for (int i = 0; i < numbers.Length; i++)
            {
                Console.Write($"{numbers[i]} ");
            }

            Console.WriteLine($"\n---- Runs Quicksort: {quickCounter}");
            Console.WriteLine($"---- Time Quicksort: {sw.Elapsed.TotalMilliseconds}ms");
            #endregion

            Console.ReadLine();
        }

        private static int[] CreateArray(int arrSize, int min, int max)
        {
            Random rand = new Random();

            int[] numbers = new int[arrSize];

            for (int i = 0; i < numbers.Length; i++)
            {
                numbers[i] = rand.Next(min, max);
            }

            return numbers;
        }

        // BubbleSort von geeksforgeeks.org
        static int BubbleSort(int[] arr)
        {
            int c = 0;
            int n = arr.Length;
            for (int i = 0; i < n - 1; i++)
            {
                for (int j = 0; j < n - i - 1; j++)
                {
                    c++;
                    if (arr[j] > arr[j + 1])
                    {
                        int temp = arr[j];
                        arr[j] = arr[j + 1];
                        arr[j + 1] = temp;
                    }
                }
            }
            return c;
        }

        // QuickSort und Partition von w3resource.com
        private static void QuickSort(int[] arr, int left, int right)
        {
            if (left < right)
            {
                quickCounter++;
                int pivot = Partition(arr, left, right);
                if (pivot > 1)
                {
                    QuickSort(arr, left, pivot - 1);
                }
                if (pivot + 1 < right)
                {
                    QuickSort(arr, pivot + 1, right);
                }
            }
        }

        private static int Partition(int[] arr, int left, int right)
        {
            int pivot = arr[left];
            while (true)
            {
                while (arr[left] < pivot)
                {
                    left++;
                }

                while (arr[right] > pivot)
                {
                    right--;
                }

                if (left < right)
                {
                    if (arr[left] == arr[right])
                    {
                        return right;
                    }

                    int temp = arr[left];
                    arr[left] = arr[right];
                    arr[right] = temp;
                }
                else
                {
                    return right;
                }
            }
        }
    }
}
