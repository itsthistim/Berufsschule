using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MyHelloWorld
{
    class Program
    {
        private static void Main(string[] args)
        {
            string path = @"D:\timho\Documents\Dev\Dev_BS\BerufschuleY2\TextContentAnalyser\TextContentAnalyserFile.txt";

            Console.Clear();
            foreach (var pair in WordCount(path))
            {
                Console.WriteLine(pair.Key + " = " + pair.Value);
            }

            foreach (var pair in CreateIndex(path))
            {
                Console.Write(pair.Key + ": Zeile(n) ");
                foreach (int line in pair.Value)
                {
                    Console.Write(line + " ");
                }

                Console.WriteLine();
            }
            Console.ReadLine();
        }

        private static Dictionary<string, int> WordCount(string path)
        {
            FileInfo f = new FileInfo(path);
            Dictionary<string, int> words = new Dictionary<string, int>();

            if (f.Exists)
            {
                StreamReader r = new StreamReader(f.OpenText().BaseStream, System.Text.Encoding.GetEncoding(1252));
                string line;

                do
                {
                    line = r.ReadLine();
                    if (line != null)
                    {
                        string[] arr = line.Split(new char[] { ' ', '.', ',' }, StringSplitOptions.RemoveEmptyEntries);

                        foreach (string str in arr)
                        {
                            if (words.ContainsKey(str))
                            {
                                words[str]++;
                            }
                            else
                            {
                                words.Add(str, 1);
                            }
                        }
                    }
                } while (line != null);

                r.Close();
            }

            return words;
        }

        private static Dictionary<string, List<int>> CreateIndex(string path)
        {
            Dictionary<string, List<int>> words = new Dictionary<string, List<int>>();
            FileInfo f = new FileInfo(path);

            if (f.Exists)
            {
                string lineContent;
                int lineNumber = 0;
                StreamReader r = new StreamReader(f.OpenText().BaseStream);

                do
                {
                    lineContent = r.ReadLine();
                    lineNumber++;

                    if (lineContent != null)
                    {
                        string[] wordsInLine = lineContent.Split(new char[] { '.', ',', ' ' });

                        foreach (string word in wordsInLine)
                        {
                            if (!words.ContainsKey(word))
                            {
                                words.Add(word, new List<int>());
                            }

                            words[word].Add(lineNumber);
                        }
                    }
                } while (lineContent != null);
                r.Close();
            }
            return words;
        }
    }
}
