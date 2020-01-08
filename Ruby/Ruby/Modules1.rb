#!/opt/local/bin/ruby -w
#
# Author: Jag Nandigam
#
# Example: Demonstrates use of Comparable module
#
# The Comparable module/mixin is used by classes whose objects may be ordered.
# The class must define the <=> operator, which compares the receiver against
# another object, returning -1, 0, or +1 depending on whether the receiver
# is less than, equal to, or greater than the other object. If the other
# object is not comparable then the <=> operator should return nil.
# Comparable uses <=> to implement the conventional comparison operators
# (<, <=, ==, >=, and >) and the method between?. Ruby implements != operator
# as a negation of == operator.
#

class Student
  
  include Comparable
  
  attr_accessor :name, :gnumber
  
  def initialize(name, gnumber)
    if !name.instance_of?(String) ||  !gnumber.instance_of?(String)
      raise TypeError, "Argument(s) are not Strings"
    end
    @name = name
    @gnumber = gnumber
  end
  
  # define an ordering for Student objects basesd on their gnumber
  def <=>(other)
    return nil unless other.instance_of?(Student)
    self.gnumber <=> other.gnumber
  end
  
  def to_s
    "#{@name} #{@gnumber}"
  end
  
end

def main
  s1 = Student.new("John Lewis","G444444")
  s2 = Student.new("Peter DePasquale","G222222")
  s3 = Student.new("James Martin","G555555")
  
  puts s1 <=> s2
  puts s1 < s2
  puts s1 <= s2
  puts s1 == s2
  puts s1 != s2
  puts s1 > s2
  puts s1 >= s2
  puts s1.between?(s2,s3)
end

# invoke main method
main
