#!/opt/local/bin/ruby -w
#
# Author: Jag Nandigam
#
# More on "closures" in Ruby.
#

class SomeClass
  def initialize(value1)
    @value1 = value1
  end
 
  def value_printer(value2)
    lambda {puts "@value1: #{@value1}, value2: #{value2}"}
  end
end
 
def caller(some_closure)
  some_closure.call
end
 
some_class = SomeClass.new(5)

printer = some_class.value_printer("some value")

# some_class = nil

caller(printer)
