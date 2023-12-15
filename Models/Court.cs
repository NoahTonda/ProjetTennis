﻿using ProjetTennis.DAO;
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
        public bool IsAvailable { get; set; }
        public bool Available()
        {
            return IsAvailable;
        }
        public void Release()
        {
            IsAvailable = true;
            CourtDAO courtDAO = new CourtDAO();
            courtDAO.Update(this);
        }
        public static List<Court> GetCourts()
        {
            CourtDAO courtDAO = new CourtDAO();
            return courtDAO.GetCourts();
        }
        public Tournament Tournament { get; set; }
        public List<Match> Matches { get; set; }

        public override string ToString()
        {
            return $"id : {this.Id_Court}, spec : {this.NbSpectators}, covered : {this.Covered}, available: {this.IsAvailable}";
        }
    }
}
