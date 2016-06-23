class AplicadorDeFormato

  attr_reader :numero_a_factorizar
  attr_reader :factorizacion

  def initialize(numero_a_factorizar, factorizacion)
    @numero_a_factorizar = numero_a_factorizar.to_s
    @factorizacion = factorizacion # recibe array
  end

  def aplicar_formato_pretty
    devolucion = "Factores primos " + @numero_a_factorizar + ": "
    #iterando el array
    @factorizacion.each do |i|
      devolucion += "#{i} "
    end
    devolucion
  end

  def aplicar_formato_quiet

    devolucion = ""
#llamar el de quiet, tiene \n" cada nro en pantalla;
    @factorizacion.each do |i|
      devolucion += "#{i}\n"
    end
    devolucion
  end

  def aplicar_ordenamiento_inverso
    @factorizacion.reverse!
  end


end