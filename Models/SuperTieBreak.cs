using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProjetTennis.Models
{
    internal class SuperTieBreak : Sets
    {
        public int Play()
        {
            Console.WriteLine("SUPER TIE BREAK :");
            Random random = new Random();
            int PointOp1 = 0, PointOp2 = 0;
            int winningPlayer;


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
                Console.WriteLine($"SET SCORE : {Match.Opponent1.Player1.Firstname} {PointOp1} - {PointOp2} {Match.Opponent2.Player1.Firstname}");

            } while (!(PointOp1 >= 10 || PointOp2 >= 10) || (Math.Abs(PointOp1 - PointOp2) < 2));
            if(PointOp1 > PointOp2)
            {
                return 1;
            }
            else
            {
                return 2;
            }

        }
    }
}
