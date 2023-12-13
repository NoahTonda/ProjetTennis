using ProjetTennis.DAO;
using ProjetTennis.Models;
using System;

namespace ProjetTennis.Test
{
    class Program
    {
        static void Main(string[] args)
        {
            // Création d'instances fictives pour le test
            Player player1Details = new Player(1, "Player One");
            Player player2Details = new Player(2, "Player Two");

            Opponent opponent = new Opponent
            {
                Id_Opponent = 1,
                Player1 = player1Details,
            };

            Match match = new Match
            {
                Id_Match = 1,
                DateMatch = DateTime.Now,
                Round = 3,
                Schedule = new Schedule { /* Ajoutez les détails de l'horaire ici */ },
                Opponent1 = opponent,
                Opponent2 = new Opponent { Id_Opponent = 2, Player1 = player2Details }
            };


            match.Play();
            match.Play();


            Console.ReadLine(); // Pour maintenir la console ouverte pendant les tests

        }
    }
}

  
    