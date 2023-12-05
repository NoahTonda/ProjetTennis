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
    internal class RefereeDAO
    {
        private string connectionString;
        public RefereeDAO()
        {
            connectionString = ConfigurationManager.ConnectionStrings["TennisProjet"].ConnectionString;
        }
        public List<Referee> GetReferees()
        {
            List<Referee> Referees = new List<Referee>();
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
             

                SqlCommand cmd = new SqlCommand("SELECT P.Id_Person, P.firstname, P.lastname, P.nationality " +
                   "FROM Person P " + "JOIN Referee R ON P.Id_Person = R.Id_Person", connection);

                connection.Open();
                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        Referee referee = new Referee();
                        referee.Id_Person = reader.GetInt32("id_person");
                        referee.Firstname = reader.GetString("Firstname");
                        referee.Lastname = reader.GetString("Lastname");
                        referee.Nationality = reader.GetString("Nationality");
                        Referees.Add(referee);
                    }
                }
            }

            return Referees;
        }
     /*   public bool InsertReferee(Referee p)
        {
            bool succes = false;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand($"INSERT INTO dbo.Referees(Lastname) VALUES(@Lastname)", connection);
                cmd.Parameters.AddWithValue("Lastname", p.Lastname);
                connection.Open();
                int res = cmd.ExecuteNonQuery();
                succes = res > 0;
            }
            return succes;
        }*/
    }
}
