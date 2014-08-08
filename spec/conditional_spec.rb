require 'conditional'

describe Conditional do

  context 'with all branches' do

    def build_conditional(if_value, elsif_value, else_value)
      If if_value do |value|
        value
      end.elsif elsif_value do |value|
        value
      end.else do
        else_value
      end
    end

    it 'evaluates to if block for truthy if' do
      expect(build_conditional(:if_value, :elsif_value, :else_value)).to eq(:if_value)
    end

    it 'evaluates to elsif block for falsey if, truthy elsif' do
      expect(build_conditional(false, :elsif_value, :else_value)).to eq(:elsif_value)
    end

    it 'evaluates to else block for falsey if, falsey elsif' do
      expect(build_conditional(false, false, :else_value)).to eq(:else_value)
    end

  end

  context 'with else_nil' do

    it 'evaluates to if block for truthy if' do
      return_value = If(true) do
        :true_value
      end.else_nil

      expect(return_value).to eq(:true_value)
    end

    it 'evaluates to nil for falsey if' do
      return_value = If(false) do
        :true_value
      end.else_nil

      expect(return_value).to eq(nil)
    end

  end

end