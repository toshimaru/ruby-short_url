$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'ruby/short_url'

require "minitest/reporters"
Minitest::Reporters.use!

require 'minitest/autorun'
