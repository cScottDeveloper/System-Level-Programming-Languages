#!/opt/local/bin/ruby -w
#
# Author: Jag Nandigam
# 
# Demonstrates use of Comparable and Enumerable modules
#
# The Comparable mixin is used by classes whose objects may be ordered.
# The class must define the <=> operator, which compares the receiver against
# another object, returning -1, 0, or +1 depending on whether the receiver
# is less than, equal to, or greater than the other object. If the other
# object is not comparable then the <=> operator should return nil.
# Comparable uses <=> to implement the conventional comparison operators
# (<, <=, ==, >=, and >) and the method between?. Ruby implements != operator
# as a negation of == operator.
#
# The Enumerable mixin provides collection classes with several traversal
# and searching methods, and with the ability to sort. The class must provide
# a method each, which yields successive members of the collection.
# If Enumerable#max, min, or sort is used, the objects in the collection must
# also implement a meaningful <=> operator, as these methods rely on an ordering
# between members of the collection.
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

class StudentList
  
  include Enumerable
  
  def initialize
    @list = []
  end
  
  def add(student)
    if student.instance_of?(Student)
      @list << student
    end
  end
  
  def each
    @list.each {|s| yield s}
  end
  
end

def main
  students = StudentList.new()
  
  s1 = Student.new("John Lewis","G444444")
  s2 = Student.new("Peter DePasquale","G222222")
  s3 = Student.new("James Martin","G555555")
  s4 = Student.new("David Flanagan","G111111")
  s5 = Student.new("Michael Fitzgerald","G888888")
  s6 = Student.new("Yukihiro Matsumoto","G777777")
  students.add(s1)
  students.add(s2)
  students.add(s3)
  students.add(s4)
  students.add(s5)
  students.add(s6)
  
  students.each { |student| puts student }
  
  # use count method from Enumerable mixin
  puts students.count
  
  # use sort method form Enumerable mixin
  sortedlist = students.sort
  puts sortedlist
  
  # use min method form Enumerable mixin
  puts students.min
  
  # use max method form Enumerable mixin
  puts students.max
  
end

# invoke main function
main