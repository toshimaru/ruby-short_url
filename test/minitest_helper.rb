require 'simplecov'
SimpleCov.start "test_frameworks" do
  add_group "Libraries", "lib"
end

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'ruby/short_url'

require "minitest/reporters"
Minitest::Reporters.use!
require 'minitest/autorun'
