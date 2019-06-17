function sollu(A,b)
	F = lu(A)
	y = soltrinf(F.L,F.P*b)
	x = soltrsup(F.U,y)
	return x
end