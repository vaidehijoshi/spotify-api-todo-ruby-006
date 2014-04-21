require_relative './spec_helper'
require_relative '../my_file.rb'

describe 'Foo' do

  before(:each) do
    @foo = Foo.new('arg1', ["arg2"], {:arg=>3})
  end
  
  describe '#bar' do
    context 'context here' do
      it 'description here' do
        expect(@foo.bar).should be_an(Integer/String/Fixnum)
      end
    end
    context 'second context' do
      it 'second description' do
        expect(@foo.bar).to eq('true/false/integer/string/etc.')
      end
    end
  end

end