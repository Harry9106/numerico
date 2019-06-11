function intenumcomp(fun,a,b,N,regla)
	if regla == "trapecio"
		h = (b-a)/N
		res = fun(a) + fun(b)
		for i=1:N-1
			res = res + 2*fun(a + i*h)
		end
		return h/2*res
	elseif regla == "pm"
		res = (b-a)*fun((a+b)/2)
		return res
	elseif regla == "simpson"
		res = fun(a) + 4*fun((a+b)/2) + fun(b)
		res = res * ((b-a)/6)
		return res
	end
end

function a(x)
	return MathConstants.e ^ (-x)
end

