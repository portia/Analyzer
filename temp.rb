require 'matrix'

def der a_prime, b_prime
	(a_prime + b_prime)/2
end

def f1_prime
	Vector.[](3, 2)
end

def f2_prime
	Vector.[](3, -2)
end

puts der(f1_prime, f2_prime)
