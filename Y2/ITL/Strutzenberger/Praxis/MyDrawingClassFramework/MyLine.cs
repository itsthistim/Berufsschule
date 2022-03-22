using MyDrawingClassFramework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MyDrawingLibFramework
{
    public class MyLine : MyShape
    {
        public MyLine() : base(0, 0, 0, 0) { } 

        public MyLine(int x1, int x2, int y1, int y2) : base(x1, x2, y1, y2) { }

        public override string Draw()
        {
            return $"Line: ({x1}|{y1}) ({x2}|{y2})";
        }
    }
}
