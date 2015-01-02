length_and_num = gets.split.map(&:to_i)
length = length_and_num[0]
num = length_and_num[1]
scores = Array.new
count = 0
first_sum = 0
while count < num  do
  foo = gets
  foo = foo.strip
  scores << foo.to_i
  if count < length then
    first_sum += foo.to_i
  end
  count += 1
end


i = 0
max_sum = first_sum
while i < num - length do
  last_index  = i + length - 1
  if i == 0 then
    current_sum = first_sum + scores[last_index+1] - scores[i]
  else
    current_sum = current_sum + scores[last_index+1] - scores[i]
  end
  if current_sum > max_sum then
    max_sum = current_sum
  end
  i += 1
end

p max_sum
