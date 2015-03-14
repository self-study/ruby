class Player
  def play_turn(warrior)
    if warrior.feel.empty? then
      if warrior.health < 20 then
        warrior.rest!
      elsif
        warrior.walk!
      end
    else 
      warrior.attack!
    end
  end
end
