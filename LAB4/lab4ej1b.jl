function lab4ej1b()
	xs = range(0,20,length=20)
	ys = randn(20)

	for i=1:20
		ys[i] = ys[i] + (3/4*xs[i]) - 0.5
	end
	scatter(xs,ys)
	eval(xs,ys) 
end

function eval(xs,ys)
	s = size(xs)
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
		pro[i] = xs[i] * ys[i]
		sqr[i] = xs[i] * xs[i]
		sumpro = sumpro + pro[i]
		sumsqr = sumsqr + sqr[i]
		sumx = sumx + xs[i]
		sumy = sumy + ys[i]
		x[i] = xs[i]
		y[i] = ys[i]
	end
	m = (sumpro - (sumx * sumy / n)) / (sumsqr - (sumx * sumx / n))
	b = (sumy / n) - (m * sumx / n)
	fx = zeros(21)
	index = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]
	for i=1:21
		fx[i] = m * index[i] + b
	end
	println(m)
	println(b)
	plot!(index, fx)
end