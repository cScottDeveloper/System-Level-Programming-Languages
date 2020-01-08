#!/opt/local/bin/ruby -w
#
# Author: Jag Nandigam
#
# Demonstration of blocks in Ruby
#
class Test

  # instance method
  def hello
    puts("I will yield twice")
    yield
    yield
  end

  # class method
  def self.hello
    yield
    yield
    yield
    puts("I yielded three times")
  end

  def bye
    if block_given?
      yield
    else
      puts("Bye world!")
    end
  end

  # method generates values for math table - version 1
  def multtable_v1(n)
    for i in 1..10
      yield(n, n*i)
    end
  end

  # method generates values for math table - version 2
  def multtable_v2(n)
    1.upto(10) { |i| yield(n, n*i) }
  end

end

#
#  Driver code
#
def main
  t = Test.new()

  # call hello with a block
  t.hello { puts "Hi John!" }
  puts

  # call hello with a block using do/end format
  t.hello do
    puts "Hi John!\n"
  end
  puts

  # call class method with a block
  Test.hello { puts "Hi Kevin!" }
  puts

  # call class method with a block using do/end format
  Test.hello do
    puts "Hi Kevin!"
  end
  puts

  t.bye { puts "Bye John!" }
  puts

  t.bye
  puts

  t.multtable_v1(12) { |i, j| puts "#{i}  #{j}" }
  puts

  t.multtable_v2(12) { |i, j| puts "#{i}  #{j}" }

end

# call main function
main()
