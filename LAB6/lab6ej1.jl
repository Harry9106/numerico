function soltrsup(A,b)
	if (det(A) == 0)
		println("Matriz singular")
		return 0
	else
		s = size(A)
		n = s[1]
		x = zeros(n)
		x[n] = b[n]/A[n,n]
		for i=n-1:-1:1
			acc = 0
			for j=n:-1:i
				acc = acc + A[i,j] * x[j]
			end
			x[i] = (b[i] - acc) / A[i,i]
		end
		return x
	end
end

function soltrinf(A,b)
	if (det(A) == 0)
		println("Matriz singular")
		return 0
	else
		s = size(A)
		n = s[1]
		x = zeros(n)
		x[1] = b[1]/A[1,1]
		for i=2:n
			acc = 0
			for j=1:i-1
				acc = acc + A[i,j] * x[j]
			end
			x[i] = (b[i] - acc) / A[i,i]
		end
		return x
	end
end