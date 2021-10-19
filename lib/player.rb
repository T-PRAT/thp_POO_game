class Player
	attr_accessor :name, :life_points
	def initialize(name)
		@name = name
		@life_points = 10
	end

	def show_state
		puts @name.bold + " a " + @life_points.to_s.yellow + " point de vie"
	end

	def gets_damage(nbr)
		@life_points -= nbr
	end

	def attacks(opp)
		puts @name.bold + " attaque " + opp.name.bold
		damage = throw_dice()
		opp.gets_damage(damage)
		puts "il lui inflige " + damage.to_s.yellow + " points de dommages"
		if opp.life_points <= 0
			puts "\n " + opp.name.bold + " a été tué !"
		end
	end

	private
	def throw_dice
		rand(1..6)
	end
end


class HumanPlayer < Player
	attr_accessor :weapon_level
	def initialize(name)
		@life_points = 100
		@weapon_level = 1
		@name = name
	end

	def show_state
		puts @name.bold + " a " + @life_points.to_s.yellow + " point de vie et une arme niveau " + @weapon_level.to_s.yellow
	end

	def search_weapon
		new_weapon_level = compute_damage
		puts "Tu as trouvé une arme de niveau " + new_weapon_level.to_s.yellow
		if new_weapon_level > @weapon_level
			@weapon_level = new_weapon_level
			puts "Youhou ! elle est meilleure que ton arme actuelle : " + "tu la prends.".bold
		else
			puts "M@*#$... elle n'est pas mieux que ton arme actuelle..."
		end
	end

	def search_health_pack
		health_pack_size = throw_dice()
		case health_pack_size
			when 1
				puts "Tu n'as rien trouvé..."
			when (5..2)
				@life_points += 50
				@life_points = 100 if @life_points > 100
				puts "Bravo, tu as trouvé un pack de +50 points de vie !"
			else
				@life_points += 80
				@life_points = 100 if @life_points > 100
				puts "Waow, tu as trouvé un pack de +80 points de vie !"
		end

	end

	private
	def compute_damage
		rand(1..6) * @weapon_level
	end

end
