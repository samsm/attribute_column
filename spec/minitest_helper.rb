require 'rubygems'
gem 'minitest' # ensures we're using the gem, and not the built in MT

$:.unshift File.dirname(__FILE__) + "/../lib"

require 'minitest/autorun'
require 'minitest/spec'
require 'minitest/mock'

require 'attribute_column'
