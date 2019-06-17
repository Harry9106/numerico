function lab4ej2a(n)
	xs = range(0,1,length=50)
	ys = zeros(50)
	for i=1:50
		ys[i] = asin(xs[i])
	end
	p = polyfit(xs,ys,n)
	y = zeros(50)
	for i=1:50
		y[i] = polyval(p,xs[i])
	end
	res = zeros(50)
	sr = 0
	for i=1:50
		res[i] = ys[i] - y[i]
		sr = sr + res[i]
	end
	println(sr)
	plot(xs,ys)
	plot!(xs,y)
end