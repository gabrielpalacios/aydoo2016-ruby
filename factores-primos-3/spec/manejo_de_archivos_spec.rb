require 'rspec'
require_relative '../model/manejo_de_archivos'

describe 'ManejoDeArchivos' do

  it 'deberia escribir archivo prueba' do

    actual = ManejoDeArchivos.crearArchivo("1133.txt", "texto prueba")
    expect(actual).to be true

  end

  it 'deberia escribir archivo prueba multilinea' do

    actual = ManejoDeArchivos.crearArchivo("1133multilinea.txt", "texto prueba\notra linea")
    expect(actual).to be true

  end

  it 'deberia leer archivo prueba multilinea' do

    esperado = "texto prueba\notra linea\n"
    actual = ManejoDeArchivos.leerArchivo("1133multilinea.txt")
    expect(actual).to eq esperado

  end

end