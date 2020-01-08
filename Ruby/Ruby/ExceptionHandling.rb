#!/opt/local/bin/ruby -w
#
# Author: Jag Nandigam
#
# Demonstration of exception handling in Ruby
#
class Account

  attr_accessor   :id, :balance
  
  def initialize(id, balance)
    @id = id
    @balance = balance
  end
  
  def deposit(amount)
    if amount.kind_of?(Numeric) && amount > 0
      @balance += amount
    end
  end
  
  def withdraw(amount)
    if amount.kind_of?(Numeric) && amount > 0
        raise InsufficientFundsException.new("Not enough funds to withdraw.") unless amount <= @balance
        @balance -= amount
    end
  end
  
  def to_s
    id.to_s + " " + balance.to_s
  end

end

# custom exception class
class InsufficientFundsException < Exception
  def initialize(msg)
    super msg
  end
end

#
# Driver code
#
def main
  act = Account.new(12345,150)
  puts act
  
  act.deposit(25)
  act.deposit(15.50)
  act.withdraw(50)
  puts act

  # handling exceptions
  begin   # similar to "try" in Java
    act.withdraw(200)
  rescue InsufficientFundsException => exp    # similar to "catch" in Java
    puts exp
  ensure    # similar to "finally" in Java
    puts "Done with the exception block."
  end
  
end

# call main method
main
