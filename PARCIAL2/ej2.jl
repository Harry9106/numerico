function lagrange(x,y,z)
	hz = Real[]
	n = length(z)
	for h = 1:n
		sum = 0
		for i = 1:length(x)
		    l = 1;
		    for j = 1:length(x)
		        if (j != i)
		            l = l * (z[h] - x[j])/(x[i] - x[j])
		        end
		    end
		    sum = sum + l * y[i]
		end
		push!(hz, sum)
	end
	return hz
end

function simpson()
	x = [-1, -0.75, -0.51, -0.27, -0.03, 0.21, 0.45, 0.7, 0.94, 1.18]
	y = [0.02, 0.13, 0.64, 1.2, 1.3, 1.26, 1.02, 0.49, 0.19, 0.08]
	plot(x,y)
	a = (-1)
	b = 1
	N = 100
	h = (b-a)/(2*N)
	xi = zeros((2*N)+1)
	xi[1] = a
	for i=2:(2*N)+1
		xi[i] = a + (i-1)*h
	end
	res = lagrange(x, y, a) + lagrange(x, y, b)
	for i=1:N-1
		res = res + 2*lagrange(x, y, xi[(2*i)+1])
	end
	for i=1:N
		res = res + 4*lagrange(x, y, xi[2*i])
	end
	return res * h/3
end