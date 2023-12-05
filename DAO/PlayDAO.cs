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
    internal class PlayDAO
    {

        private string connectionString;
        public PlayDAO()
        {
            connectionString = ConfigurationManager.ConnectionStrings["TennisProjet"].ConnectionString;
        }
        public List<Play> GetPlays()
        {
            List<Play> Plays = new List<Play>();
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("SELECT * " +
                           "FROM Play  " + connection);
                connection.Open();
                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        Play Play = new Play();
                        Play.Match.Id_Match = reader.GetInt32("Id_match");
                        Play.Opponent.Id_Opponent = reader.GetInt32("Id_Opponent");

                        Plays.Add(Play);
                    }
                }
            }

            return Plays;
        }
        /* public bool InsertPlay(Play p)
         {
             bool succes = false;

             using (SqlConnection connection = new SqlConnection(connectionString))
             {
                 SqlCommand cmd = new SqlCommand($"INSERT INTO dbo.Plays(Lastname) VALUES(@Lastname)", connection);
                 cmd.Parameters.AddWithValue("Lastname", p.Lastname);
                 connection.Open();
                 int res = cmd.ExecuteNonQuery();
                 succes = res > 0;
             }
             return succes;
         }
     }*/
    }
}
