#!/opt/local/bin/ruby -w
#
# Author: Jag Nandigam
#
# Demonstrates how to create and use a module
#
# module MyModule
#
module MyModule
  
  def helloworld(name)
    "Hello #{name}!"
  end
  
  def self.helloworld(name)
    "Hello #{name}!"
  end
  
  def random(low, high)
    rand(low..high)
  end
  
  def self.random(low, high)
    rand(low..high)
  end
    
  def foo
    "foo method of MyModule"
  end
  
end

#
# Class Test
#
class Test
  
  include MyModule
  
  def foo
    super + " and foo method of Test"
  end
  
end

#
# main function
#
def main
  t = Test.new
  puts t.helloworld("Jag")
  puts t.random(5,25)
  puts t.foo
  
  puts MyModule.helloworld("John")
  puts MyModule.random(10,20)
  
  #puts Test.helloworld("John")
  #puts Test.random(10,20)  
end

# invoke main
main

