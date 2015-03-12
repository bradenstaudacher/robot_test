require_relative "robot"

class BoxOfBolts < Item
  def initialize
    @name = "Box of bolts"
    @weight = 25
    @heal = 20
  end
  def feed(robot)
    robot.heal(@heal)
  end

end