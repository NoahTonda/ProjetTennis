using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProjetTennis.Models
{
    internal class Sets
    {
        public int Id_Set { get; set; }
        public int ScoreOp1 { get; set; }
        public int ScoreOp2 { get; set; }
        public Opponent WinnerOpponent { get; set; }
        public Match Match { get; set; }
    }
}
