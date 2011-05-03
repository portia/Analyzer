require 'matrix'

class Matrix
  def []=(i, j, x)
    @rows[i][j] = x
  end
end

def m n
	a = Matrix.scalar(n,2)
		for i in 1..n-2 do
			a[i,i-1] = -1.0
			a[i, i+1] = -1.0
		end
		a[0,1] = -1.0
		a[n-1,n-2] = -1.0
	a = a/(n+1)**2.0
end

def f x, n
	v = []
	for i in 0..n-1 do v.push 20 end
	v = Vector.elements(v, copy = true)
	(x.covector*m(n)*x/2 + v.covector*x)[0]
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

def projection y
	y.map{|item|[-1, [1, item].min].max}
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

def fun x, n
	projection(x - grad(x,n))-x
end

def alg x, n
	e = 0.01
	y = x
	while (fun(x,n).r > e) do
		dx = fun(x,n)
		y = x + dx
		while (f(x,n) <= f(y,n)) do
			dx = dx/2
			y = x + dx
		end
		x = y
	end
	y
end

x = Vector.[](1,1,1)
puts alg(x,3)
