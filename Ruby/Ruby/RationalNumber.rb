#!/opt/local/bin/ruby -w
#
# Author: Jag Nandigam
#
# RationalNumber class represents a rational number and defines operations on
# rational numbers.
#
# NOTE: Ruby has a class called Rational in its core API.
#
class RationalNumber

  include Comparable

  attr_accessor   :numerator, :denominator

  def initialize(numerator=0, denominator=1)
    @numerator = numerator
    @denominator = denominator
    normalize
  end

  def +(other)
  	raise ArgumentError.new("Not a RationalNumber") unless other.class == RationalNumber
    num = @numerator * other.denominator + @denominator * other.numerator
    den = @denominator * other.denominator
    r = RationalNumber.new(num,den)
    r.normalize
    r
  end

  def -(other)
    num = @numerator * other.denominator - @denominator * other.numerator
    den = @denominator * other.denominator
    r = RationalNumber.new(num,den)
    r.normalize
    r
  end

  def *(other)
    num = @numerator * other.numerator
    den = @denominator * other.denominator
    r = RationalNumber.new(num,den)
    r.normalize
    r
  end

  def /(other)
    num = @numerator * other.denominator
    den = @denominator * other.numerator
    r = RationalNumber.new(num,den)
    r.normalize
    r
  end

  def <=>(other)
    if @numerator * other.denominator == @denominator * other.numerator
      0
    elsif @numerator * other.denominator < @denominator * other.numerator
      -1
    else
      1
    end
  end

  def to_s
    @numerator.to_s + '/' + @denominator.to_s
  end

  def normalize
    val = gcd(@numerator,@denominator)
    @numerator = @numerator / val
    @denominator = @denominator / val
    if @denominator < 0
      @numerator = -@numerator
      @denominator = -@denominator
    end
  end

  def gcd(a, b)
    if b == 0
      return a
    else
      return gcd(b, a % b)
    end
  end

  # make gcd a private method
  private :gcd

end

#
# driver code
#
def main
  choice = 'y'
  while choice == 'y'
    print "Enter two rational numbers: "

    # read a line and remove leading and trailing whitespace
    line = readline.strip!

    # extract the parts of the rational numbers entered matching a regular expression
    values = line.split(/\s+|\//)

    # create two rational objects
    r1 = RationalNumber.new(values[0].to_i,values[1].to_i)
    r2 = RationalNumber.new(values[2].to_i,values[3].to_i)

    # perform arithmeric operations and output results
    puts r1
    puts r2
    puts "#{r1} + #{r2} = #{r1 + r2}"
    puts "#{r1} - #{r2} = #{r1 - r2}"
    puts "#{r1} * #{r2} = #{r1 * r2}"
    puts "#{r1} / #{r2} = #{r1 / r2}"

    # perform relational operations and output results
    puts "#{r1} == #{r2} ==> #{r1 == r2}"
    puts "#{r1} != #{r2} ==> #{r1 != r2}"
    puts "#{r1} < #{r2} ==> #{r1 < r2}"
    puts "#{r1} <= #{r2} ==> #{r1 <= r2}"
    puts "#{r1} > #{r2} ==> #{r1 > r2}"
    puts "#{r1} >= #{r2} ==> #{r1 >= r2}"

    # got another set of inputs?
    print "Do you want to continue (y or n)? "
    choice = readline.chop!
  end
  puts "Bye for now!"

end

# call the main function
main()

=begin
begin
  r = RationalNumber.new(1,2)
  puts r + "John"
rescue ArgumentError => ex
  puts "Caught an exception: #{ex}"
end
=end
