using ProjetTennis.Models;

List<Player> players = Player.GetPlayers();
foreach (Player p in players)
{
    Console.WriteLine(p);
}