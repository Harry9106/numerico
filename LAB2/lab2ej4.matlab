global a

function fun_lab2ej4a(x)
	return x^2 - a
end

function fun_lab2ej4b(x, a)
	return rnewton(fun_lab2ej4b)
end

function rnewton(fun, x0, err, mit)
	hx = Real[]
	hf = Real[]
	a = fun(x0)
	fx = a[1]
	push!(hf, fx) 
	dfx = a[2]
	h = fx/dfx
	x = x0
	push!(hx, x)
	local i = 0
	while (fx >= err) && (i < mit)
		i += 1
		h = fx/dfx
		x = x - h
		push!(hx, x)
		aux = fun(x)
		fx = aux[1]
		push!(hf, fx)
		dfx = aux[2]
	end
	return hx, hf
end