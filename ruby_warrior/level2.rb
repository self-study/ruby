class Player
  def play_turn(warrior)
    # cool code goes here
    if warrior.feel.empty? then
      warrior.walk!
    else 
      warrior.attack!
    end
  end
end
