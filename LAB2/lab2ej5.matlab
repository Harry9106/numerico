function ripf(fun, x0, err, mit)
	hx = Real[]
	x = x0
	a = fun(x0)
	gx = a[2]
	push!(hx, gx)
	local i = 0
	while (abs(gx - x) >= err) && (i < mit)
		i += 1
		x = gx
		a = fun(x)
		gx = a[2]
		push!(hx, gx)
	end
	return hx
end

function fun(x)
	return x^4 - x - 10, (x+10)^(1/4)
end

function fun(x)
	return x^3 + 4*x^2 - 10, sqrt(10/(x+4))
end

function fun(x)
	return 2*x, 2.0^(x-1)
end

function f1(x)
	return 2*x
end

function f2(x)
	return 2^x
end