function lab4ej1()
	d = readdlm("Escritorio/numerico/LAB4/datos1a.dat")
	s = size(d)
	n = s[1]
	x = zeros(n)
	y = zeros(n)
	sumx = 0
	sumy = 0
	pro = zeros(n)
	sqr = zeros(n)
	sumpro = 0
	sumsqr = 0
	for i=1:n
		pro[i] = d[i,1] * d[i,2]
		sqr[i] = d[i,1] * d[i,1]
		sumpro = sumpro + pro[i]
		sumsqr = sumsqr + sqr[i]
		sumx = sumx + d[i,1]
		sumy = sumy + d[i,2]
		x[i] = d[i,1]
		y[i] = d[i,2]
	end
	m = (sumpro - (sumx * sumy / n)) / (sumsqr - (sumx * sumx / n))
	b = (sumy / n) - (m * sumx / n)
	fx = zeros(6)
	index = [0,1,2,3,4,5]
	for i=1:6
		fx[i] = m * index[i] + b
	end
	plot(index, fx)
	scatter(x,y)
end