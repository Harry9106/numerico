function lab4ej1b()
	xs = range(0,10,length=20)
	ys = randn(20)

	for i=1:20
		ys[i] = ys[i] + (3/4*xs[i]) - 0.5
	end
	scatter(xs,ys)
	p = polyfit(xs,ys,1)
	y = zeros(20)
	for i=1:20
		ys[i] = (3/4*xs[i]) - 0.5
		y[i] = polyval(p,xs[i])
	end
	plot!(xs,ys)
	plot!(xs,y)
end