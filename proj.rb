require 'matrix'

class Matrix
  def []=(i, j, x)
    @rows[i][j] = x
  end
end


def max a,b
	if a>b then return a
	else return b
	end
end

def min a,b
	if a<b then return a
	else return b
	end
end

def projection y
	y.each{|item|max(-1,min(1,item))}
end

def m n
	a = Matrix.scalar(n,2)
		for i in 1..n-2 do
			a[i,i-1] = -1
			a[i, i+1] = -1
		end
		a[0,1] = -1
		a[n-1,n-2] = -1
	a = a/(n+1)**2.0
end

def f x, n
	a = x.covector*m(n)*x/2
	b = a[0]
end

def grad x, n
	a = m(n)
	s = 0
	r = []
		for i in 0..n-1 do
			for j in 0..n-1 do
				s=s+2*a[j,i]*x[i]**2
			end
			r.push s
			s = 0
		end
Vector.elements(r,copy=true)
end


def alg n

	x=Vector.[](0.1,0.1,0.1)
	r = 0.01
	a = 0.1
	e = 0.001
	
	while ((x-projection(x-grad(x,n))).r>e)	do
		l = 0
		y = x
		x = projection(x-r**l*grad(x,n))
		while (f(x,n)>(f(y,n)-(grad(y,n).inner_product (y-x))*a)) do
			l = l+1
			x = projection(y-r**l*grad(y,n))
		end
	end	
x
end

x=Vector.[](1,1,1)
r = 0.01
l=3
puts f(alg(3),3)
