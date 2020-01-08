#!/opt/local/bin/ruby -w
#
# Author: Jag Nandigam
#

require "minitest/autorun"
require_relative "SimpleNumber.rb"
 
class TestSimpleNumberTest < Minitest::Test
 
  def test_simple
    assert_equal(4, SimpleNumber.new(2).add(2))
    assert_equal(6, SimpleNumber.new(2).multiply(3))
  end
 
end
