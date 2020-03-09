# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ruby/short_url/version'

Gem::Specification.new do |spec|
  spec.name          = 'ruby-short_url'
  spec.version       = Ruby::ShortUrl::VERSION
  spec.authors       = ['toshimaru']
  spec.email         = ['me@toshimaru.net']

  spec.summary       = 'Small library for generating tiny URL. Ruby port of python-short_url.'
  spec.homepage      = 'https://github.com/toshimaru/ruby-short_url'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.required_ruby_version = '>= 2.3.0'
end
