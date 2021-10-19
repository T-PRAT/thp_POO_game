require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

player1 = Player.new("Josiane")
player2 = Player.new("José")

puts "\nDébut du combat entre ".yellow + player1.name.blue + " et ".yellow + player2.name.red + " !\n\n"
while player1.life_points >= 0 && player2.life_points >= 0  do
	puts "Voici l'état de chaque joueur :".blue
	player1.show_state
	player2.show_state
	puts "\nPassons à la phase d'attaque :".red
	player1.attacks(player2)
	break unless player2.life_points > 0
	player2.attacks(player1)
	puts if player1.life_points >= 0 && player2.life_points >= 0
end



