function jacobi(A,b,err,mit)
	flag = true
	s = size(A)
	n = s[1]
	xold = zeros(n)
	x = zeros(n)

	k = 0
	while (flag && k < mit)
		for i=1:n
			o = 0
			for j=1:n
				if (j!=i)
					o = o + A[i,j]*xold[j]
				end
			end
			if (abs(((1/A[i,i])*(b[i]-o)) - x[i]) <= err)
				flag = false
			end
			x[i] = (b[i]-o)/(A[i,i])
		end
		k = k + 1
		xold = x
	end
	return x,k
end

function gseidel(A,b,err,mit)
	flag = true
	s = size(A)
	n = s[1]
	x = zeros(n)
	k = 0
	while (flag && k < mit)
		for i=1:n
			s = 0
			for j=1:n
				if (j!=i)
					s = s + A[i,j]*x[j]
				end
			end
			if (abs((b[i]-s)/A[i,i] - x[i]) <= err)
				flag = false
			end
			x[i] = (b[i]-s)/A[i,i]
		end
		k = k + 1
	end
	return x,k
end