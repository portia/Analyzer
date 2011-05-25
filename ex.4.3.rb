require 'matrix'
def f x
	[-100.0, 3*x[0] + 2*x[1], 3*x[0] - 2*x[1], 2*x[0] + 5*x[1], 2*x[0] - 5*x[1]].max
end

def fun x
	[-100.0, 3*x[0] + 2*x[1], 3*x[0] - 2*x[1], 2*x[0] + 5*x[1], 2*x[0] - 5*x[1]]
end

def subgradient x
	return [2, -5] if x[0] == 3*x[1]
	return [2,  5] if x[0] == -3*x[1]

	b = [
		-100.0,
		3*x[0] + 2*x[1],
		3*x[0] - 2*x[1],
		2*x[0] + 5*x[1],
		2*x[0] - 5*x[1]
	]
	
		i_max = b.index(b.max)

	return case i_max
	when 0 then [0,  0]	
	when 1 then [3,  2]
	when 2 then [3, -2]
	when 3 then [2,  5]
	when 4 then [2, -5]
	end
end

def method_2 x
	g = Vector.elements(subgradient(x), copy = true)
#	g /= g.r
	x = Vector.elements(x, copy = true)
	k = 0
	ans = []
	ans << x
	until (g.r.zero?) or (k > 6000)do
		k += 1
		x -=15*g/(k + 1)
		g = Vector.elements(subgradient(x), copy = true)
		g /= g.r if g.r != 0
		ans << x
	end
	return	k, x, f(x), g
end

def method_3 x
	g = Vector.elements(subgradient(x), copy = true)
	g /= (g.r)**2
	x = Vector.elements(x, copy = true)	
	y = 0
	k = 0
	ans = []
	ans << f(x)
	until g.r.zero? do
		k += 1
#		f_ = f(x) - (f(x) - f(y)).abs
#		y = x
		f_ = -100
		x -= (2*f(x) - 2*f_)*g
		g = Vector.elements(subgradient(x), copy = true)
		g /= (g.r)**2 if g.r != 0
		ans << f(x)
	end
	return k, x, f(x)
end

def method_1 x
	k = 0
	ans = []
	ans << f(x)
	while (k < 600)
		k += 1
		if (x[0] == 3.0*x[1])
			x[0] = x[1]
			x[1] = -x[1]/3.0
		else(x[0] == -3.0*x[1])
			x[0] = -x[1]
			x[1] = -x[1]/3.0
		end
		ans << f(x)
	end
	f(x)
end

#puts File.open('file_for_ex.4.3', 'w') {|f| f.write(method_2([9, -3]))}
puts method_2([9, -3])
