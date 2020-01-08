#!/opt/local/bin/ruby -w
#
# Author: Jag Nandigam
#
# Inheritance and method visibility
#
# Methods may be declared public (default), protected, and private
#

#
# Example1 class with some public, protected, and private methods
#
class Example1
  
  def method1
    puts "method1() is a public method from Example1"
  end
  
  def method2
    puts "method2() is a public method from Example1"
  end
  
  protected  # all subsequent methods will have protected visibility

  def method3
    puts "method3() is a protected method from Example1"
  end
  
  def method4
    puts "method4() is a protected method from Example1"
  end
  
  private   # all subsequent methods will have private visibility
  
  def method5
    puts "method5() is a private method from Example1"
  end
  
  def method6
    puts "method6() is a private method from Example1"
  end
  
end

#
# Example2 class is a subclass of Example1
#
class Example2 < Example1
  
  # overrides method1 from Example1
  def method1
    puts "method1() is a public method from Example2"
  end
  
  # overrides method2 from Example1; also calls method2 from Example1
  def method2
    super
    puts "method2() is a public method from Example2"
  end
  
  def somemethod
    method3
    method4
  end
  
end

#
# main driver function
#
def main
  e1 = Example1.new()
  e1.method1()
  puts
  e1.method2()
  puts

  e2 = Example2.new()
  e2.method1()
  puts
  e2.method2()
  puts
  e2.somemethod()
end

# invoke main
main()
