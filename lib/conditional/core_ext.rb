class Conditional
  module CoreExt
    def If(*args, &block)
      Conditional.if(*args, &block)
    end
  end
end

Object.include(Conditional::CoreExt)