lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ruby/short_url/version'

Gem::Specification.new do |spec|
  spec.name          = "ruby-short_url"
  spec.version       = Ruby::ShortUrl::VERSION
  spec.authors       = ["toshi"]
  spec.email         = ["me@toshimaru.net"]

  spec.summary       = %q{Ruby implementation for generating Tiny URL. Ruby implementation of python-short_url.}
  spec.homepage      = "https://github.com/toshimaru/ruby-short_url"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
end
