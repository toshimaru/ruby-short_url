# frozen_string_literal: true

require 'simplecov'
SimpleCov.start

$LOAD_PATH.unshift File.expand_path('../lib', __dir__)
require 'ruby-short_url'

require 'minitest/reporters'
Minitest::Reporters.use!
require 'minitest/autorun'
