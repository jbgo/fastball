require 'spec_helper'

describe Pitstop::HashDot do
  it 'maps methods to keys' do
    h = Pitstop::HashDot.new foo: 'bar', 'biz' => 42

    expect(h).to respond_to(:foo)
    expect(h.foo).to eq('bar')

    expect(h).to respond_to(:biz)
    expect(h.biz).to eq(42)
  end

  it 'allows nested key lookups' do
    h = Pitstop::HashDot.new nested: { 'hashes' => { are_fun: 'hooray!' } }
    expect(h.nested.hashes.are_fun).to eq('hooray!')
  end

  it 'raises when key not found' do
    h = described_class.new
    expect(-> { h.whatever }).to raise_error(NoMethodError)
  end
end
