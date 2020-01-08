#!/opt/local/bin/ruby -w
#
# Author: Jag Nandigam
#
# Singleton methods are methods that are defined for only a single object rather
# than a class of objects.
#
# Class methods are nothing more than singleton methods on the Class instance
# that represents that class.
#

class Point
  def initialize(x,y)
    @x = x
    @y = y
  end

  def to_s
    "(#{@x},#{@y})"
  end
end

def main
  p = Point.new(5,10)
  puts p

  q = Point.new(10,15)
  puts q

  # define a singleton method for object q
  def q.handle
    puts "I'm a singleton method"
  end

  q.handle

  # this line will cause runtime error if uncommented
  p.handle

end

# invoke main
main()
