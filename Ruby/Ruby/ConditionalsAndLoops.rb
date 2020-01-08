#!/opt/local/bin/ruby -w
#
# Author: Jag Nandigam
#
# Control (selection and looping) structures in Ruby
#
def main

  #
  # In Ruby, everything is an expression, even the control structures.
  #

  #
  # if, else, elsif
  #
  # The value that results from evaluating an if expression is the
  # value of the last expression in the code that was executed, or
  # nil if no block of code is executed.
  #
  
  x = 3

  if x == 1
    name = "one"
  elsif x == 2
    name = "two"
  elsif x == 3
    name = "three"
  elsif x == 4
    name = "four"
  else
    name = "many"
  end

  puts name

  # here is another way to write the above if expression

  if x == 1
    name = "one"
  elsif x == 2
    name = "two"
  elsif x == 3 then name = "three"
  elsif x == 4 ; name = "four"
  else
    name = "many"
  end

  puts name

  # here is another way to write the above if expression

  name = if x == 1 then "one"
    elsif x == 2 then "two"
    elsif x == 3 then "three"
    elsif x == 4 then "four"
    else "many"
  end

  puts name

  # for single-line conditionals: use "if" as a modifier
  y = x.odd? if x.respond_to?(:odd?)
  puts y
  
  #
  # unless is the opposite of if. unless executes code only if associated
  # expression evaluates to false or nil. elsif clauses are not allowed.
  #
  x = 10
  unless x == 0
    puts "x is not 0"
  else
    puts "x is 0"
  end
  
  # for single-line conditionals: use "unless" as a modifier
  s = x.to_s unless x.nil?
  puts s
  
  #
  # case statement is a multiway conditional. Like if, case returns a value
  #
  x = 5
  case x
    when 1
      name = "one"
    when 2
      name = "two"
    when 3
      name = "three"
    when 4
      name = "four"
    else  # optional
      name = "many"
  end
  puts name
  
  # since case returns a value, here is another way to write the above case
  name = case x
    when 1
      "one"
    when 2
      "two"
    when 3
      "three"
    when 4
      "four"
    else "many"
  end
  puts name
  
  #
  # Ruby has three looping statements: while, until, and for/in.
  #
  x = 10
  while x >= 0 do
    puts x
    x -= 1
  end
  puts
  
  # above code using until
  x = 10
  until x < 0 do
    puts x
    x -= 1
  end
  puts
  
  # while as a modifier
  x = 0
  puts x = x + 1 while x < 10
  puts
  
  # until as a modifier
  x = 0
  puts x = x + 1 until x == 10
  puts
  
  #
  # for/in loop is used to iterate through the elements of an enumerable object
  #
  for i in 1..10 do
    print i, " "
  end
  print "\n\n"
  
  # print elements in an array
  a = [5, 10, 15, 20, 25]
  for e in a do
    print e, " "
  end
  print "\n\n"
  
  # print keys and values in a hash
  h = {:a => 1, :b => 2, :c => 3}
  for key,value in h
    puts "#{key} => #{value}"
  end
  puts
  
end

# invoke main function
main()
