total = 0
type_num_s = gets
type_num = type_num_s.to_i
count = 0
while count < type_num  do
  foo = gets
  foo = foo.strip
  foo_i = foo.to_i
  total += foo_i
  count += 1
end

p total
