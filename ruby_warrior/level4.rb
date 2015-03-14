class Player
  @old_health
  def play_turn(warrior)
    
    if warrior.feel.empty? then
      if @old_health == nil ||
         @old_health != nil && @old_health > warrior.health
         then
        warrior.walk!
      # 体力がMAXじゃなければ回復
      elsif warrior.health < 20 then
        warrior.rest!
      elsif warrior.health >= 20 then
        warrior.walk!
      end
    else 
      warrior.attack!
    end
    @old_health = warrior.health
    
  end
end
