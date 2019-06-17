function lab3ej4()
	for n=1:15
		z = zeros(201)
		for i=1:201
			z[i] = (-101+i)/100
		end

		x = zeros(n+1)
		y = zeros(n+1)
		for i=1:n+1
			x[i] = 2*(i-1)/n - 1
			y[i] = 1/(1 + 25*x[i]*x[i])
		end

		w = inewton(x,y,z)
		plot(z,w)

		y = zeros(201)
		for i=1:201
			y[i] = 1/(1 + 25*z[i]*z[i])
		end
		plot!(z,y)
	end
end
