#!/opt/local/bin/ruby -w
#
# Author: Jag Nandigam
# 
# Money class that defines + operation on Money objects and includes the Comparable module.
#
class Money
  
  include Comparable
  
  attr_accessor   :dollars, :cents
  
  # initialize object after creation
  def initialize(dollars=0, cents=0)
    @dollars = dollars
    @cents = cents
  end

  # returns a new Money object that is the sum of this Money object and other Money object
  def +(other)
    raise TypeError.new("Argument is not a Money object") unless other.instance_of?(Money)
    
    d = @dollars + other.dollars
    c = @cents + other.cents

    if c >= 100
      d = d + 1
      c = c % 100
    end
    
    Money.new(d,c)
  end   

  def totalCents
    @dollars * 100 + @cents
  end
  
  def <=>(other)
    raise TypeError.new("Argument is not a Money object") unless other.instance_of?(Money)
    totalCents <=> other.totalCents
  end
  
  def to_s
    '$' + @dollars.to_s + '.' + @cents.to_s
  end 
  
end

#
# Driver code
#
def main
  # create two money objects
  m1 = Money.new(10,50)
  m2 = Money.new(12,75)
      
  # add two money objects
  puts "#{m1} + #{m2} = #{m1 + m2}"

  # compare two money objects
  puts "#{m1} == #{m2}? " + (m1 == m2).to_s  
  puts "#{m1} != #{m2}? " + (m1 != m2).to_s
  puts "#{m1} < #{m2}? " + (m1 < m2).to_s
  puts "#{m1} <= #{m2}? " + (m1 <= m2).to_s
  puts "#{m1} > #{m2}? " + (m1 > m2).to_s
  puts "#{m1} >= #{m2}? " + (m1 >= m2).to_s
  
  # create two more money objects and test between? method
  m3 = Money.new(9,50)
  m4 = Money.new(12,0)
  puts "#{m1} between #{m3} and #{m4}? " + m1.between?(m3,m4).to_s
  puts "#{m2} between #{m3} and #{m4}? " + m2.between?(m3,m4).to_s
end

# call the main function
main()

