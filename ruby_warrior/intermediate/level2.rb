class Player
  def play_turn(warrior)
    if warrior.feel(warrior.direction_of_stairs).enemy? then
      warrior.attack! warrior.direction_of_stairs
    else
      warrior.walk!  warrior.direction_of_stairs
    end
  end
end
