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
    internal class TeamsDAO
    {
        private string connectionString;
        public TeamsDAO()
        {
            connectionString = ConfigurationManager.ConnectionStrings["TennisProjet"].ConnectionString;
        }
        public List<Team> GetTeams()
        {
            List<Team> Teams = new List<Team>();
            using (SqlConnection connection = new SqlConnection(connectionString))
            {


                SqlCommand cmd = new SqlCommand("SELECT * " +
                   "FROM Team ", connection);

                connection.Open();
                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        Team Team = new Team();
                        Team.Opponent.Id_Opponent = reader.GetInt32("Id_Opponent");
                        Team.player.Id_Person = reader.GetInt32("Id_Person");
                      
                        Teams.Add(Team);
                    }
                }
            }

            return Teams;
        }
        /*   public bool InsertTeams(Teams p)
           {
               bool succes = false;

               using (SqlConnection connection = new SqlConnection(connectionString))
               {
                   SqlCommand cmd = new SqlCommand($"INSERT INTO dbo.Teamss(Lastname) VALUES(@Lastname)", connection);
                   cmd.Parameters.AddWithValue("Lastname", p.Lastname);
                   connection.Open();
                   int res = cmd.ExecuteNonQuery();
                   succes = res > 0;
               }
               return succes;
           }*/
    }
}
