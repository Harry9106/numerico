function ilagrange(x, y, z)
	hz = Real[]
	for h = 1:length(z)
		sum = 0
		for i = 1:length(x)
		    l = 1;
		    for j = 1:length(x)
		        if j != i
		            l = l * (z[h] - x[j])/(x[i] - x[j])
		        end
		    end
		    sum = sum + l * y[i]
		end
		push!(hz, sum)
	end
	return hz;
end
