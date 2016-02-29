class Person
  def initialize name
    @first_name = name[:first_name]
    @last_name  = name[:last_name]
    @full_name  = "#{@first_name} #{@last_name}"
  end
end

class Player < Person
  def initialize name, health=20, strength=5, alive=true
    super(name)
    @health   = health
    @strength = strength
    @alive    = alive
  end

  def take_damage attack_strength
    @health -= attack_strength
    if @health <= 0
      @alive = false
    end
  end

  def attack player
    player.take_damage @strength
  end
end

class Knight < Player
  def initialize name, health=50, strength=7
    super(name, health, strength)
  end
end

class Wizard < Player
  def initialize name, health=20, strength=75
    super(name, health, strength)
  end
end

puts "Test characters"
p knight1 = Knight.new({first_name: "Denis", last_name: "Cheung"}, 60, 8)
p knight2 = Knight.new({first_name: "Willie", last_name: "Tong"}, 70, 9)
p wizard1 = Wizard.new({first_name: "Stephanie", last_name: "Martin"})
# p wizard1 = Wizard.new

army1 = [knight1, knight2]
army2 = [wizard1]

def battle
  if army1.each{ @alive !== true }

