require 'rspec'
require 'ostruct'
require_relative '../model/factores_primos'

describe 'FactoresPrimos' do

  it 'deberia indicar que recibio argumento format invalido' do

    lista_argumentos = OpenStruct.new
    lista_argumentos.numeroEntrada = 123
    lista_argumentos.formato_elegido = 'fruta'
    validador = FactoresPrimos.new
    validador.recibirOpciones (lista_argumentos)
    expect { validador.validarOpcionesDeCadaArgumento }.to raise_error(FormatoInvalidoError)
  end

  it 'deberia indicar que recibio argumento Ordenamiento invalido' do

    lista_argumentos = OpenStruct.new
    lista_argumentos.numeroEntrada = 123
    lista_argumentos.sort_elegido = 'pepe'
    validador = FactoresPrimos.new
    validador.recibirOpciones (lista_argumentos)
    expect { validador.validarOpcionesDeCadaArgumento }.to raise_error(OrdenamientoInvalidoError)
  end

  it 'deberia indicar que recibio argumento NombreDeArchivo vacio' do

    lista_argumentos = OpenStruct.new
    lista_argumentos.numeroEntrada = 123
    lista_argumentos.nombre_archivo = ''
    validador = FactoresPrimos.new
    validador.recibirOpciones (lista_argumentos)
    expect { validador.validarOpcionesDeCadaArgumento }.to raise_error(SinNombreDeArchivoError)
  end

  it 'deberia indicar que recibio argumento format pretty valido' do

    lista_argumentos = OpenStruct.new
    lista_argumentos.numeroEntrada = 123
    lista_argumentos.formato_elegido = 'pretty'
    validador = FactoresPrimos.new
    validador.recibirOpciones (lista_argumentos)
    esperado = 'pretty'
    expect(validador.formato_elegido).to eq(esperado)
  end

  it 'deberia indicar que recibio argumento format pretty valido mayuscula' do

    lista_argumentos = OpenStruct.new
    lista_argumentos.numeroEntrada = 123
    lista_argumentos.formato_elegido = 'prETTy'
    validador = FactoresPrimos.new
    validador.recibirOpciones (lista_argumentos)
    esperado = 'pretty'
    expect(validador.formato_elegido).to eq(esperado)
  end

  it 'deberia indicar que recibio argumento sort asc valido' do

    lista_argumentos = OpenStruct.new
    lista_argumentos.numeroEntrada = 123
    lista_argumentos.sort_elegido = 'asc'
    validador = FactoresPrimos.new
    validador.recibirOpciones (lista_argumentos)
    esperado = 'asc'
    expect(validador.sort_elegido).to eq(esperado)
  end

  it 'deberia indicar que recibio argumento sort des valido mayuscula' do

    lista_argumentos = OpenStruct.new
    lista_argumentos.numeroEntrada = 123
    lista_argumentos.sort_elegido = 'Des'
    validador = FactoresPrimos.new
    validador.recibirOpciones (lista_argumentos)
    esperado = 'des'
    expect(validador.sort_elegido).to eq(esperado)
  end

  it 'deberia indicar que recibio argumento nombre archivo' do

    lista_argumentos = OpenStruct.new
    lista_argumentos.numeroEntrada = 123
    lista_argumentos.nombre_archivo = 'prueba.txt'
    validador = FactoresPrimos.new
    validador.recibirOpciones (lista_argumentos)
    esperado = 'prueba.txt'
    expect(validador.nombre_archivo).to eq(esperado)
  end


  it 'deberia devolver salida en pretty ordenamiento asc con numero 360 solo especificando nro' do

    lista_argumentos = OpenStruct.new
    lista_argumentos.numeroEntrada = 360
    validador = FactoresPrimos.new
    validador.recibirOpciones (lista_argumentos)
    validador.validarOpcionesDeCadaArgumento
    esperado = "Factores primos 360: 2 2 2 3 3 5 "
    expect(validador.obtenerSalida).to eq(esperado)
  end


  it 'deberia devolver salida en pretty ordenamiento asc con numero 360 especificando parametros' do

    lista_argumentos = OpenStruct.new
    lista_argumentos.numeroEntrada = 360
    lista_argumentos.formato_elegido = 'prETTy'
    lista_argumentos.sort_elegido = 'asC'
    validador = FactoresPrimos.new
    validador.recibirOpciones (lista_argumentos)
    validador.validarOpcionesDeCadaArgumento
    esperado = "Factores primos 360: 2 2 2 3 3 5 "
    expect(validador.obtenerSalida).to eq(esperado)
  end

  it 'deberia devolver salida en quiet ordenamiento asc con numero 360 especificando solo parametro de formato' do

    lista_argumentos = OpenStruct.new
    lista_argumentos.numeroEntrada = 360
    lista_argumentos.formato_elegido = 'Quiet'
    validador = FactoresPrimos.new
    validador.recibirOpciones (lista_argumentos)
    validador.validarOpcionesDeCadaArgumento
    esperado = "2" + "\n" + "2" + "\n" + "2" + "\n" + "3" + "\n" + "3" + "\n" + "5" + "\n"
    expect(validador.obtenerSalida).to eq(esperado)
  end

  it 'deberia devolver vacia la salida por especificar archivo con formaton pretty ordenamiento asc con numero 360' do

    lista_argumentos = OpenStruct.new
    lista_argumentos.numeroEntrada = 360
    lista_argumentos.formato_elegido = 'prETTy'
    lista_argumentos.nombre_archivo = 'pruebapretty.txt'
    lista_argumentos.sort_elegido = 'asC'
    validador = FactoresPrimos.new
    validador.recibirOpciones (lista_argumentos)
    validador.validarOpcionesDeCadaArgumento
    esperado = ""
    expect(validador.obtenerSalida).to eq(esperado)
  end

end