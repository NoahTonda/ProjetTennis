﻿using System;
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

        
        public int TieBreak()
        {
            Console.WriteLine("TIE BREAK");
            Random random = new Random();
            ScoreOp1 = 0;
            ScoreOp2 = 0;
            int winningPlayer;

            do
            {
                winningPlayer = random.Next(0, 2);

                if (winningPlayer == 0)
                {
                    ScoreOp1++;
                }
                else
                {
                    ScoreOp2++;
                }
                Console.WriteLine($"SET SCORE : {Match.Opponent1.Player1.Firstname} {ScoreOp1} - {ScoreOp2} {Match.Opponent2.Player1.Firstname}");
            } while (!(ScoreOp1 >= 7 && Math.Abs(ScoreOp1 - ScoreOp2) >= 2) && !(ScoreOp2 >= 7 && Math.Abs(ScoreOp1 - ScoreOp2) >= 2));


            if (ScoreOp1 > ScoreOp2)
            {
                return 1;
            }
            else
            {
                return 2;
            }
        }
        public void Play()
        {
            Random random = new Random();
            int winningPlayer;
            ScoreOp1 = 0;
            ScoreOp2=0;
            do
            {
                winningPlayer = random.Next(0, 2);

                if (winningPlayer == 0)
                {
                    ScoreOp1++;
                }
                else
                {
                    ScoreOp2++;
                }
                Console.WriteLine($"SET SCORE : {Match.Opponent1.Player1.Firstname} {ScoreOp1} - {ScoreOp2} {Match.Opponent2.Player1.Firstname}");
                if (ScoreOp1 == 6 && ScoreOp2 == 6)
                {
                    if (TieBreak() == 1)
                    {
                        ScoreOp1++;
                    }
                    else
                    {
                        ScoreOp2++;
                    }
                    Console.WriteLine($"SET SCORE : {Match.Opponent1.Player1.Firstname} {ScoreOp1} - {ScoreOp2} {Match.Opponent2.Player1.Firstname}");
                }
                if ((ScoreOp1 == 6 || ScoreOp2 == 6) && Math.Abs(ScoreOp1 - ScoreOp2) >= 2)
                {
                    if (ScoreOp1 > ScoreOp2)
                    {
                        WinnerOpponent = Match.Opponent1;
                    }
                    else
                    {
                        WinnerOpponent=Match.Opponent2;
                    }
                    break;
                }
                else if (ScoreOp1 == 7 || ScoreOp2 == 7)
                {
                    if (ScoreOp1 > ScoreOp2)
                    {
                        WinnerOpponent = Match.Opponent1;
                    }
                    else
                    {
                        WinnerOpponent = Match.Opponent2;
                    }
                    break;
                }

            } while (true);
            if (ScoreOp1 > ScoreOp2)
            {
                ScoreOp1++;
            }
            else
            {
                ScoreOp2++;
            }

        }
    }
}





