#!/opt/local/bin/ruby -w
#
# Author: Jag Nandigam
#
# Point class demonstrates the following in Ruby:
#
#   initialize an object
#   generating getter and setter methods
#   instance variables and methods
#   class variables and methods
#   defining operators
#   using modules to mixin methods
#   defining <=> method to include/mixin methods from Comparable module
#   defining each method to include/mixin methods from Enumerable module
#   use of blocks and yield statement
#   single line and block comments
#

class Point

  include Comparable, Enumerable

  # class variable
  @@count = 0

  # generate getter and setter methods for @x and @y
  attr_accessor :x, :y
  
  # initialize the newly created Point object
  def initialize(x,y)
    @x = x
    @y = y
    @@count += 1
  end

  # class method
  def Point.count
    @@count
  end

  # check if this Point object is equal to the other object
  def ==(other)
    if other.instance_of?(Point)
      self.x == other.x && self.y == other.y
    else
     false
    end
  end

  # implement general comparison operator (<=>) for use by methods in the Comparable module
  # get these operators free: <, <=, ==, >, >=, between? (!= implemented as negation of ==)
  def <=>(other)
    return nil unless other.instance_of?(Point)
    Math.sqrt(@x**2 + @y**2) <=> Math.sqrt(other.x**2 + other.y**2)
  end

  # returns string representation of this object
  def to_s
    "(#{@x},#{@y})"
  end

  def +(other)
    Point.new(@x + other.x, @y + other.y)
  end

  def *(scalar)
    Point.new(@x * scalar, @y * scalar)
  end

  # unary minus method
  def -@(other)
    Point.new(-@x,-@y)
  end

  def [](index)
    case index
    when 0, -2 then @x
    when :x, "x" then @x
    when 1, -1 then @y
    when :y, "y" then @y
    end
  end

  def []=(index,value)
    case index
    when 0, -2 then @x = value
    when :x, "x" then @x = value
    when 1, -1 then @y = value
    when :y, "y" then @y = value
    end
  end

  def each
    yield @x
    yield @y
  end

  def sum
    s = 0
    s += yield @x
    s += yield @y
    s
  end

end

# global function to drive the program
def main
  p = Point.new(5,10)
  q = Point.new(2,2)
  r = Point.new(1,0)
  
  puts p
  puts q
  puts r
  
  puts(p[0])
  puts(p[1])
  
  puts(p[-2])
  puts(p[-1])
    
  puts(p["x"])
  puts(p["y"])
    
  puts(p[:x])
  puts(p[:y])

  p["x"] = 15
  p["y"] = 20
  puts(p)
  
  puts(p.x())
  puts(p == q)
  puts(p < q)
  puts(p > q)

  p.each { |v| puts v }
  
  s = p.sum { |v| 2 * v }
  puts(s)

  puts (p == "junk")
  
  # here is a block comment
=begin
  s = p.sum do
    |v| 2 * v
  end
  puts(s)
=end

end

# invoke driver function
main

