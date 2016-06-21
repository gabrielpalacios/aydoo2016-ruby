class FactoresPrimos

	def factor(n)
		vector = []    
		p = 2
		if n < 2
			return p
		end

		while n != 1
			while n % p == 0
				vector.push(p)
				n /= p
			end
						p +=1
		end

		return vector
	end
	
end #clase