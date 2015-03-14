class Player
  @old_health = nil

  def play_turn(warrior)
      if warrior.feel.wall? then
        if @old_health == nil ||
           @old_health != nil && @old_health > warrior.health && warrior.health > 10 &&
           warrior.feel(:backward).empty?
          then
          warrior.walk!(:backward)
        # 体力がMAXじゃなければ回復
        elsif warrior.health < 20 then
          warrior.rest!
        elsif warrior.health >= 20 then
          warrior.walk!(:backward)
        end
      else
        if warrior.health < 10 then
          warrior.walk!
        elsif warrior.health >=10 && warrior.feel(:backward).empty? then
          warrior.walk!(:backward)
        else
        warrior.attack!(:backward)
        end
      end

    @old_health = warrior.health
  end
end
