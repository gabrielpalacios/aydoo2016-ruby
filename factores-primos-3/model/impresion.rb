class Impresion

	attr_accessor :devolucion
	attr_accessor :nombre_archivo_elegido

	def initialize (nro, array, formato_elegido, sort_elegido, nombre_archivo) 

		@nro = nro
		#vec = [2, 2, 2, 3, 3, 5]
		@array =  array #   vec # array
		@formato_elegido = formato_elegido.downcase
		@sort_elegido =  sort_elegido.downcase
		$nombre_archivo_elegido = nombre_archivo

		$devolucion = ""

		unless @formato_elegido.eql?("pretty") || @formato_elegido.eql?("quiet") || @formato_elegido.eql?("")
			$devolucion = "Formato no aceptado. Las opciones posibles son: pretty o quiet."
			return
		end

		unless @sort_elegido.eql?("asc") || @sort_elegido.eql?("des") || @sort_elegido.eql?("")
			$devolucion = "Formato no aceptado. Las opciones posibles son: asc o des."
			return
		end

		if @sort_elegido.eql?("des")
			@array.reverse!
		end

		if (@formato_elegido == "pretty" || @formato_elegido == "")
			#llamar default
			$devolucion = "Factores primos " + @nro.to_s + ": "
			#iterando el array
			@array.each do |i|
				$devolucion += "#{i} "
			end
		else
			#llamar el de quiet, tiene \n" cada nro en pantalla;
			@array.each do |i|
				$devolucion += "#{i}\n" 
			end
		end
	end # fin constructor

	def obtenerTextoAMostrar
		unless  $nombre_archivo_elegido.eql?("")
			# Crea un nuevo fichero, y escribe
			File.open( $nombre_archivo_elegido, 'w') do |f2|
				f2.puts $devolucion
			end
		else
			#puts "devolucionLALA: " + $devolucion
			return  $devolucion  
		end
		rescue Exception => msg  
  	# dispone el mensaje de error 
 		 print "Error al intentar escribir archivo: " 
 		 puts msg  
	end

	public
	def self.is_a_number(s)
		# s.to_s.match(/\A[+-]?\d+?(\.\d+)?\Z/) == nil ? false : true 
		true if Float(s) rescue false
	end

end # fin clase