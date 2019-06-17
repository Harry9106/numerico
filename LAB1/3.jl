let
	x=2
	while isfinite(x)
		x = x^2
	end
	println(x)
end

let
	x = 0
	while x!=10
		x = x + 0.1
		println(x)
	end
end

let
	a=2
	while isfinite(a)
		a = a^2
		println(a)
		if isinf(a)
			break
		end
	end
end

let
	a=6
	acc=1
	while a>1
		acc = acc * a
		a = a - 1
	end
	return(acc)
end

function fucktorial(a)
	if a<=0
		return 1
	else
		return a * fucktorial(a-1)
	end
end

function mayor(a,b::Real)
	if a==b
		return("Iguales")
	elseif a>b
		return("El mayor es ",a)
	else
		return("El mayor es ",b)
	end
end

function potencia(x::Real, n::Int64)
	if n>=0
		return x^n
	elseif n<0
		return 1/(potencia(x,-n))
	end
end

let
	x=2
	for i=1:5
		println(potencia(x,i))
	end
end

function mala(a,b,c::Real)
	dis = (b^2) - 4*a*c
	x1 = (-b-sqrt(dis))/2*a
	x2 = (-b+sqrt(dis))/2*a
	return x1, x2
end

function buena(a,b,c::Real)
	dis = (b^2)-4*a*c
	if (b>0)
		println("b>0")
		x1 = (-b-sqrt(dis))/2*a
		println(x1)
		if x1 > c
			x2 = c/x1*a
			println("c/x1")
		else
			x2 = (-b+sqrt(dis))/2*a
		end
	else
		x1 = (-b+sqrt(dis))/2*a
		if x1 > c
			x2 = c/x1*a
		else
			x2 = (-b-sqrt(dis))/2*a
		end
	end
	return x1, x2
end

function horn(coefs, x::Real)
	maxExp = length(coefs)
	h = coefs[1]
	for i = 2:maxExp
		h = h * x + coefs[i]
	end
	return h
end
