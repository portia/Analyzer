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
	y.map{|item|max(-1,min(1,item))}
end

def m n
	a = Matrix.scalar(n,2)
		for i in 1..n-2 do
			a[i,i-1] = -1
			a[i, i+1] = -1
		end
		a[0,1] = -1
		a[n-1,n-2] = -1
	a = a/(n+1)**2
end

def f x, n
	v = []
	for i in 0..n-1 do v.push 20 end
	v = Vector.elements(v, copy = true)
	a = x.covector*m(n)*x/2 + v.covector*x
	b = a[0]
end

def grad x, n
	a = m(n)
	s = 0
	r = []
		for j in 0..n-1 do
			for i in 0..n-1 do
				s = s + x[i]*(a[i,j] + a[j,i])
			end
			r.push (s/2 + 20)
			s = 0
		end
	Vector.elements(r,copy=true)
end


def alg x, n

	r = 0.01
	a = 0.1
	e = 0.001
	k = 0
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

x = []
for i in 0..99	 do x[i] = -0.5 end
x = Vector.elements(x,copy=true)
puts f(alg(x,100),100)
