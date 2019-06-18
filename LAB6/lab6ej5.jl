function jacobi(A,b,err,mit)
	flag = true
	s = size(A)
	n = s[1]
	F = lu(A)
	R = F.L + F.U
	D = zeros(n,n)
	x = zeros(n)
	for i=1:n
		D[i,i] = A[i,i]
	end

	k = 0
	while (flag && k < mit)
		for i=1:n
			o = 0
			for j=1:n
				if (j!=i)
					o = o + A[i,j]*x[j]
				end
			end
			if (abs(((1/A[i,i])*(b[i]-o)) - x[i]) <= err)
				flag = false
			end
			x[i] = (1/A[i,i])*(b[i]-o)
		end
		k = k + 1
	end
	return x,k
end

function gseidel(A,b,err,mit)
	flag = true
	s = size(A)
	n = s[1]
	x = zeros(n)
	N = triu(A)
	P = tril(A,-1) * (-1)
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