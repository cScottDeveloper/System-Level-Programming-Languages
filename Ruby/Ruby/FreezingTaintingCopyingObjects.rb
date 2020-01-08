#!/opt/local/bin/ruby -w
#
# Author: Jag Nandigam
#
# Demonstrates freezing, tainting, and copying (cloning and duplicating) objects.
#

def main
  #
  # Any object may be frozen by calling its freeze() method. A frozen object
  # becomes immutable. Once frozen, there is no way to "thaw" an object.
  #
  s = "ice"
  s.freeze
  puts s.frozen?
  #s.upcase!   # TypeError: can't modify frozen string; uncomment to test
  
  #
  # An object may be marked as tainted by calling its taint() method. Once an
  # object is tainted, any objects derived from it will also be tainted.
  # Copies of tainted objects made with clone() and dup() remain tainted.
  # A tainted object may be untainted with the untaint() method.
  #
  s = "untrusted"
  s.taint
  puts s.tainted?
  puts s.upcase.tainted?
  
  #
  # clone() and dup() return a shallow copy of the object on which they are invoked.
  # Classes can also override the clone and dup methods directly to produce
  # any kind of copy they desire.
  # clone() copies both the frozen and tainted state of an object, where as dup()
  # only copies the tainted state; calling dup on a frozen object returns
  # an unfrozen copy.
  #
  t = "test"
  t.taint
  t.freeze
  c = t.clone
  d = t.dup
  puts c.frozen?
  puts c.tainted?
  puts d.frozen?
  puts d.tainted?
end

# invoke main
main()
