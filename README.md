# Ruby::ShortUrl

[![Gem Version](https://badge.fury.io/rb/ruby-short_url.svg)](http://badge.fury.io/rb/ruby-short_url)
[![Dependency Status](https://gemnasium.com/toshimaru/ruby-short_url.svg)](https://gemnasium.com/toshimaru/ruby-short_url)
[![Test Coverage](https://codeclimate.com/github/toshimaru/ruby-short_url/badges/coverage.svg)](https://codeclimate.com/github/toshimaru/ruby-short_url/coverage)
[![Code Climate](https://codeclimate.com/github/toshimaru/ruby-short_url/badges/gpa.svg)](https://codeclimate.com/github/toshimaru/ruby-short_url)

Ruby implementation for generating Tiny URL. Ruby implementation of [python-short_url](https://github.com/Alir3z4/python-short_url)

> A bit-shuffling approach is used to avoid generating consecutive, predictable URLs. However, the algorithm is deterministic and will guarantee that no collisions will occur.

More detail is [here](https://github.com/Alir3z4/python-short_url#short-url-generator).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ruby-short_url'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ruby-short_url

## Usage

```rb
# shorten id
Ruby::ShortUrl::Encoder.new.encode_url(123456) # => "00crI"

# decode encoded
Ruby::ShortUrl::Encoder.new.decode_url("00crI") # => 123456
```

TODO: Customize alphabet/block_size/min_size.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/[my-github-username]/ruby-short_url/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
