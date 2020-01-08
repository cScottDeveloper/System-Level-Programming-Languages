#!/opt/local/bin/ruby -w
#
# Author: Jag Nandigam
#
# Your first class in Ruby
#
class Customer
  
  # attr_accessor :id, :name, :age		# creates getter and setter for instance variables
  										# with the same name
  										
  # attr_reader :id, :name, :age		# creates getter methods for instance variables
  										# with the same name
  										
  											
  # attr_writer :id, :name, :age		# creates setter methods for instance variables
  										# with the same name

  def initialize(name, age=0, id="TBD")
    @name = name
    @age = age
    @id = id
  end
  
  def name
    @name
  end
  
  def name=(value)
    @name = value
  end
  
  def age
    @age
  end
  
  def age=(value)
    @age = value
  end
  
  def id
    @id
  end
  
  def id=(value)
    @id = value
  end

  def to_s
    "#{@name} #{@age} #{@id}"
  end
 
end

def main
	c1 = Customer.new("John",35,"1234")
	puts c1

	c2 = Customer.new("Kevin")
	puts c2

  c3 = Customer.new("James",20)
  puts c3
   
	c1.name= "Alex"
	c1.age= 20
	c1.id= "C456"
	
	puts(c1.name)
	puts(c1.age)
	puts(c1.id)
end

# invoke main function
main()

