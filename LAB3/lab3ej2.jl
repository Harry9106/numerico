function inewton(x, y, z)
	n = length(y)
	m = zeros(n,n)

	for h=1:n
		m[h,1] = y[h]
	end

	for h = 1:n-1
		coef = (y[h+1]-y[h])/(x[h+1]-x[h])
		m[h,2] = coef
	end

	for a = 3:n
		for b = 1:n-a+1
			coef = (m[b+1,a-1]-m[b,a-1])/(x[b+a-1]-x[b])
			m[b,a]= coef
		end
	end

	p = m[1,1]
	c = zeros(n)
	c[2] = z - x[1]

	for h=3:n
		c[h] = c[h-1]*(z-x[h-1])
	end

	for h=2:n
		p = p + m[1,h] * c[h]
	end

	return p
end

