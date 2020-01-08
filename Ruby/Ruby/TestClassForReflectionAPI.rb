#!/opt/local/bin/ruby -w
#
# Author: Jag Nandigam
#
# A test class used by Reflection.rb for demonstrating Ruby's Reflection API.
#
class TestClass
  
  include Comparable
  
  #  define two constants
  Constant1 = 100
  Constant2 = 12.75
  
  # define three class/static variables
  @@cvar1 = 10
  @@cvar2 = [10, 20]
  @@alphabet = {"A" => "Apple", "B" => "Boy"}
  
  # define a class/static method
  def TestClass.method1
    "Hello from class method TestClass.method1"
  end
  
  # define two public instance methods
  def method2
    "Hello from method2!!"
  end
  
  def method3
    "Hello from method3!!"
  end
  
  # define two protected instance  methods
  protected
  
  def method4
    "Hello from method4!!"
  end
  
  def method5
    "Hello from method5!!"
  end
  
  # define two private instance  methods
  private

  def method6
    "Hello from method6!!"
  end
  
  def method7
    "Hello from method7!!"
  end
  
end
