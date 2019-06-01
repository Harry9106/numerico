function lab3ej5()
	m = readdlm("Escritorio/numerico/LAB3/datos_aeroCBA.dat")
	s = size(m)
	x = Float64[]
	y = Float64[]
	for i=1:s[1]
		if (!isnan(m[i,2]))
			push!(x,m[i,1])
			push!(y,m[i,2])
		end
	end
	spl = Spline1D(x,y)
	nx = 1957:2017
	e = spl(nx)
	plot(nx,e)
end