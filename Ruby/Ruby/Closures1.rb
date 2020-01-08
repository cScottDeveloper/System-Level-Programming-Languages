#!/opt/local/bin/ruby -w
#
# Author: Jag Nandigam
#
# Demonstration of "closures" in Ruby.
#
# A closure refers to an object that is both an invocable function and a variable
# binding for that function.
#
# In Ruby, procs and lambdas are closures.
#
# It is important to understand that a closure does not just retain the value of the
# variables it refers to - it retains the actual variables and extends their lifetime.
# (see accessor_pair() below and its use in the main() function)
#

# multiply each element of the data array by n
def multiply(data, n)
  data.collect { |x| x * n }
end

# returns a lambda that retains or "closses over" the argument n
def multiplier(n)
  lambda { |data| data.collect { |x| x * n } }
end

# returns a pair of lambdas that share access to a local variable
def accessor_pair(initialvalue = nill)
  value = initialvalue
  getter = lambda { value }
  setter = lambda { |x| value = x }
  return getter,setter
end

def main
  # call multiply
  puts multiply([1,2,3], 2)
  puts
  
  # get a lambda that knows how to double and call it
  doubler = multiplier(2)
  puts doubler.call([1,2,3])
  puts
  
  # create accessor lambdas for initial value = 0
  getX, setX = accessor_pair(0)
  puts getX.call
  setX.call(10)
  puts getX.call
end

# invoke main
main()
