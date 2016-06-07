
class Program 

	require 'optparse'
	#require_relative 'string'
	require_relative 'impresion'
	require_relative 'factores_primos'



	attr_accessor :nombre_archivo
	attr_accessor :numero_a_factorizar
	attr_accessor :objeto_factores_primos
	attr_accessor :formato_elegido
	attr_accessor :sort_elegido



	options = {}
	$formato_elegido  = ""
	$sort_elegido  = ""
	$nombre_archivo = ""

	optparse = OptionParser.new do |opt|

		opt.on("-formatNAME", "--format=NAME", "format") do |n|
			$formato_elegido = n
		end

		opt.on("-output-fileNAME", "--output-file=NAME", "output file") do |n|
			$nombre_archivo = n
		end

		opt.on('-a', '--sort:asc', 'sort asc') do
			$sort_elegido = "asc"
		end

		opt.on('-s', '--sort:des', 'sort des') do
			$sort_elegido = "des"
		end

	end
	optparse.parse!
	$formato_elegido = $formato_elegido.downcase
	$sort_elegido = $sort_elegido.downcase

	#puts "debugONLY " + $formato_elegido
	#puts "debugONLY " + $sort_elegido
	#puts "debugONLY " + $nombre_archivo

	#mejor, chequeo q el 1er argumento sea un numero:
	numeroEntrada = ARGV[0]

	unless Impresion.is_a_number(numeroEntrada)
		puts "Solo se permite 1er parametro numerico" 
		exit
	end

	$numero_a_factorizar = numeroEntrada.to_i

	if $numero_a_factorizar <  1
		puts "Solo se permite numero mayor a 1" 
		exit
	end

	array = FactoresPrimos.new.factor($numero_a_factorizar)

	objetoImpresion = Impresion.new $numero_a_factorizar, array, $formato_elegido, $sort_elegido, $nombre_archivo
	puts objetoImpresion.obtenerTextoAMostrar

end # fin clase
