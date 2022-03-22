using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text.RegularExpressions;

namespace TextContentAnalyser
{
    internal class Program
    {
        private static void Main(string[] args)
        {
            //string path = @"C:\Tmp\file.txt";
            string path = @"D:\timho\Documents\Dev\Dev_BS\BerufschuleY2\TextContentAnalyser\TextContentAnalyserFile.txt";

            FileInfo fInfo = OpenFile(path);
            if (fInfo.Exists)
            {
                string fContent = ReadTextFile(fInfo);

                int lineCount = CountLines(fContent);
                int wordCount = CountWords(fContent);
                int letterCount = CountLetters(fContent);
                int[] punctuationMarks = CountPunctuationMarks(fContent);

                PrintResult(lineCount, wordCount, letterCount, punctuationMarks);
                PrintWordIndex(CountSameWords(fContent), CreateIndex(fContent));
            }
            else
            {
                Console.Clear();
                Console.ForegroundColor = ConsoleColor.Red;
                Console.WriteLine("You provided an invalid path.");
                Console.ResetColor();
            }

            Console.ReadLine();
        }

        private static void PrintWordIndex(Dictionary<string, int> sameWords, Dictionary<string, List<int>> index)
        {
            Console.WriteLine("\n======= Occurence =======");
            foreach (var pair in sameWords)
            {
                Console.WriteLine($"{pair.Key}: {pair.Value}");
            }

            Console.WriteLine("\n====== Line Number ======");
            foreach (var pair in index)
            {
                Console.Write($"{pair.Key}: ");
                foreach (int line in pair.Value)
                {
                    Console.Write($"{line} ");
                }

                Console.WriteLine();
            }
        }

        private static Dictionary<string, List<int>> CreateIndex(string fContent)
        {
            Dictionary<string, List<int>> words = new Dictionary<string, List<int>>();

            string[] lines = fContent.Split(new[] { "\r\n", "\r", "\n" }, StringSplitOptions.None);
            int currentLineNumber = 0;

            foreach (string line in lines)
            {
                string currentLine = line;
                currentLineNumber++;

                // remove special chars
                char[] charsToRemove = new char[] { ',', '.', '!', '?', '@', '-', '\'', '"' };
                foreach (char c in charsToRemove)
                {
                    currentLine = currentLine.Replace(c, ' ');
                }

                // remove double spaces
                while (currentLine.Contains("  "))
                {
                    currentLine = currentLine.Replace("  ", " ");
                }

                foreach (string word in currentLine.Split())
                {
                    if (!string.IsNullOrEmpty(word))
                    {
                        if (!words.ContainsKey(word))
                        {
                            words.Add(word, new List<int>());
                        }

                        words[word].Add(currentLineNumber);
                    }   
                }
            }

            return words;
        }

        private static Dictionary<string, int> CountSameWords(string fContent)
        {
            Dictionary<string, int> words = new Dictionary<string, int>();

            // remove newlines
            string stripped = fContent.Replace("\r\n", " ");

            // remove special chars
            char[] charsToRemove = new char[] { ',', '.', '!', '?', '@', '-', '\'', '"' };
            foreach (char c in charsToRemove)
            {
                stripped = stripped.Replace(c, ' ');
            }

            // remove double spaces
            while (stripped.Contains("  "))
            {
                stripped = stripped.Replace("  ", " ");
            }

            // fill into dictionary
            foreach (string word in stripped.Split())
            {
                if (!string.IsNullOrEmpty(word))
                {
                    if (words.ContainsKey(word))
                    {
                        words[word]++;
                    }
                    else
                    {
                        words.Add(word, 1);
                    }
                }
            }

            return words;
        }

        private static void PrintResult(int lineCount, int wordCount, int letterCount, int[] punctuationMarks)
        {
            Console.Clear();
            Console.WriteLine("===== Text Analyzer =====");
            Console.WriteLine($"{lineCount} Zeilen");
            Console.WriteLine($"{wordCount} Wörter");
            Console.WriteLine($"{letterCount} Buchstaben");
            Console.WriteLine($"{punctuationMarks[0]} Punkte und {punctuationMarks[1]} Beistriche");
        }

        private static int[] CountPunctuationMarks(string fContent)
        {
            //using regex
            Regex commaReg = new Regex(@",");
            MatchCollection commaMatches = commaReg.Matches(fContent.Trim());
            int commas = commaMatches.Count;

            Regex dotReg = new Regex(@"\.");
            MatchCollection dotMatches = dotReg.Matches(fContent.Trim());
            int dots = dotMatches.Count;

            // using string operation and lambda expression
            //int dots = fContent.Count(c => c == '.');
            //int commas = fContent.Count(c => c == ',');

            return new int[] { dots, commas };
        }

        private static int CountLetters(string fContent)
        {
            // using regex
            Regex reg = new Regex(@"[a-zA-Z]");
            MatchCollection matches = reg.Matches(fContent.Trim());
            return matches.Count;

            //using string operations
            //return fContent.Count(char.IsLetter);
        }

        private static int CountWords(string fContent)
        {
            // using regex
            //Regex reg = new Regex(@"[a-zA-Z]+");
            //MatchCollection matches = reg.Matches(fContent.Trim());
            //return matches.Count;

            // using loop
            if (!string.IsNullOrEmpty(fContent))
            {
                // remove newlines
                string stripped = fContent.Replace("\r\n", " ");

                ////remove double spaces
                while (stripped.Contains("  "))
                {
                    stripped = stripped.Replace("  ", " ");
                }

                // split and count
                return stripped.Split().Length;
            }
            else
            {
                return 0;
            }
        }

        private static int CountLines(string fContent)
        {
            // using regex
            Regex reg = new Regex(@"[\n]");
            MatchCollection matches = reg.Matches(fContent);
            return matches.Count + (string.IsNullOrEmpty(fContent) == true ? 0 : 1);

            // using loop
            //int counter;
            //if (string.IsNullOrEmpty(fContent))
            //{
            //    counter = 0;
            //}
            //else
            //{
            //    counter = 1;
            //    foreach (char item in fContent)
            //    {
            //        if (item == '\n')
            //        {
            //            counter++;
            //        }
            //    }
            //}
            //return counter;
        }

        private static string ReadTextFile(FileInfo fInfo)
        {
            using (StreamReader sr = fInfo.OpenText())
            {
                return sr.ReadToEnd();
            }
        }
        private static FileInfo OpenFile(string path)
        {
            return new FileInfo(path);
        }
    }
}