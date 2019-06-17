function egauss(A,b)
	s = size(A)
	n = s[1]
	x = zeros(n)
	F = lu([A b])
	y = zeros(n)
	U = zeros(n,n)
	for i=1:n
		y[i] = F.U[i, n+1]
		for j=1:n
			U[i,j] = F.U[i,j]
		end
	end
	return U,y
end

function soleg(A,b)
	aux = egauss(A,b)
	U = aux[1]
	y = aux[2]
	return soltrsup(U,y)
end