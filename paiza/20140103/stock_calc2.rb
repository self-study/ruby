total = 0
type_num_s = gets
type_num = type_num_s.to_i
count = 0
while count < type_num  do
  foo = gets
  hoge = foo.split.map(&:to_i)
  need_num = hoge[0] - hoge[1]
  if need_num > 0 then
    total += hoge[2] * need_num
  end
  count += 1
end

p total

