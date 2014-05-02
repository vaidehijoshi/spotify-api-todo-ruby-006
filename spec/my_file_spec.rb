require_relative 'spec_helper'

describe Foo do

  let(:foo) {Foo.new(1,2,3)}

  describe '#method_name' do
    it 'description goes here' do
      expect(foo.bar).to eq(nil)
    end
  end

end
