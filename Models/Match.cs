using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProjetTennis.Models
{
    internal class Match
    {
        public int Id_Match { get; set; }
        public DateTime DateMatch { get; set; }
        public TimeSpan Duration { get; set; }
        public int Round { get; set; }
        public Person Referee { get; set; }
        public Court Court { get; set; }
        public Schedule Schedule { get; set; }
        public List<Play> Plays { get; set; }
        public List<Sets> Sets { get; set; }
    }
}
