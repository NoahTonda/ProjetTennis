using ProjetTennis.DAO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProjetTennis.Models
{
    internal class Player : Person
    {
        public int Ranking { get; set; }
        public string Gender { get; set; }

        public List<Play> plays { get; set; }
      
        public static List<Player> GetPlayers()
        {
            PlayerDAO dao = new PlayerDAO();
            return dao.GetPlayers();
        }

        public override string ToString()
        {
            return $"{this.Firstname} {this.Lastname}, {this.Nationality}, {Gender},{Ranking}";
        }
    }
}
