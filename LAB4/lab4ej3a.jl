function lab4ej3a()
	d = readdlm("Escritorio/numerico/LAB4/datos3a.dat")
	s = size(d)
	n = s[1]
	x = zeros(n)
	y = zeros(n)
	for i=1:n
		x[i] = log(d[i,1])
		y[i] = log(d[i,2])
	end
	sumx = 0
	sumy = 0
	pro = zeros(n)
	sqr = zeros(n)
	sumpro = 0
	sumsqr = 0
	for i=1:n
		pro[i] = x[i] * y[i]
		sqr[i] = x[i] * x[i]
		sumpro = sumpro + pro[i]
		sumsqr = sumsqr + sqr[i]
		sumx = sumx + x[i]
		sumy = sumy + y[i]
	end
	m = (sumpro - (sumx * sumy / n)) / (sumsqr - (sumx * sumx / n))
	b = MathConstants.e ^ ((sumy / n) - (m * sumx / n))
	println(m)
	println(b)
end