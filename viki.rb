def poland_notation input
	number = []
	stack = []
	output = []
	
	operators = ["+", "-", "*", "/", "^", "(", ")"]
	priority = {"+" => 0, "-" => 0, "*" => 1, "/" => 1, "^" => 2, "(" => 0, ")" => -1}
	input = input.reverse.split('')

	until input.empty?
		x = input.pop
		number.push x if ('0'..'9').include? x

		if operators.include? x 
			output.push number.join
			number = []

			if operators.include? stack.last	
				output.push stack.pop while priority[x] < priority[stack.last] 
			end				
			stack << x
		end
	end

	output << number << stack.reverse
	output.join.to_s
end
