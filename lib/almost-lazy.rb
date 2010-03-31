module Kernel
  def lazy(&block)
    AlmostLazy.new(&block)
  end
end
class Object
  def wake_up!
    self
  end
  def tap
    super if block_given?
    self
  end
end
class AlmostLazy < BasicObject
  undef ==
  undef equal?
  undef !
  undef !=
  undef instance_eval
  undef instance_exec
  def initialize(&block)
    @_block = block
  end
  def method_missing(method, *args, &block)
    wake_up!.__send__(method, *args, &block)
  end
  def wake_up!
    @_me = @_block.call
    def self.wake_up!
      @_me
    end
    @_me
  end
  alias :tap :wake_up!
end

