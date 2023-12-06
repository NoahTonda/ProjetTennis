using ProjetTennis.Models;
using System;

namespace ProjetTennis.Test
{
    class Program
    {
        static void Main(string[] args)
        {
            // Création d'instances fictives pour le test
            Player player1Details = new Player ( 1, "Player One" );
            Player player2Details = new Player ( 2, "Player Two" );

            Opponent opponent = new Opponent
            {
                Id_Opponent = 1,
                Player1 = player1Details,
            };

            Match match = new Match
            {
                Id_Match = 1,
                DateMatch = DateTime.Now,
                Duration = TimeSpan.FromHours(2),
                Round = 3,
                Referee = new Person { /* Ajoutez les détails du référent ici */ },
                Court = new Court { /* Ajoutez les détails du court ici */ },
                Schedule = new Schedule { /* Ajoutez les détails de l'horaire ici */ },
                Opponent1 = opponent,
                Opponent2 = new Opponent { Id_Opponent = 2, Player1 = player2Details }
            };

            // Création d'une instance Sets pour le test
            Sets sets = new Sets { Match = match };

            // Logique du jeu
            Random random = new Random();
            sets.Play();
            Console.WriteLine($"Score final : {sets.ScoreOp1} - {sets.ScoreOp2}");
            Console.WriteLine($"Vainqueur : {sets.WinnerOpponent?.Player1.Firstname ?? "Aucun"}");

            Console.ReadLine(); // Pour maintenir la console ouverte pendant les tests
        }
    }
}

  
    