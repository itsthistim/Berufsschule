using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MyDrawingClassFramework
{
    public abstract class MyShape
    {
        #region Members
        protected int x1;
        protected int x2;
        protected int y1;
        protected int y2;
        #endregion

        #region Constructors
        public MyShape(int x1, int x2, int y1, int y2)
        {
            X1 = x1;
            X2 = x2;
            Y1 = y1;
            Y2 = y2;
        }
        #endregion

        #region Properties
        public int X1
        {
            set
            {
                x1 = value < 0 || value > 200 ? 0 : value;
            }
            get { return x1; }
        }

        public int X2
        {
            set
            {
                x2 = value;
            }
            get { return x2; }
        }

        public int Y1
        {
            set { y1 = value; }
            get { return y1; }
        }

        public int Y2
        {
            set { y2 = value; }
            get { return y2; }
        }
        #endregion

        #region Methods
        public void Move(int dx, int dy)
        {
            X1 += dx;
            X2 += dx;
            Y1 += dy;
            Y2 += dy;
        }

        public virtual string Draw()
        {
            return $"({X1}|{Y1}) ({X2}|{Y2})";
        }
        #endregion

    }
}
