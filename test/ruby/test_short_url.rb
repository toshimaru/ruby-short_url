require 'minitest_helper'

describe Ruby::ShortUrl do
  let(:encoder) { Ruby::ShortUrl::Encoder.new }

  it "has a version number" do
    refute_nil ::Ruby::ShortUrl::VERSION
  end

  it 'responds to methods#encode_url' do
    assert_respond_to encoder, :encode_url
  end

  it 'responds to methods#decode_url' do
    assert_respond_to encoder, :decode_url
  end

  it "can set alphabet parameter" do
    encoder = Ruby::ShortUrl::Encoder.new(alphabet: "ab")
    assert_instance_of Ruby::ShortUrl::Encoder, encoder
  end

  it "can set block_size parameter" do
    encoder = Ruby::ShortUrl::Encoder.new(block_size: 100)
    assert_instance_of Ruby::ShortUrl::Encoder, encoder
  end

  it "can set alphabet and block_size parameter" do
    encoder = Ruby::ShortUrl::Encoder.new(alphabet: "0123456789", block_size: 1)
    assert_instance_of Ruby::ShortUrl::Encoder, encoder
  end

  it "throws exception alphabet too short" do
    assert_raises(ArgumentError) { Ruby::ShortUrl::Encoder.new(alphabet: "a") }
  end

  it "throws exception block_size is zero or negative" do
    assert_raises(ArgumentError) { Ruby::ShortUrl::Encoder.new(block_size: 0) }
    assert_raises(ArgumentError) { Ruby::ShortUrl::Encoder.new(block_size: -1) }
  end

  describe "original value and decoded value are same" do
    let(:values) { [1, 12, 123, 12345, 1234567890] }

    it "has same value" do
      values.each do |i|
        encoded = encoder.encode_url(i)
        decoded = encoder.decode_url(encoded)
        assert_equal decoded, i
      end
    end
  end

  describe "default result" do
    describe "1" do
      let(:val) { 1 }
      let(:expected_result) { '0ZCG8' }

      it "encodes value" do
        encoded_result = encoder.encode_url(val)
        assert_equal encoded_result, expected_result
      end

      it "decodes result" do
        decoded_val = encoder.decode_url(expected_result)
        assert_equal decoded_val, val
      end
    end

    describe "10" do
      let(:val) { 10 }
      let(:expected_result) { '0Lzua' }

      it "encodes value" do
        encoded_result = encoder.encode_url(val)
        assert_equal encoded_result, expected_result
      end

      it "decodes result" do
        decoded_val = encoder.decode_url(expected_result)
        assert_equal decoded_val, val
      end
    end

    describe "100" do
      let(:val) { 100 }
      let(:expected_result) { '0ARrE' }

      it "encodes value" do
        encoded_result = encoder.encode_url(val)
        assert_equal encoded_result, expected_result
      end

      it "decodes result" do
        decoded_val = encoder.decode_url(expected_result)
        assert_equal decoded_val, val
      end
    end
  end
end
