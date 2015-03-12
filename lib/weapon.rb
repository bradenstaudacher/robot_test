require_relative "robot"

class Weapon < Item
  attr_accessor :damage
  def initialize(name, weight, damage)
    @name = name
    @weight = weight
    @damage = damage
  end
  def hit(robot)
    robot.wound(@damage)
  end
end