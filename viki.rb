def poland_notation input

	number = []
	output = []
	stack = []

	priority = {"+" => 0, "-" => 0, "*" => 1, "/" => 1, "^" => 2}
	operators = priority.keys
	input = input.reverse.split('')

	until input.empty?
		x = input.pop
		if ('0'..'9').include? x
			number.push x
		else
			output.push number.join.to_f if number != []
			number = []
		end

		stack << x if x == '('

		if (x == ')')
				until (stack.last == '(')
					output.push stack.pop
				end
				stack.pop
		end

		if operators.include? x
			while (operators.include? stack.last)
				if (priority[x] < priority[stack.last])
					output.push stack.pop
				else break
				end
			end

			stack << x
		end
	end

	output << number.join.to_f if number != []
	output << stack.pop until stack.empty?
	output.delete_if {|x| x == ""}
end

class Float
	def value
		self
	end
end

class Node
	
	attr_accessor :left_operand
	attr_accessor :right_operand
	attr_accessor :operator

	def initialize right, left, operator
		@left_operand = left
		@right_operand = right
		@operator = operator
	end

	def value
		case @operator
		when "+" then @left_operand.value + @right_operand.value
		when "-" then @left_operand.value - @right_operand.value
		when "*" then @left_operand.value * @right_operand.value
		when "/" then @left_operand.value / @right_operand.value
		when "^" then @left_operand.value ** @right_operand.value
		end
	end

end

class Builder
	attr_accessor :array
	attr_accessor :x
	attr_accessor :node

	OPERATORS = ["+", "-", "*", "/", "^"]

	def initialize a
		@array = poland_notation(a).reverse
		@x = []
	end

	def build
		until @array.first == @node
			@x << @array.pop until OPERATORS.include? @array.last
			@node = Node.new(@x.pop, @x.pop, @array.pop)
			@array << @node
		end
		@node
	end

end

def calc input
	Builder.new(input).build.value
end

