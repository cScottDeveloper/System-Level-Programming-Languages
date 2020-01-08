#!/opt/local/bin/ruby -w
#
# Author: Jag Nandigam
#
# Demonstrates how to turn blocks into objects and manipulated like any other Ruby objects
#     - can be assigned to a variable
#     - can be passed to methods
#     - can be returned as method return value
#
# A proc is an object representing a block. Procs have block-like behavior.
#
# A lambda is also an object representing a block. Lambdas have method-like behavior
#
# Both procs and lambdas are instance of class Proc class.
#

def main
  
  # create an object that represents a block
  p = Proc.new { |x,y| x + y }
  
  # what is p's type?
  puts p.class
  puts p.lambda?
    
  # execute the block represented by proc object
  sum = p.call(10,15)
  puts sum
  
  # send proc as an argument to a method
  somemethod1(p)
  
  # receive proc from a method
  result = somemethod2
  puts result.class
  puts result.call(10,15)
  
  # create a lambda that represents a block
  q = lambda { |x,y| x + y }
  puts q.class
  puts q.lambda?
  
  # execute the block represented by lambda
  puts q.call(10,20)
  
  # send lambda as an argument to a method
  somemethod1(q)
  
  # receive lambda from a method
  result = somemethod3
  puts result.class
  puts result.call(10,15)  
end

def somemethod1(value)
  puts value.call(20,30)
end

def somemethod2()
  Proc.new { |x,y| x * y }
end

def somemethod3()
  lambda { |x,y| x * y }
end

# invoke main
main()
