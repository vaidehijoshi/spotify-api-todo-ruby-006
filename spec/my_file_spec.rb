require_relative 'spec_helper'

describe 'Foo' do

  before(:each) do
    @foo = Foo.new
  end
  
  describe '#method_name' do
    context 'context goes here' do
      it 'description goes here' do
        expect().to eq()
      end
    end
  end

end