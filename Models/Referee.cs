using ProjetTennis.DAO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;

namespace ProjetTennis.Models
{
    internal class Referee : Person
    {
        //public List<Match> Matches { get; set; }
        public bool IsAvailable { get; set; }
        public bool Available()
        {
            return IsAvailable;
        }
        public static List<Referee> GetReferee()
        {
            RefereeDAO dao = new RefereeDAO();
            return dao.GetReferees();
        }

        public override string ToString()
        {
            return $"{this.Firstname} {this.Lastname}, {this.Nationality}";
        }

    }
}
