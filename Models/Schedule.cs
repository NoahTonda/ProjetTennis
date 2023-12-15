using ProjetTennis.DAO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProjetTennis.Models
{
    internal class Schedule
    {
        public int Id_Schedule { get; set; }
        public enum Type { GentlemanSingle, LadiesSingle, GentlemanDouble,LadiesDouble,MixedDouble }
        public int ActualRound { get; set; }
        public Tournament Tournament { get; set; }
        public List<Match> Matches { get; set; }

        public void CreateMatch()
        {
            
            PlayerDAO playerDAO = new PlayerDAO();
            List<Player> players = playerDAO.GetPlayers64Male();
            Matches = new List<Match>();

            // Utilisez un objet Random pour générer des indices aléatoires
            Random random = new Random();

            // Mélangez la liste des joueurs de manière aléatoire
            players = players.OrderBy(x => random.Next()).ToList();

            // Assurez-vous qu'il y a au moins deux joueurs dans la liste
            if (players.Count < 2)
            {
                Console.WriteLine("Il n'y a pas suffisamment de joueurs pour jouer.");
                return;
            }

            // Parcourez la liste en prenant deux joueurs à la fois pour les faire jouer l'un contre l'autre
            for (int i = 0; i < players.Count; i += 2)
            {
                Opponent opponent1 = new Opponent();
                opponent1.Player1 = players[i];
                Opponent opponent2 = new Opponent();
                opponent2.Player1 = (i + 1 < players.Count) ? players[i + 1] : null;

                // Vérifiez si player2 est null (cas où il n'y a pas un nombre pair de joueurs)
                if (opponent2 != null)
                {
                    Match match = new Match(DateTime.Now,5, this,opponent1, opponent2);
                    Matches.Add(match);
                    // Faites jouer player1 contre player2
                    // Ajoutez ici le code pour simuler le match ou effectuer d'autres opérations nécessaires
                }
                else
                {
                    // Cas où le nombre de joueurs est impair, player1 joue seul
                    Console.WriteLine($"Player seul : {opponent1.Player1.Lastname}");
                    // Ajoutez ici le code pour simuler le match ou effectuer d'autres opérations nécessaires
                }
            }
            Console.WriteLine(Matches.Count);
            for (int i=0;i<Matches.Count;i++)
            {
                Matches[i].Play();
                Console.WriteLine(i);
            }
        }
    }
}
