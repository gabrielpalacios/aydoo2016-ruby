require 'optparse'
#require 'optparse/time'
require 'ostruct'
#require 'pp'
require_relative '../model/sin_argumentos_error'
require_relative '../model/numero_de_argumentos_excedido_error'
require_relative '../model/argumentos_invalidos_error'
require_relative '../model/primerargumento_noesnumero_error'
require_relative '../model/primerargumento_noesnumerovalido_error' # PrimerArgumentoNoEsNumeroValidoError

class IdentificadorDeOpciones

  def self.validarCantidadArgumentos( args)
    if ( args.empty?)  # ex ARGV.size == 0 ||
      fail SinArgumentosError.new
    end

      if args.length > 4
        fail NumeroDeArgumentosExcedidoError.new
      end


  end


  def self.parsearOpciones(args)


    lista_argumentos = OpenStruct.new
    unless IdentificadorDeOpciones.esNumero(args[0])
      fail PrimerArgumentoNoEsNumeroError.new
      #puts o
      exit 1
    else
      if IdentificadorDeOpciones.esNumeroMayorAUno(args[0])
        fail PrimerArgumentoNoEsNumeroValidoError.new
      else
      lista_argumentos.numeroEntrada = args[0]
      end
    end

    lista_argumentos.formato_elegido = ''
    lista_argumentos.nombre_archivo = nil  # predetermino
    lista_argumentos.sort_elegido = ''

    opt_parser = OptionParser.new do |opts|
    opts.on("-formatNAME", "--format=NAME", "format pretty o quiet") do |n|
        lista_argumentos.formato_elegido =  n
      end

      opts.on("-output-fileNAME", "--output-file=NAME", "output file") do |n|
        lista_argumentos.nombre_archivo = n
      end

      opts.on('-sortNAME', '--sort=NAME', 'sort asc o des') do |n|
        lista_argumentos.sort_elegido = n
      end

   # opts.on('-a', '--sort:asc', 'sort asc') do
    #  lista_argumentos.sort_elegido = "asc"
    #end

     # opts.on('-s', '--sort:des', 'sort des') do
     #   lista_argumentos.sort_elegido = "des"
     # end

    end

    #opt_parser.parse!(args)
    begin opt_parser.parse!(args)

  rescue OptionParser::InvalidOption => e
    #puts e
    #puts "Ingreso de parametros incorrectos, solo se aceptan format, sort y output-file"
    fail ArgumentosInvalidosError.new
    #puts o
    exit 1
  end

    lista_argumentos
  end  # parse()

  def self.esNumero(s)
    # s.to_s.match(/\A[+-]?\d+?(\.\d+)?\Z/) == nil ? false : true
    true if Float(s) rescue false
  end

  def self.esNumeroMayorAUno(s)
    if s.to_i < 2
      true
    else false
    end
  end
end  # class

