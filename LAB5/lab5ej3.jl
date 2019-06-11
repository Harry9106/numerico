function senint()
	x = 0:0.5:2*pi
	y =	zeros(13)
	ys = zeros(13)
	for i=1:13
		ys[i] = sin(x[i])
		N = ceil(x[i]/0.1)
		y[i] = intenumcomp(fun,0,x[i],N,"trapecio")
	end
	plot(x,y)
	plot!(x,ys)
end

function fun(x)
	return cos(x)
end

function intenumcomp(fun,a,b,N,regla)
	if regla == "trapecio"
		h = (b-a)/N
		res = fun(a) + fun(b)
		for i=1:N-1
			res = res + 2*fun(a + i*h)
		end
		return h/2*res
	elseif regla == "pm"
		h = (b-a)/N
		xi = zeros(N+1)
		xi[1] = a
		for i=2:N+1
			xi[i] = a + (i-1)*h
		end
		res = 0
		for i=1:N
			res = res + fun((xi[i]+xi[i+1])/2)
		end
		return h*res
	elseif regla == "simpson"
		h = (b-a)/(2*N)
		xi = zeros((2*N)+1)
		xi[1] = a
		for i=2:(2*N)+1
			xi[i] = a + (i-1)*h
		end
		res = fun(a) + fun(b)
		for i=1:N-1
			res = res + 2*fun(xi[(2*i)+1])
		end
		for i=1:N
			res = res + 4*fun(xi[2*i])
		end
		return res * h/3
	end
end