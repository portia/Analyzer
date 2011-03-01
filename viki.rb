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
			output.push number.join
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

	output << number << stack.reverse
	output.join.to_s
end
