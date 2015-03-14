class Player
  @old_health
  @is_back_enemy_beated = false
  @is_forward_enemy_beated = false
  def play_turn(warrior)
    if warrior.feel(:backward).enemy? then
      warrior.attack! :backward
    elsif warrior.feel(:backward).captive? then
      if warrior.health < 20 then
        warrior.rest!
      elsif warrior.health == 20 && !@is_forward_enemy_beated then
        @is_back_enemy_beated = true
        warrior.walk!
      elsif ! warrior.look[1].enemy? && @is_forward_enemy_beated then
        warrior.rescue! :backward
      end
    elsif warrior.feel(:backward).empty? && !@is_back_enemy_beated then
      warrior.walk! :backward
    elsif warrior.feel.enemy? then
      warrior.attack!
    elsif !warrior.look[1].enemy? && warrior.health >= 20 &&
          @is_back_enemy_beated && !@is_forward_enemy_beated &&
          !warrior.feel.captive? then
        warrior.walk!
    elsif warrior.feel.captive? then
      warrior.rescue!
      @is_forward_enemy_beated = true
    elsif warrior.look[1].enemy? then
      warrior.shoot!
    elsif warrior.look[1].captive?  then
        warrior.walk!
    elsif @is_forward_enemy_beated && @is_back_enemy_beated &&
          warrior.health == 20 then
      warrior.walk! :backward
    else
      warrior.rest!
    end
    @old_health = warrior.health
  end

end
