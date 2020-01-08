#!/opt/local/bin/ruby -w
#
# Author: Jag Nandigam
#
# Example of inheritance in Ruby
#
# Methods are public unless they are explicitly declared to be private or protected.
#
# Instance and class variables are encapsulated and effectively private, and constants
# are effectively public.
#

class WorldGreeter
  def greet
    puts "#{greeting} #{who}"
  end
  
  def greeting
    "Hello"
  end
  
  def who
    "World"
  end
end

class SpanishWorldGreeter < WorldGreeter
  def greeting
    "Hola"
  end
end

def main
  w = WorldGreeter.new()
  s = SpanishWorldGreeter.new()
  
  w.greet()
  s.greet()
end

# invoke main
main()