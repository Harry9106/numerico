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

function error(der,a,b)
	e = 1
	N = 0
	while (e > 0.00001)
		N = N + 1
		j = (b-a)^3
		q = 12*(N^2)
		e = (j/q)*(-1)*der(b-a)
		println(e)
	end
	return intenumcomp(fun,a,b,N,"trapecio")
end

function fun(x)
	return x * (MathConstants.e ^ (-x))
end

function der(x)
	MathConstants.e^(-x)*x - 2*MathConstants.e^(-x)
end
