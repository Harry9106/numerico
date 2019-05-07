function ilagrange(x, y, z)
	hz = Real[]
	for h = 1:length(z)
		sum = 0
		for i = 1:length(x)
		    l = 1;
		    for j = 1:length(x)
		        if j != i
		            l = l * (z[h] - x[j])/(x[i] - x[j])
		        end
		    end
		    sum = sum + l * y[i]
		end
		push!(hz, sum)
	end
	return hz;
end

function inewton(x, y)
	coefs = Real[]
	for h = 1:length(y)-1
		coef = (y[h+1]-y[h])/(x[h+1]-x[h])
		push!(coefs, coef)
	end

	for h = 1:length(y)-2
		coef = (coefs[h+1]-coefs[h])/(x[h+2]-x[h])
		push!(coefs, coef)
	end

	for h = 1:length(y)-3
		coef = (coefs[h+3]-coefs[h+4])/(x[h+3]-x[h])
		push!(coefs, coef)
	end

	return coefs
end