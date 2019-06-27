function secante(fun,x0,x1,e,m)
	hx = Real[]
	hf = Real[]
	a = x0
	b = x1
	y0 = fun(x0)
	y1 = fun(x1)
	c = 0;
	while (abs(y1)>e && abs((b-a)/b)>e  && c<m)
	    x = b - y1*(b-a)/(y1-y0)
	    push!(hx, x)
	    a = b
	    b = x
	    y1 = fun(b)
	    push!(hf, y1)
	    y0 = fun(a)
	    c = c+1
	end
	return hx, hf
end

function fun(x)
	return x^3 + 2*x^2 + 10*x - 20
end

function fun1(x)
	return 0.5exp(x) - sin(x+1)
end