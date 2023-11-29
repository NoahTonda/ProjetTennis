using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProjetTennis.Models
{
    internal class Schedule
    {
        public int Id_Schedule { get; set; }
        public string Type { get; set; }
        public int ActualRound { get; set; }
        public Tournament Tournament { get; set; }
        public List<Match> Matches { get; set; }
    }
}
