class Player
	attr_accessor :name, :life_points
	def initialize(name)
		@name = name
		@life_points = 10
	end

	def show_state()
		puts @name.bold + " a " + @life_points.to_s.yellow + " point de vie"
	end

	def gets_damage(nbr)
		@life_points -= nbr
	end

	def attacks(opp)
		puts @name.bold + " attaque #{opp.name}"
		damage = compute_damage()
		opp.gets_damage(damage)
		puts "il lui inflige " + damage.to_s.yellow + " points de dommages"
		if opp.life_points <= 0
			puts @name.bold + " a été tué !"
		end
	end

	private
	def compute_damage
		rand(1..6)
	end
end

