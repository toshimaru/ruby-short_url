# frozen_string_literal: true

module Ruby
  module ShortUrl
    # Original imprementation is here: https://github.com/Alir3z4/python-short_url
    class Encoder
      DEFAULT_ALPHABET = ((0..9).to_a + ('A'..'Z').to_a + ('a'..'z').to_a).join
      DEFAULT_BLOCK_SIZE = 24
      MIN_LENGTH = 5

      def initialize(alphabet: DEFAULT_ALPHABET, block_size: DEFAULT_BLOCK_SIZE)
        raise ArgumentError, 'alphabet must contain at least 2 characters.' if alphabet.length < 2
        raise ArgumentError, 'block_size must be greater than 0.' unless block_size > 0

        @alphabet = alphabet
        @mask = (1 << block_size) - 1
        @mapping = (0...block_size).to_a.reverse!
      end

      def encode_url(int, min_length: MIN_LENGTH)
        enbase(encode(int), min_length)
      end

      def decode_url(str)
        decode(debase(str))
      end

      private

      def encode(int)
        (int & ~@mask) | _encode(int & @mask)
      end

      def decode(int)
        (int & ~@mask) | _decode(int & @mask)
      end

      def enbase(int, min_length)
        result = _enbase(int)
        padding_length = min_length - result.length
        padding_length = 0 if padding_length < 0
        padding = @alphabet[0] * padding_length
        padding.to_s + result.to_s
      end

      def debase(str)
        len = @alphabet.length
        str.split('').reverse.each_with_index.sum do |char, idx|
          @alphabet.index(char) * (len**idx)
        end
      end

      def _encode(int)
        @mapping.each_with_index.inject(0) do |result, (val, idx)|
          _calc_result(result, int, val, idx)
        end
      end

      def _decode(int)
        @mapping.each_with_index.inject(0) do |result, (val, idx)|
          _calc_result(result, int, idx, val)
        end
      end

      def _calc_result(result, int, int1, int2)
        return result |= (1 << int1) if int & (1 << int2) != 0

        result
      end

      def _enbase(int)
        len = @alphabet.length
        return @alphabet[int] if int < len

        _enbase(int / len) + @alphabet[int % len]
      end
    end
  end
end
