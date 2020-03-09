# Ruby::ShortUrl

[![Build Status](https://travis-ci.org/toshimaru/ruby-short_url.svg?branch=master)](https://travis-ci.org/toshimaru/ruby-short_url)
![RuboCop](https://github.com/toshimaru/ruby-short_url/workflows/RuboCop/badge.svg)
[![Gem Version](https://badge.fury.io/rb/ruby-short_url.svg)](http://badge.fury.io/rb/ruby-short_url)
[![Test Coverage](https://codeclimate.com/github/toshimaru/ruby-short_url/badges/coverage.svg)](https://codeclimate.com/github/toshimaru/ruby-short_url/coverage)
[![Code Climate](https://codeclimate.com/github/toshimaru/ruby-short_url/badges/gpa.svg)](https://codeclimate.com/github/toshimaru/ruby-short_url)

## Description

Ruby implementation for generating Tiny URL. The implementation is based on [python-short_url](https://github.com/Alir3z4/python-short_url).

> A bit-shuffling approach is used to avoid generating consecutive, predictable URLs. However, the algorithm is deterministic and will guarantee that no collisions will occur.

More detail is [here](https://github.com/Alir3z4/python-short_url#short-url-generator).

## Installation

Add this line to your application's `Gemfile`:

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

### Create your own short URL

```rb
class CustomEncoder < Ruby::ShortUrl::Encoder
  def initialize
    # Set your own custom alphabet and block_size
    super(alphabet: "0123abc", block_size: 5)
  end
end
```

```rb
# > custom_encoder = CustomEncoder.new
# => #<CustomEncoder:0x007faf3babc830 @alphabet="0123abc", @block_size=5, @mask=31, @mapping=[0, 1, 2, 3, 4]>
#
# > custom_encoder.encode_url(1)
# => "00022"
# > custom_encoder.encode_url(2)
# => "00011"
# > custom_encoder.encode_url(3)
# => "00033"
#
# > custom_encoder.decode_url("00022")
# => 1
# > custom_encoder.decode_url("00011")
# => 2
# > custom_encoder.decode_url("00033")
# => 3
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/toshimaru/ruby-short_url. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
