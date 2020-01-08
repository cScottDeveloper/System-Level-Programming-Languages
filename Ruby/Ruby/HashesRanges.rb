#!/opt/local/bin/ruby -w
#
# Author: Jag Nandigam
#
# Hash and Range data types in Ruby
#
def main

  # Hashes (also called maps or associative arrays) contain key, value pairs
  numbers = Hash.new

  numbers["one"] = 1
  numbers["two"] = 2
  numbers["three"] = 3
  puts numbers
  puts

  digits = {"one"=>1, "two"=>2, "three"=>3}
  puts digits
  puts

  digits.each { |key,value| puts "#{key}: #{value}" }
  puts

  da = digits.to_a
  puts da.to_s

  # Ranges in Ruby (.. for inclusive range)
  x = 1..10
  puts x.exclude_end?
  puts x.begin
  puts x.end
  puts x.first
  puts x.last
  puts x.min
  puts x.max
  puts x.cover?(5)
  puts x.cover?(15)
  puts x.include?(5)
  puts x.include?(15)
  puts x.member?(5)
  puts x.member?(15)
  x.each {|i| puts i}
  x.step(2) {|i| puts i}
  puts x.to_s
  puts x.to_a

  # Ranges in Ruby (... for exclusive range; end point is not part of the range)
  y = 1...10
  puts y.exclude_end?
  puts y.begin
  puts y.end
  puts y.first
  puts y.last
  puts y.min
  puts y.max
  puts y.cover?(5)
  puts y.cover?(10)
  puts y.include?(5)
  puts y.include?(10)
  puts y.member?(5)
  puts y.member?(10)
  y.each {|i| puts i}
  x.step(2) {|i| puts i}
  puts y.to_s
  puts y.to_a

end

# invoke main
main
