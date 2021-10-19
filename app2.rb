require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "****************************************************\n*                  JEU DU POO                      *\n*                                                  *\n*               Régles : survivre                  *\n*                                                  *\n****************************************************\n".blue
print "Entrer votre pseudo :\n> "
player = HumanPlayer.new(gets.chomp)
enemies = [Player.new("José"), Player.new("Josiane")]

while player.life_points > 0 && (enemies[0].life_points > 0 || enemies[1].life_points > 0)
	puts "\nEtat du Joueur :".blue
	player.show_state
	puts "\nQuelle action veux-tu effectuer ?".red
	puts "	a - chercher une meilleure arme"
	puts "	s - chercher à se soigner"
	puts "	0 - attaquer " + enemies[0].name.bold + " qui a " + enemies[0].life_points.to_s.yellow + " points de vie"
	puts "	1 - attaquer " + enemies[1].name.bold + " qui a " + enemies[1].life_points.to_s.yellow + " points de vie"
	print "> "
	input = gets.chomp
	case input
		when "a"
			player.search_weapon
		when "s"
			player.search_health_pack
		when "0"
			player.attacks(enemies[0])
		when "1"
			player.attacks(enemies[1])
		else
			puts "Mauvaise entrer !"
			next
	end
	break if enemies[0].life_points <= 0 && enemies[1].life_points <= 0
	puts "\nLes autres joueurs t'attaquent !".blue
	enemies.each do |enemie|
		player.life_points > 0 ? enemie.attacks(player) : break
	end
end
