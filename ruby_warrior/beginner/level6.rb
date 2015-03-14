class Player
  @old_health
  @is_edge
  def play_turn(warrior)
    if ! @is_edge || 10 > warrior.health then
      if warrior.feel(:backward).empty? then
        if @old_health == nil ||
           @old_health != nil && @old_health > warrior.health
          then
          warrior.walk!(:backward)
        # 体力がMAXじゃなければ回復
        elsif warrior.health < 20 then
          warrior.rest!
        elsif warrior.health >= 20 then
          warrior.walk!(:backward)
        end
      elsif warrior.feel(:backward).captive? then
        warrior.rescue!(:backward)
      elsif warrior.feel(:backward).empty? == false then
        @is_edge = true
      else
        warrior.attack!
      end
    else
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
      elsif warrior.feel.captive? then
        warrior.rescue!
      else
        warrior.attack!
      end
    end
    @old_health = warrior.health
  end
end
