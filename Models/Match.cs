using ProjetTennis.DAO;
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
        public Referee Referee { get; set; }
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
            RefereeDAO refereeDAO = new RefereeDAO();
            int ScoreOp1=0,ScoreOp2=0;
            Sets set = new Sets { Match=this};
            List<Referee> referees = refereeDAO.GetReferees();
            CourtDAO courtDAO = new CourtDAO();
            List<Court> courts = courtDAO.GetCourts();
            foreach (Referee referee in referees)
            {
                if (referee.Available())
                {

                    Referee = referee;
                    Referee.IsAvailable = false;
                    refereeDAO.Update(Referee);

                    break;
                }
            }
        
            foreach (Court court in courts)
            {
                if (court.Available())
                {

                    Court = court;
                    Court.IsAvailable = false;
                    courtDAO.Update(Court);

                    break;
                }
            }
            
            
            if(Referee != null )
            {
                DateMatch = DateTime.Now;
                Console.WriteLine($"Arbitre : {Referee.Firstname} {Referee.Lastname}");
                Console.WriteLine($"Joueur 1 : {Opponent1.Player1.Firstname} {Opponent1.Player1.Lastname}");
                Console.WriteLine($"Joueur 2 : {Opponent2.Player1.Firstname} {Opponent2.Player1.Lastname}");
                Console.WriteLine($"Date : {DateMatch}");
                Console.WriteLine($"Round : {Round}");
                Console.WriteLine($"Court  : {Court.Id_Court}, Nombre de spectateurs : {Court.NbSpectators}");

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
                Duration = TimeSpan.FromMinutes((ScoreOp1 + ScoreOp2) *35);
                Console.WriteLine($"Score final : {ScoreOp1} - {ScoreOp2}");
                Console.WriteLine($"Vainqueur : {GetWinner(ScoreOp1,ScoreOp2).Player1.Firstname ?? "Aucun"}");
                Console.WriteLine($"Durée : {Duration}");
            }
            else
            {
                Console.WriteLine("aucun arbitre disponible");
            }
            Referee.IsAvailable = true;
            refereeDAO.Update(Referee);


        }

    }

}
