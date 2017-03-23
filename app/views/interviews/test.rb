array = (1..10).to_a

array.each_with_index do |number, index|
  array.delete_at(index) if number.even?
  p array
  puts number
end
