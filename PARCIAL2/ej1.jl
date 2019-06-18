function ej1()
	n = 8
	t = [1,2,3,4,5,6,7,8]
	x = [1.5,4,7.5,12,17.5,24,31.5,40]
	tx = zeros(n)
	t2x = zeros(n)
	t2 = zeros(n)
	t3 = zeros(n)
	t4 = zeros(n)
	sumt = 0
	sumx = 0
	sumtx = 0
	sumt2x = 0
	sumt2 = 0
	sumt3 = 0
	sumt4 = 0
	for i=1:n
		tx[i] = t[i]*x[i]
		t2x[i] = (t[i]^2)*x[i]
		t2[i] = t[i]^2
		t3[i] = t[i]^3
		t4[i] = t[i]^4
		sumt = sumt + t[i]
		sumx = sumx + x[i]
		sumtx = sumtx + tx[i]
		sumt2x = sumt2x + t2x[i]
		sumt2 = sumt2 + t2[i]
		sumt3 = sumt3 + t3[i]
		sumt4 = sumt4 + t4[i]
	end
	m = [n sumt sumt2; sumt sumt2 sumt3; sumt2 sumt3 sumt4]
	b = [sumx,sumtx,sumt2x]
	s = inv(m)*b
	x0 = s[1]
	v0 = s[2]
	a = s[3]
	z = zeros(n)
	for i=1:n
		z[i] = x0 + v0*t[i] + (a*t[i]*t[i])
	end
	println(x0)
	println(v0)
	println(a)
	scatter(t,x)
	plot!(t,z)
end