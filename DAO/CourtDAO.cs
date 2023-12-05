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
    internal class CourtDAO
    {

        private string connectionString;
        public CourtDAO()
        {
            connectionString = ConfigurationManager.ConnectionStrings["TennisProjet"].ConnectionString;
        }
        public List<Court> GetCourts()
        {
            List<Court> Courts = new List<Court>();
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("SELECT * " +
                           "FROM Court  " + connection);
                connection.Open();
                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        Court Court = new Court();
                        Court.Id_Court = reader.GetInt32("Id_court");
                        Court.NbSpectators = reader.GetInt32("nbSpectators");
                        Court.Covered = reader.GetBoolean("covered");
                        Court.Tournament.Id_Tournament = reader.GetInt32("Id_Tournament");
                        
                        Courts.Add(Court);
                    }
                }
            }

            return Courts;
        }
       /* public bool InsertCourt(Court p)
        {
            bool succes = false;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand($"INSERT INTO dbo.Courts(Lastname) VALUES(@Lastname)", connection);
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
