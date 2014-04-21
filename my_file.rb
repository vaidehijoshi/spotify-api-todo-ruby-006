class Foo
  CONSTANT_NAME = ["array", "hash", "string", "etc."]
  attr_accessor :arg1
  attr_writer :arg2
  attr_reader :arg3

  def initialize(arg1, arg2, arg3)
    @arg1 = arg1
    @arg2 = arg2
    @arg3 = arg3
  end

  def bar
    # code here
  end

end