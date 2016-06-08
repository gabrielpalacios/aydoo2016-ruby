require 'rspec' 
require_relative '../model/factores_primos'

describe 'FactoresPrimos' do

	it 'testFactorizacionNumero_90' do
		objeto = FactoresPrimos.new
		vectorEsperado = [2,3,3,5]
		expect(objeto.factor(90)).to eq vectorEsperado
	end

	it 'testFactorizacionNumero_360' do
		objeto = FactoresPrimos.new
		vectorEsperado = [2,2,2,3,3,5]
		expect(objeto.factor(360)).to eq vectorEsperado
	end


	it 'testFactorizacionNumero_2' do
		objeto = FactoresPrimos.new
		vectorEsperado = [2]
		expect(objeto.factor(2)).to eq vectorEsperado
	end

	it 'testFactorizacionNumero_-1dara2' do
		objeto = FactoresPrimos.new
		vectorEsperado = 2
		expect(objeto.factor(-1)).to eq vectorEsperado
	end
end