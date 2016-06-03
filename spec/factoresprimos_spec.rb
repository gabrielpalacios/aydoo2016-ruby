require 'rspec' 
require_relative '../model/factoresprimos'

describe 'FactoresPrimos' do

	it 'testFactorizacionNumero_90' do
		objeto = FactoresPrimos.new
		vectorEsperado = [2,3,3,5]
		expect(objeto.factor(90)).to eq vectorEsperado
		
=begin
		Vector<Integer> vectorObtenido = FactoresPrimos.factor(90);
		Vector<Integer> vectorEsperado = new Vector<Integer>(4);
		vectorEsperado.add(2);
		vectorEsperado.add(3);
		vectorEsperado.add(3);
		vectorEsperado.add(5);
		Assert.assertEquals("Prueba exitosa", vectorEsperado, vectorObtenido);
=end
		
	end

end