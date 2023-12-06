using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProjetTennis.Models
{
    internal class Sets
    {
        public int Id_Set { get; set; }
        public int ScoreOp1 { get; set; }
        public int ScoreOp2 { get; set; }
        public Opponent WinnerOpponent { get; set; }
        public Match Match { get; set; }

        public void Play()
        {
            if (Match.Round == 3)
            {
                do
                {
                    SetCount();
                    if(ScoreOp1==1&&ScoreOp2==1)
                    {
                        SuperTieBreak superTieBreak = new SuperTieBreak { Match=Match };
                        if (superTieBreak.Play() == 1)
                        {
                            ScoreOp1++;
                        }
                        else
                        {
                            ScoreOp2++;
                        }
                    }
                } while (ScoreOp1 < 2 && ScoreOp2 < 2);
            }
            else
            {
                do
                {
                    SetCount();
                    if (ScoreOp1 == 2 && ScoreOp2 == 2)
                    {
                        SuperTieBreak superTieBreak = new SuperTieBreak { Match = Match };
                        if (superTieBreak.Play() == 1)
                        {
                            ScoreOp1++;
                        }
                        else
                        {
                            ScoreOp2++;
                        }
                    }
                } while (ScoreOp1 < 3 && ScoreOp2 < 3);
            }
            if (ScoreOp1 > ScoreOp2)
            {
                WinnerOpponent = Match.Opponent1;
            }
            else
            {
                WinnerOpponent = Match.Opponent2;
            }
        }
        public int TieBreak()
        {
            Console.WriteLine("TIE BREAK");
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
            } while (!(PointOp1 >= 7 || PointOp2 >= 7) || (Math.Abs(PointOp1 - PointOp2) < 2));

            if (PointOp1 > PointOp2)
            {
                return 1;
            }
            else
            {
                return 2;
            }
        }
        public void SetCount()
        {
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

                if (PointOp1==6&&PointOp2==6)
                {
                    if(TieBreak()==1)
                    {
                        PointOp1++;
                    }
                    else
                    {
                        PointOp2++;
                    }
                    Console.WriteLine($"SET SCORE : {Match.Opponent1.Player1.Firstname} {PointOp1} - {PointOp2} {Match.Opponent2.Player1.Firstname}");

                }

            } while (PointOp1 < 7 && PointOp2 < 7);
            if (PointOp1 > PointOp2)
            {
                ScoreOp1++;
            }
            else
            {
                ScoreOp2++;
            }
            Console.WriteLine($"MATCH SCORE : {Match.Opponent1.Player1.Firstname} {ScoreOp1} - {ScoreOp2} {Match.Opponent2.Player1.Firstname}");

        }
    }
}





