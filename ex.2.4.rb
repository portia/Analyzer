require 'matrix'

#additional method for matrices
class Matrix
  def []=(i, j, x)
    @rows[i][j] = x
  end
end

#Projection method on [-1000, 1000]
def projection y
	y.map{|item|[-1000, [1000, item].min].max}
end

#method defines the derivative for the given function max(a,b)
#input parameters values of a,b in x and their derivative respectively
def der a, b, a_prime, b_prime, e
	(a_prime + b_prime + (a - b)*(a_prime - b_prime)/((a - b)**2 + e)**(0.5))/2
end

#method gives the gradient of the given function
#it uses method "der" iteratively
def grad x, e
	b = Vector.[](0,0)
	der(-100, g3(x, e), b, der(f1(x), g2(x, e), f1_prime, der(f2(x), g1(x, e), f2_prime, der(f3(x), f4(x), f3_prime, f4_prime, e), e), e), e)
end

#definition of the function
def max_e a, b, e
	(a + b + ((a - b)**2 + e)**(0.5))/2
end

#functions inside tne max-function
def f1 x
	3*x[0] + 2*x[1]
end

def f2 x
	3*x[0] - 2*x[1]
end

def f3 x
	2*x[0] + 5*x[1]
end

def f4 x
	2*x[0] - 5*x[1]
end


#gradients of the functions defined above
def f1_prime
	Vector.[](3, 2)
end

def f2_prime
	Vector.[](3, -2)
end

def f3_prime
	Vector.[](2, 5)
end

def f4_prime
	Vector.[](2, -5)
end


#definiton of the functions which leads to make code more clear
def g1 x, e
	max_e(f3(x), f4(x), e)
end

def g2 x, e
	max_e(f2(x), g1(x, e), e)
end

def g3 x, e
	max_e(f1(x), g2(x, e), e)
end

def g4 x, e
	max_e(-100, g3(x, e), e)
end


#gradient projecton method
def alg x, e

	r = 0.0001
	a = 0.0001
	tol = 0.001
	k = 0
	ans = []
	ans << x
	#while ((x - projection(x - grad(x, e))).r > tol)	do
	while (grad(x, e).r > tol)	do
		l = 0
		y = x
		x = projection(x - r**l*grad(x, e))														 
		while (g4(x ,e) > (g4(y, e) - (grad(y, e).inner_product (y - x))*a)) do
			l = l+1
			x = projection(y - r**l*grad(y, e))
		end
		k+=1
		ans << x
	end	
ans[0]
end

x = Vector.[](9,-3)
e = 0.001
a = Vector.[](-100, -100)
b = Vector.[](0,0)
y = alg(x, e)
puts y
#puts g4(y, e)
