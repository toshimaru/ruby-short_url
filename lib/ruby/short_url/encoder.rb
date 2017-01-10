module Ruby
  module ShortUrl
    # Original imprementation is here: https://github.com/Alir3z4/python-short_url
    class Encoder
      DEFAULT_ALPHABET = ((0..9).to_a + ('A'..'Z').to_a + ('a'..'z').to_a).join
      DEFAULT_BLOCK_SIZE = 24
      MIN_LENGTH = 5

      def initialize(alphabet: DEFAULT_ALPHABET, block_size: DEFAULT_BLOCK_SIZE)
        raise ArgumentError.new 'alphabet must contain at least 2 characters.' if alphabet.length < 2
        raise ArgumentError.new 'block_size must be greater than 0.' unless block_size > 0

        @alphabet = alphabet
        @block_size = block_size
        @mask = (1 << block_size) - 1
        @mapping = (0..block_size - 1).to_a
      end

      def encode_url(n, min_length: MIN_LENGTH)
        enbase(encode(n), min_length)
      end

      def decode_url(n)
        decode(debase(n))
      end

      private

      def encode(n)
        (n & ~@mask) | _encode(n & @mask)
      end

      def decode(n)
        (n & ~@mask) | _decode(n & @mask)
      end

      def enbase(x, min_length)
        result = _enbase(x)
        padding_length = min_length - result.length
        padding_length = 0 if padding_length < 0
        padding = @alphabet[0] * padding_length
        padding.to_s + result.to_s
      end

      def debase(x)
        n = @alphabet.length
        x.split('').reverse.each_with_index.inject(0) do |result, (c, i)|
          result += @alphabet.index(c) * (n ** i)
        end
      end

      def _encode(n)
        @mapping.reverse.each_with_index.inject(0) do |result, (b, i)|
          _calc_result(result, n, b, i)
        end
      end

      def _decode(n)
        @mapping.reverse.each_with_index.inject(0) do |result, (b, i)|
          _calc_result(result, n, i, b)
        end
      end

      def _calc_result(result, n, x, y)
        return result |= (1 << x) if n & (1 << y) != 0
        result
      end

      def _enbase(x)
        n = @alphabet.length
        return @alphabet[x] if x < n
        _enbase(x / n) + @alphabet[x % n]
      end
    end
  end
end
