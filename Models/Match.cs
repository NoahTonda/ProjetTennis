using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProjetTennis.Models
{
    internal class Match
    {
        public int Id_Match { get; set; }
        public DateTime DateMatch { get; set; }
        public TimeSpan Duration { get; set; }
        public int Round { get; set; }
        public Person Referee { get; set; }
        public Court Court { get; set; }
        public Schedule Schedule { get; set; }
        public List<Sets> Sets { get; set; }
        public Opponent Opponent1 { get; set; }
        public Opponent Opponent2 { get; set; }
        public Opponent GetWinner(int Point1, int Point2)
        {
            
            if (Point1 < Point2)
            {
                return Opponent2;
            }
            else
            {
                return Opponent1;
            }
        }
        public void Play()
        {
            int ScoreOp1=0,ScoreOp2=0;
            Sets set = new Sets { Match=this};
            if (Round == 3)
            {
                do
                {
                    set.Play();
                    if (set.WinnerOpponent == Opponent1)
                    {
                        ScoreOp1++;
                    }
                    else
                    {
                        ScoreOp2++;
                    }
                    Console.WriteLine($"MATCH SCORE : {Opponent1.Player1.Firstname} {ScoreOp1} - {ScoreOp2} {Opponent2.Player1.Firstname}");

                    if (ScoreOp1 == 1 && ScoreOp2 == 1)
                    {
                        SuperTieBreak superTieBreak = new SuperTieBreak { Match=this};
                        if (superTieBreak.Play() == 1)
                        {
                            ScoreOp1++;
                        }
                        else
                        {
                            ScoreOp2++;
                        }
                        Console.WriteLine($"MATCH SCORE : {Opponent1.Player1.Firstname} {ScoreOp1} - {ScoreOp2} {Opponent2.Player1.Firstname}");
                    }
                } while (ScoreOp1 < 2 && ScoreOp2 < 2);
            }
            else
            {
                do
                {
                    set.Play();
                    if (set.WinnerOpponent == Opponent1)
                    {
                        ScoreOp1++;
                    }
                    else
                    {
                        ScoreOp2++;
                    }
                    Console.WriteLine($"MATCH SCORE : {Opponent1.Player1.Firstname} {ScoreOp1} - {ScoreOp2} {Opponent2.Player1.Firstname}");

                    if (ScoreOp1 == 2 && ScoreOp2 == 2)
                    {
                        SuperTieBreak superTieBreak = new SuperTieBreak {Match=this };
                        if (superTieBreak.Play() == 1)
                        {
                            ScoreOp1++;
                        }
                        else
                        {
                            ScoreOp2++;
                        }
                        Console.WriteLine($"MATCH SCORE : {Opponent1.Player1.Firstname} {ScoreOp1} - {ScoreOp2} {Opponent2.Player1.Firstname}");

                    }
                } while (ScoreOp1 < 3 && ScoreOp2 < 3);
            }
            Console.WriteLine($"Score final : {ScoreOp1} - {ScoreOp2}");
            Console.WriteLine($"Vainqueur : {GetWinner(ScoreOp1,ScoreOp2).Player1.Firstname ?? "Aucun"}");

        }

    }

}
