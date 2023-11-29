using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProjetTennis.Models
{
    internal class Court
    {
        public int Id_Court { get; set; }
        public int NbSpectators { get; set; }
        public bool Covered { get; set; }
        public Tournament Tournament { get; set; }
        public List<Match> Matches { get; set; }
    }
}
