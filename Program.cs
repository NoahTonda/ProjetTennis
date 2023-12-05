using ProjetTennis.Models;

List<Referee> players = Referee.GetReferee();

foreach (Referee p in players)
{
    Console.WriteLine(p);
}