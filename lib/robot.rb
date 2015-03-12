require "pry"
require_relative "item"
require_relative "weapon"

class Robot
  attr_accessor :position, :items, :capacity, :health, :attack, :equipped_weapon
  def initialize
    @position = [0,0]
    @items = []
    @capacity = 250
    @health = 100
    @attack = 5
    @equipped_weapon = nil
  end
  def move_left
     @position[0] -= 1
  end
  def move_right
    @position[0] += 1
  end
  def move_up
    @position[1] += 1
  end
  def move_down
    @position[1] -= 1
  end
  def items
    @items
  end
  def pick_up(item)
    if weight_okay?(item)
      if picked_up_weapon?(item)
        @equipped_weapon = item
      else
        @items << item
      end
    end
  end
  def items_weight
    totalweight = 0
    @items.each do |item|
      totalweight += item.weight 
    end
    return totalweight
  end

  def health
    @health
  end

  def weight_okay?(item)
    (items_weight + item.weight) <= @capacity
  end

  def picked_up_weapon?(item)
    if item.is_a? Weapon
      true
    end
  end

  def wound(amount)
    @health -= amount
    if @health < 0
      @health = 0
    end
  end

  def heal(amount)
    @health += amount
    if @health > 100
      @health = 100
    end
  end

  def attack(enemy)
    if self.equipped_weapon == nil
      enemy.wound(@attack)
    else
      @equipped_weapon.hit(enemy)
    end
  end

  def equipped_weapon
    @equipped_weapon
  end

end



