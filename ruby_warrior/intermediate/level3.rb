class Player
  @is_forward_bind
  @is_right_bind
  @is_left_bind
  @is_back_bind
  @is_all_bind
  @is_rescue
  def play_turn(warrior)
    if @is_all_bind then
      if warrior.feel(:right).captive? then
        warrior.rescue! :right
        @is_rescue = true
      elsif warrior.feel(warrior.direction_of_stairs).captive? then
        warrior.rescue! warrior.direction_of_stairs
      elsif warrior.feel(warrior.direction_of_stairs).enemy? then
        warrior.attack! warrior.direction_of_stairs
      else
        warrior.walk!  warrior.direction_of_stairs
      end
    else
      if !@is_forward_bind then
        warrior.bind! :forward
        @is_forward_bind = true
      elsif !@is_back_bind then
        warrior.bind! :backward
        @is_back_bind = true
      elsif !@is_left_bind then
        warrior.bind! :left
        @is_left_bind = true
      elsif @is_forward_bind && @is_back_bind && @is_left_bind then
        @is_all_bind = true
      end
    end
  end

end
