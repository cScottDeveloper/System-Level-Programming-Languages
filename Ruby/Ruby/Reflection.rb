#!/opt/local/bin/ruby -w
#
# Author: Jag Nandigam
#
# Example to demonstrate Ruby's Reflection API
#

def test1()
  print "********* Output from test1() **********\n"
  
  filename = Dir.getwd + "/TestClassForReflectionAPI.rb"
  require(filename)
  
  types = [TestClass, Numeric, Integer, Fixnum, Bignum, Float, Complex, String, Range, 
            Array, Hash, NilClass, TrueClass, FalseClass, Kernel, Math, Comparable, Enumerable]
  
  types.each do |t|
    
    # output type name using the "name" method from the Module class
    puts "Type Name: #{t.name}"
    
    # output type's superclass, if t is an instanceof Class.
    # use "superclass" method from the Class class
    print "Superclass: "
    print "#{t.superclass}" if t.kind_of?(Class)
    print "\n"

    # output ancestors of this type
    # use the "ancestors" method from the Module class
    print "Ancestors: "
    t.ancestors.each { |m| print "#{m} "}
    print "\n"
    
    # output modules included in the type
    # use "included_modules" method from the Module class
    print "Included Modules: "
    t.included_modules.each { |m| print "#{m} "}
    print "\n"
    
    # output constants defined in the type.
    # use "constants" method from the Module class
    print "Constants: "
    t.constants.each { |c| print "#{c} "}
    print "\n"
    
    # output class variables defined in the type, if any
    # use "class_variables" method from the Module class
    print "Class Variables: "
    t.class_variables.each { |c| print "#{c} "}
    print "\n"
    
    # output class/static methods defined in the type
    # use "singleton_methods" method from the Object class
    print "Class Methods: "
    t.singleton_methods(false).each { |m| print "#{m} "}
    print "\n"
    
    # output public instance methods defined in the type
    # use "public_instance_methods" from the Module class
    print "Public instance methods: "
    t.public_instance_methods(false).each { |m| print "#{m} "}
    print "\n"
    
    # output protected instance methods defined in the type
    # use "protected_instance_methods" from the Module class
    print "Protected instance methods: "
    t.protected_instance_methods(false).each { |m| print "#{m} "}
    print "\n"
    
    # output private instance methods defined in the type
    # use "private_instance_methods" from the Module class
    print "Private instance methods: "
    t.private_instance_methods(false).each { |m| print "#{m} "}
    print "\n\n"
  end
  
end

def test2()
  print "********* Output from test2() **********\n"
  
  filename = Dir.getwd + "/TestClassForReflectionAPI.rb"
  require(filename)
  
	# use the "name" method from the Module class
	puts(TestClass.name)
	
	# use the "superclass" method from the Class class
	puts(TestClass.superclass)
	print("\n")
	
	# use the "ancestors" method from the Module class
	puts(TestClass.ancestors)
	print("\n")
	
	# use the "included_modules" method from the Module class
	puts(TestClass.included_modules)
	print("\n")
	
	# use the "constants" method from the the Module class
	puts(TestClass.constants(false))
	print("\n")
	
	# use the "class_variables" method from the Module class
	puts(TestClass.class_variables)
	print("\n")
	
	# "instance_methods" method from the Module class returns 
	# an array of public and protected instance methods
	puts(TestClass.instance_methods(false))
	print("\n")
	
	# "public_instance_methods" method from the Module class returns
	# an array of public instance methods
	puts(TestClass.public_instance_methods(false))
	print("\n")
	
	# "protected_instance_methods" method from the Module class returns
	# an array of protected instance methods
	puts(TestClass.protected_instance_methods(false))
	print("\n")
	
	# "private_instance_methods" method from the Module class returns
	# an array of private instance methods
	puts(TestClass.private_instance_methods(false))
	print("\n")
	
	# "singleton_methods" method from the Object class returns an array of class methods
	puts(TestClass.singleton_methods(false))
	print("\n")
	
	# use "method_defined?" method from the Module class to determine 
	# if a module or class defines the named public or protected method
	puts(TestClass.method_defined?(:method3))
	
	# use "public_method_defined?" method from the Module class to determine
	# if a module or class defines the named public method
	puts(TestClass.public_method_defined?(:method2))
	
	# use "protected_method_defined?" method from the Module class to determine
	# if a module or class defines the named protected method
	puts(TestClass.protected_method_defined?(:method4))
	
	# use "private_method_defined?" method from the Module class to determine
	# if a module or class defines the named private method
	puts(TestClass.private_method_defined?(:method6))
end

def test3()
  print "********* Output from test3() **********\n"
  
	before = Module.constants

	filename = Dir.getwd + "/TestClassForReflectionAPI.rb"
	require(filename)

	types = Module.constants - before
	
	types.each do |type|
		t = Module.const_get(type)
		puts(t.name)
		print("\n")
	
		puts(t.superclass)
		print("\n")
	
		puts(t.ancestors)
		print("\n")
	
		puts(t.included_modules)
		print("\n")
	
		puts(t.constants(false))
		print("\n")
	
		puts(t.class_variables)
		print("\n")
	
		puts(t.instance_methods(false))
		print("\n")
	
		puts(t.public_instance_methods(false))
		print("\n")
	
		puts(t.protected_instance_methods(false))
		print("\n")
	
		puts(t.private_instance_methods(false))
		print("\n")
	
		puts(t.singleton_methods(false))
		print("\n")
	end
end

def test4()
  print "********* Output from test4() **********\n"
  
  filename = Dir.getwd + "/TestClassForReflectionAPI.rb"
  require(filename)
  
	#invoking a class method TestClass.method1 using "send" method from Object class
	puts TestClass.send(:method1)
	
	#invoking a class method Math.log10(100) using "send" method from Object class
	puts Math.send(:log10, 100)
	
	#invoking an instance method upcase() using "send" method from Object class
	puts "hello".send(:upcase)
end

# main function
def main
  test1()
  
  #test2()
  
  #test3()
  
  #test4()
end

# invoke main function
main()

