#!/opt/local/bin/ruby -w
#
# Author: Jag Nandigam
#
# Demonstrates arrays in Ruby
#
def main

  a = []    # empty array has size 0
  puts a.size()

  b = [5, 10.25, "John", 'Jacob', true, false, nil, 345768906546897809875654436859966000696912345]
  puts b.size()
  puts  # blank line

  puts "#{b[0]} is a #{b[0].class}"
  puts "#{b[1]} is a #{b[1].class}"
  puts "#{b[2]} is a #{b[2].class}"
  puts "#{b[3]} is a #{b[3].class}"
  puts "#{b[4]} is a #{b[4].class}"
  puts "#{b[5]} is a #{b[5].class}"
  puts "#{b[6]} is a #{b[6].class}"
  puts "#{b[7]} is a #{b[7].class}"
  puts

  # negative index values count from the end of the array
  puts "#{b[-8]} is a #{b[-8].class}"
  puts "#{b[-7]} is a #{b[-7].class}"
  puts "#{b[-6]} is a #{b[-6].class}"
  puts "#{b[-5]} is a #{b[-5].class}"
  puts "#{b[-4]} is a #{b[-4].class}"
  puts "#{b[-3]} is a #{b[-3].class}"
  puts "#{b[-2]} is a #{b[-2].class}"
  puts "#{b[-1]} is a #{b[-1].class}"
  puts

  # creating an array using Array class
  c = Array.new(5, 10)
  for element in c
    puts element
  end
  puts    

  c = Array.new(10) { |i| i * 5 }
  puts c
  puts

  # retrieving subarray with a range
  d = c[5..9]
  puts d
  puts

  a = [1, 2, 3, 4, 5]
  b = [3, 4, 5]

  # + to concatenate 2 arrays
  c = a + b
  puts c
  puts

  # - to subtract one array from another
  c = a - b
  puts c
  puts

  # | to take union of two arrays
  c = a | b
  puts c
  puts

  # & to take intersection of two arrays
  c = a & b
  puts c
  puts

  # << to append to the end of an array
  c = [1, 2, 3, 4, 5]
  c << 10
  c[10] = 50
  puts c.size()
  puts c
  puts
  
  # each iterator to loop through array elements
  # call to each() method is associated with a block
  c.each {|x| print x.to_s + ' '}
  puts
  
  # each iterator to loop through array elements
  # call to each() method is associated with a block (do/end format)
  c.each do |x|
    print x.to_s + ' '
  end
  puts
  
end

# invoke main
main
