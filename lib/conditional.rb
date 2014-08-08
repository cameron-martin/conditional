require 'conditional/core_ext'

class Conditional
  def self.if(*args, &block)
    new.if(*args, &block)
  end

  def initialize
    @conditions = []
  end

  def if(condition, &block)
    @conditions << [condition, block]
    self
  end

  alias_method :elsif, :if

  def else(&block)
    @conditions << [true, block]
    evaluate
  end

  def else_nil
    self.else {}
  end

private

  def evaluate
    condition, block = @conditions.find { |(condition, _)| condition }
    block.call(condition)
  end
end
