require 'minitest_helper'

describe Ruby::ShortUrl do
  let(:encoder) { Ruby::ShortUrl::Encoder.new }

  it "has a version number" do
    refute_nil ::Ruby::ShortUrl::VERSION
  end

  it 'responds to methods#encode_url' do
    assert encoder.respond_to? :encode_url
  end

  it 'responds to methods#decode_url' do
    assert encoder.respond_to? :decode_url
  end

  describe "original value and decoded value are same" do
    let(:values) { [1, 12, 123, 1234, 1234567890] }

    it "has same value" do
      values.each do |i|
        encoded = encoder.encode_url(i)
        decoded = encoder.decode_url(encoded)
        assert_equal decoded, i
      end
    end
  end
end
