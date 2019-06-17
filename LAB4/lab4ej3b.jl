function lab4ej3b()
	d = readdlm("Escritorio/numerico/LAB4/datos3b.dat")
	s = size(d)
	n = s[1]
	x = zeros(n)
	y = zeros(n)
	for i=1:n
		x[i] = d[i,1]
		y[i] = d[i,1]/d[i,2]
	end
	scatter(x,y)
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
	b = ((sumy / n) - (m * sumx / n))
	println(m)
	println(b)
	for i=1:20
		y[i] = x[i] / (m*x[i] + b)
	end
	plot!(x,y)
end