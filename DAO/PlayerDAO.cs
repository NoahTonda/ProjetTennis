using ProjetTennis.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProjetTennis.DAO
{
    internal class PlayerDAO
    {
        private string connectionString;
        public PlayerDAO()
        {
            connectionString = ConfigurationManager.ConnectionStrings["TennisProjet"].ConnectionString;
        }
        public List<Player> GetPlayers()
        {
            List<Player> Players = new List<Player>();
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("SELECT P.Id_Person, P.firstname, P.lastname, PL.ranking, PL.gender " +
                           "FROM Person P " +
                           "JOIN Player PL ON P.Id_Person = PL.Id_Person", connection);
                connection.Open();
                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        Player player = new Player();
                        player.Id_Person = reader.GetInt32("id_person");
                        player.Gender = reader.GetString("Gender");
                        player.Ranking = reader.GetInt32("Ranking");
                        player.Firstname = reader.GetString("Firstname");
                        player.Lastname = reader.GetString("Lastname");
                        Players.Add(player);
                    }
                }
            }

            return Players;
        }
        public bool InsertPlayer(Player p)
        {
            bool succes = false;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand($"INSERT INTO dbo.Players(Lastname) VALUES(@Lastname)", connection);
                cmd.Parameters.AddWithValue("Lastname", p.Lastname);
                connection.Open();
                int res = cmd.ExecuteNonQuery();
                succes = res > 0;
            }
            return succes;
        }
    }
}
