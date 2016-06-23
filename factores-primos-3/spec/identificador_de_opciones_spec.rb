require 'rspec'
require 'ostruct'
require_relative '../model/identificador_de_opciones'

describe 'IdentificadoDeOpciones' do

  it 'identifica format pretty valido' do

    args = [123, "--format=pretty"]
    objetoEstructura = IdentificadorDeOpciones.parsearOpciones(args)
    esperado = 'pretty'
    expect(objetoEstructura.formato_elegido).to eq(esperado)
  end

  it 'identifica un argumento invalido' do

    args = [123, "--miformatoquieroquesea=fruta"]
    expect { IdentificadorDeOpciones.parsearOpciones(args) }.to raise_error(ArgumentosInvalidosError)
  end


  it 'identifica un 1er argumento de numero invalido' do

    args = [-14]
    expect { IdentificadorDeOpciones.parsearOpciones(args) }.to raise_error(PrimerArgumentoNoEsNumeroValidoError)
  end

  it 'identifica un 1er argumento de numero invalido aun con format' do

    args = [-123, "--miformatoquieroquesea=fruta"]
    expect { IdentificadorDeOpciones.parsearOpciones(args) }.to raise_error(PrimerArgumentoNoEsNumeroValidoError)
  end

  it 'identifica primer argumento no numerico' do

    args = ["r"]
    expect { IdentificadorDeOpciones.parsearOpciones(args) }.to raise_error(PrimerArgumentoNoEsNumeroError)
  end

  it 'identifica cuando no hay ningun argumento' do

    args = []
    expect { IdentificadorDeOpciones.validarCantidadArgumentos(args) }.to raise_error(SinArgumentosError)
  end

  it 'identifica cuando hay mas de 4 argumentos todos numeros' do

    args = [1, 2, 3, 4, 5]
    expect { IdentificadorDeOpciones.validarCantidadArgumentos(args) }.to raise_error(NumeroDeArgumentosExcedidoError)
  end
  it 'identifica cuando hay mas de 4 argumentos numeros y textos' do

    args = [1, "2", "3", "4", "5"]
    expect { IdentificadorDeOpciones.validarCantidadArgumentos(args) }.to raise_error(NumeroDeArgumentosExcedidoError)
  end

  it 'identifica sort asc valido' do

    args = [123, "--sort=asc"]
    objetoEstructura = IdentificadorDeOpciones.parsearOpciones(args)
    esperado = 'asc'
    expect(objetoEstructura.sort_elegido).to eq(esperado)
  end

  it 'identifica sort asc valido mayuscula' do

    args = [123, "--sort=aSC"]
    objetoEstructura = IdentificadorDeOpciones.parsearOpciones(args)
    esperado = 'aSC'
    expect(objetoEstructura.sort_elegido).to eq(esperado)
  end

  it 'identifica nombre de archivo valido' do

    args = [123, "--output-file=hola.txt"]
    objetoEstructura = IdentificadorDeOpciones.parsearOpciones(args)
    esperado = 'hola.txt'
    expect(objetoEstructura.nombre_archivo).to eq(esperado)
  end

  it 'identifica todos los parametros posibles en simultaneo' do

    args = [123, "--output-file=hola.txt", "--sort=asc", "--format=pretty"]
    objetoEstructura = IdentificadorDeOpciones.parsearOpciones(args)
    esperado1 = 'hola.txt'
    expect(objetoEstructura.nombre_archivo).to eq(esperado1)
    esperado2 = 'asc'
    expect(objetoEstructura.sort_elegido).to eq(esperado2)
    esperado3 = 'pretty'
    expect(objetoEstructura.formato_elegido).to eq(esperado3)
    esperado4 = 123
    expect(objetoEstructura.numeroEntrada).to eq(esperado4)
  end

  it 'identifica solo el 1er parametro de numero de entrada' do

    args = [123]
    objetoEstructura = IdentificadorDeOpciones.parsearOpciones(args)
    esperado4 = 123
    expect(objetoEstructura.numeroEntrada).to eq(esperado4)
  end
end
