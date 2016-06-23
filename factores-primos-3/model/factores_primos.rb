require_relative '../model/calculadora_de_factores_primos'
require_relative '../model/aplicador_de_formato'
require_relative '../model/formato_invalido_error'
require_relative '../model/ordenamiento_invalido_error'
require_relative '../model/sin_nombre_de_archivo_error'
require_relative '../model/manejo_de_archivos'

class FactoresPrimos

  attr_reader :nombre_archivo
  attr_reader :numero_a_factorizar
  attr_reader :formato_elegido
  attr_reader :sort_elegido

  def recibirOpciones (opciones)

    @nombre_archivo = opciones.nombre_archivo
    @numero_a_factorizar = opciones.numeroEntrada
    unless opciones.formato_elegido.eql?(nil)
      @formato_elegido = opciones.formato_elegido.downcase
    end
    unless opciones.sort_elegido.eql?(nil)
      @sort_elegido = opciones.sort_elegido.downcase
    end

  end

  def validarOpcionesDeCadaArgumento

    unless (@formato_elegido.eql?("pretty") || @formato_elegido.eql?("quiet") || @formato_elegido.eql?(nil) || @formato_elegido.eql?(''))
      fail FormatoInvalidoError.new

    end

    unless (@sort_elegido.eql?("asc") || @sort_elegido.eql?(nil) || @sort_elegido.eql?("des") || @sort_elegido.eql?(''))
      fail OrdenamientoInvalidoError.new

    end

    if (@nombre_archivo.eql?(''))
      fail SinNombreDeArchivoError.new
    end

  end

  def obtenerSalida

    retorno = ''
    arrayFactorizacionDeNro = CalculadoraDeFactoresPrimos.calcularFactorPrimo(@numero_a_factorizar)

    formato = AplicadorDeFormato.new(@numero_a_factorizar, arrayFactorizacionDeNro)

    if (@sort_elegido == "des")
      formato.aplicar_ordenamiento_inverso
    end

    if (@formato_elegido == "quiet")
      retorno =formato.aplicar_formato_quiet
    else
      retorno = formato.aplicar_formato_pretty
    end

    unless @nombre_archivo.eql?(nil)
      ManejoDeArchivos.crearArchivo(@nombre_archivo, retorno)
      retorno = ''
    end
    retorno

  end

end

