using System;

namespace ProjetTennis.Models
{
    internal class SuperTieBreak : Sets
    {
        public void Play()
        {
            Random random = new Random();
            int PointOp1 = 0, PointOp2 = 0;
            int hit = random.Next(0, 1);
            int winningPlayer = random.Next(0, 2);


            do
            {



                winningPlayer = random.Next(0, 2);

                if (winningPlayer == 0)
                {
                    PointOp1++;
                }
                else
                {
                    PointOp2++;
                }

            } while (!(PointOp1 >= 10 || PointOp2 >= 10) || (Math.Abs(PointOp1 - PointOp2) < 2));


        }



    }
}