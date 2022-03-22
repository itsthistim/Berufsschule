using MyDrawingClassFramework;
using MyDrawingLibFramework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OOP
{
    class Program
    {
        static void Main(string[] args)
        {
            //MyLine l1 = new MyLine();
            //l1.X1 = 20;
            //l1.Move(10, 20);
            //Console.WriteLine(l1.Draw());

            //MyLine l2 = new MyLine(150, 10, 1000, 1000);
            //Console.WriteLine(l2.Draw());

            //Console.WriteLine();

            //MyRectangle r1 = new MyRectangle(150, 100, 1000, 1000);
            //Console.WriteLine(r1.Draw());
            //Console.ReadLine();

            List<MyShape> shapes = new List<MyShape>();

            shapes.Add(new MyLine(150, 100, 1000, 1000));
            shapes.Add(new MyLine(150, 100, 2000, 2000));

            shapes.Add(new MyRectangle(150, 100, 1000, 1000));
            shapes.Add(new MyRectangle(150, 100, 2000, 2000));

            Print(shapes);
            Console.ReadLine();
        }

        private static void Print(List<MyShape> shapes)
        {
            foreach (MyShape shape in shapes)
            {
                Console.WriteLine(shape.Draw());
            }
        }
    }
}
