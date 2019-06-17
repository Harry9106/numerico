function lab3ej3()

	z = zeros(101)
	for i=1:101
		z[i] = 24/25 + i/25
	end

	x = [1,2,3,4,5]

	y = zeros(5)
	for i=1:5
		y[i] = 1/i
	end
	
	w = inewton(x,y,z)

	x = 1:100
	y = zeros(100)
	for i=1:100
		y[i] = 1/i
	end
	plot(x,y)
	plot!(z,w)
end