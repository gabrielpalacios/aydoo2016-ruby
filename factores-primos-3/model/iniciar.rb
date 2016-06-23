require_relative '../model/identificador_de_opciones'
require_relative '../model/factores_primos'

IdentificadorDeOpciones.validarCantidadArgumentos(ARGV)

opciones = IdentificadorDeOpciones.parsearOpciones(ARGV)

programa = FactoresPrimos.new
programa.recibirOpciones(opciones)
programa.validarOpcionesDeCadaArgumento
puts programa.obtenerSalida

