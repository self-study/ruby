class Player
  @old_health
  def play_turn(warrior)
    if warrior.feel.captive? then
      warrior.rescue!
    elsif warrior.look[1].enemy? then
      warrior.shoot!
    elsif warrior.look[1].captive? || warrior.health >= 21 || !warrior.look[1].enemy? then
        warrior.walk!
    end
    @old_health = warrior.health
  end
end
