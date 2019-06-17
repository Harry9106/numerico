function ripf(fun, x0, err, mit)
	hx = Real[]
	x = x0
	a = fun(x0)
	gx = a[2]
	push!(hx, gx)
	local i = 0
	while (gx - x >= err) && (i < mit)
		i += 1
		x = gx
		a = fun(x)
		gx = a[2]
		push!(hx, gx)
	end
	return hx
end

function fun(x)
	return x^3 + 4*x^2 - 10, sqrt(10/(x+4))
end
